#!/bin/bash


#################################################################################################
#  Overlap or GM and CSF with HB rois
#################################################################################################
#author: Jessica S. Flannery

runs='1 2'


w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060 061 064 065 068 070 071 072 074 075 077 078 079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

w3_subjects='003 005 006 008 009 010 011 012 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 123 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'

temppath=''
pathtofmriprep=''
pathtopostdata=''
pathtoatlas=''
outpath=''
info_outpath=''
#########################################################################################################################
#########################################################################################################################
# WAVE 1
#########################################################################################################################
#########################################################################################################################

for sub in ${w1_subjects}; do
	cd ${temppath}/
	#move fmriprep segmentation file
	cp  ${pathtofmriprep}/sub-${sub}sess001/anat/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg.nii.gz ${temppath}/
	gunzip ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg.nii.gz
	3dcopy ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg.nii ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg

	#put segmentation file in functional space
	3dresample -master ${pathtopostdata}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes2_norm+tlrc.BRIK -prefix ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -input ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg+tlrc.BRIK
	#put Hb mask file in functional space
	3dresample -master ${pathtopostdata}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes2_norm+tlrc.BRIK -prefix ${temppath}/sub-${sub}sess001-Bhb_funcspace+tlrc -input ${pathtoatlas}/Bhb_atlas_norm+tlrc.BRIK


	#make 2mm function space GM and CSF masks
	3dcalc -a ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -expr 'equals(a,1)' -prefix sub-${sub}sess001-GM_temp_funcspace
	3dcalc -a sub-${sub}sess001-GM_temp_funcspace+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess001-GM_funcspace+tlrc
	cp ${temppath}/sub-${sub}sess001-GM_funcspace+tlrc* ${outpath}/

	3dcalc -a ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -expr 'equals(a,3)' -prefix sub-${sub}sess001-CSF_temp_funcspace
	3dcalc -a sub-${sub}sess001-CSF_temp_funcspace+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess001-CSF_funcspace+tlrc
	cp ${temppath}/sub-${sub}sess001-CSF_funcspace+tlrc* ${outpath}/

	#make anatomical space GM and CSF masks
	3dcalc -a ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg+tlrc -expr 'equals(a,1)' -prefix sub-${sub}sess001-GM_temp
	3dcalc -a sub-${sub}sess001-GM_temp+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess001-GM+tlrc
	cp ${temppath}/sub-${sub}sess001-GM+tlrc* ${outpath}/

	3dcalc -a ${temppath}/sub-${sub}sess001_space-MNI152NLin2009cAsym_dseg+tlrc -expr 'equals(a,3)' -prefix sub-${sub}sess001-CSF_temp
	3dcalc -a sub-${sub}sess001-CSF_temp+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess001-CSF+tlrc
	cp ${temppath}/sub-${sub}sess001-CSF+tlrc* ${outpath}/

	#calcuate csf and hb functional overlap image
	rm ${temppath}/sub-${sub}sess001-csf_hb_overlap*
	3dcalc -a ${temppath}/sub-${sub}sess001-Bhb_funcspace+tlrc.BRIK -b ${outpath}/sub-${sub}sess001-CSF_funcspace+tlrc -expr 'a+b' -prefix ${temppath}/sub-${sub}sess001-csf_hb_overlap_temp

	3dcalc -a ${temppath}/sub-${sub}sess001-csf_hb_overlap_temp+tlrc -expr 'ispositive(a)' -prefix ${temppath}/sub-${sub}sess001-csf_hb_overlap

	#calcuate gm and hb functional overlap image
	rm ${temppath}/sub-${sub}sess001-gm_hb_overlap*
	3dcalc -a ${temppath}/sub-${sub}sess001-Bhb_funcspace+tlrc.BRIK -b ${outpath}/sub-${sub}sess001-GM_funcspace+tlrc -expr 'a+b' -prefix ${temppath}/sub-${sub}sess001-gm_hb_overlap_temp

	3dcalc -a ${temppath}/sub-${sub}sess001-gm_hb_overlap_temp+tlrc -expr 'ispositive(a)' -prefix ${temppath}/sub-${sub}sess001-gm_hb_overlap


	#subtract gm mask alone from gm+hb mask
	rm ${temppath}/sub-${sub}sess001-hb-outside-gm*
	3dcalc -a ${temppath}/sub-${sub}sess001-gm_hb_overlap+tlrc -b ${outpath}/sub-${sub}sess001-GM_funcspace+tlrc -expr 'a-b' -prefix ${temppath}/sub-${sub}sess001-hb-outside-gm

	#calculate number of voxels in hb-outsdie-gm
	rm ${info_outpath}/sub-${sub}sess001-HB-outside-GM.txt
	3dBrickStat -count -non-zero ${temppath}/sub-${sub}sess001-hb-outside-gm+tlrc > ${info_outpath}/sub-${sub}sess001-HB-outside-GM.txt


	#make subject spesifc HB roi with CSF subtracted!
	rm ${pathtoatlas}/sub-${sub}sess001-Bhb+tlrc*
	3dcalc -a ${temppath}/sub-${sub}sess001-Bhb_funcspace+tlrc.BRIK -b ${temppath}/sub-${sub}sess001-hb-outside-gm+tlrc -expr 'a-b' -prefix ${pathtoatlas}/sub-${sub}sess001-Bhb

	#calculate number of voxels in subject spesifc hb mask
	rm ${info_outpath}/sub-${sub}sess001-HB-size.txt
	3dBrickStat -count -non-zero ${pathtoatlas}/sub-${sub}sess001-Bhb+tlrc > ${info_outpath}/sub-${sub}sess001-HB-size.txt

done

#########################################################################################################################
#########################################################################################################################
# WAVE 2
#########################################################################################################################
#########################################################################################################################


for sub in ${w2_subjects}; do
	cd ${temppath}/
	#move fmriprep segmentation file
	cp  ${pathtofmriprep}/sub-${sub}sess002/anat/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg.nii.gz ${temppath}/
	gunzip ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg.nii.gz
	3dcopy ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg.nii ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg

	#put segmentation file in functional space
	3dresample -master ${pathtopostdata}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes2_norm+tlrc.BRIK -prefix ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -input ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg+tlrc.BRIK
	#put Hb mask file in functional space
	3dresample -master ${pathtopostdata}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes2_norm+tlrc.BRIK -prefix ${temppath}/sub-${sub}sess002-Bhb_funcspace+tlrc -input ${pathtoatlas}/Bhb_atlas_norm+tlrc.BRIK


	#make 2mm function space GM and CSF masks
	3dcalc -a ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -expr 'equals(a,1)' -prefix sub-${sub}sess002-GM_temp_funcspace
	3dcalc -a sub-${sub}sess002-GM_temp_funcspace+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess002-GM_funcspace+tlrc
	cp ${temppath}/sub-${sub}sess002-GM_funcspace+tlrc* ${outpath}/

	3dcalc -a ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -expr 'equals(a,3)' -prefix sub-${sub}sess002-CSF_temp_funcspace
	3dcalc -a sub-${sub}sess002-CSF_temp_funcspace+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess002-CSF_funcspace+tlrc
	cp ${temppath}/sub-${sub}sess002-CSF_funcspace+tlrc* ${outpath}/

	#make anatomical space GM and CSF masks
	3dcalc -a ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg+tlrc -expr 'equals(a,1)' -prefix sub-${sub}sess002-GM_temp
	3dcalc -a sub-${sub}sess002-GM_temp+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess002-GM+tlrc
	cp ${temppath}/sub-${sub}sess002-GM+tlrc* ${outpath}/

	3dcalc -a ${temppath}/sub-${sub}sess002_space-MNI152NLin2009cAsym_dseg+tlrc -expr 'equals(a,3)' -prefix sub-${sub}sess002-CSF_temp
	3dcalc -a sub-${sub}sess002-CSF_temp+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess002-CSF+tlrc
	cp ${temppath}/sub-${sub}sess002-CSF+tlrc* ${outpath}/

	#calcuate csf and hb functional overlap image
	rm ${temppath}/sub-${sub}sess002-csf_hb_overlap*
	3dcalc -a ${temppath}/sub-${sub}sess002-Bhb_funcspace+tlrc.BRIK -b ${outpath}/sub-${sub}sess002-CSF_funcspace+tlrc -expr 'a+b' -prefix ${temppath}/sub-${sub}sess002-csf_hb_overlap_temp

	3dcalc -a ${temppath}/sub-${sub}sess002-csf_hb_overlap_temp+tlrc -expr 'ispositive(a)' -prefix ${temppath}/sub-${sub}sess002-csf_hb_overlap

	#calcuate gm and hb functional overlap image
	rm ${temppath}/sub-${sub}sess002-gm_hb_overlap*
	3dcalc -a ${temppath}/sub-${sub}sess002-Bhb_funcspace+tlrc.BRIK -b ${outpath}/sub-${sub}sess002-GM_funcspace+tlrc -expr 'a+b' -prefix ${temppath}/sub-${sub}sess002-gm_hb_overlap_temp

	3dcalc -a ${temppath}/sub-${sub}sess002-gm_hb_overlap_temp+tlrc -expr 'ispositive(a)' -prefix ${temppath}/sub-${sub}sess002-gm_hb_overlap

	#subtract gm mask alone from gm+hb mask
	rm ${temppath}/sub-${sub}sess002-hb-outside-gm*
	3dcalc -a ${temppath}/sub-${sub}sess002-gm_hb_overlap+tlrc -b ${outpath}/sub-${sub}sess002-GM_funcspace+tlrc -expr 'a-b' -prefix ${temppath}/sub-${sub}sess002-hb-outside-gm

	#calculate number of voxels in hb-outsdie-gm
	rm ${info_outpath}/sub-${sub}sess002-HB-outside-GM.txt
	3dBrickStat -count -non-zero ${temppath}/sub-${sub}sess002-hb-outside-gm+tlrc > ${info_outpath}/sub-${sub}sess002-HB-outside-GM.txt

	#make subject spesifc HB roi with CSF subtracted!
	rm ${pathtoatlas}/sub-${sub}sess002-Bhb+tlrc*
	3dcalc -a ${temppath}/sub-${sub}sess002-Bhb_funcspace+tlrc.BRIK -b ${temppath}/sub-${sub}sess002-hb-outside-gm+tlrc -expr 'a-b' -prefix ${pathtoatlas}/sub-${sub}sess002-Bhb

	#calculate number of voxels in subject spesifc hb mask
	rm ${info_outpath}/sub-${sub}sess002-HB-size.txt
	3dBrickStat -count -non-zero ${pathtoatlas}/sub-${sub}sess002-Bhb+tlrc > ${info_outpath}/sub-${sub}sess002-HB-size.txt

done


#########################################################################################################################
#########################################################################################################################
# WAVE 3
#########################################################################################################################
#########################################################################################################################


for sub in ${w3_subjects}; do
	cd ${temppath}/
	#move fmriprep segmentation file
	cp  ${pathtofmriprep}/sub-${sub}sess003/anat/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg.nii.gz ${temppath}/
	gunzip ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg.nii.gz
	3dcopy ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg.nii ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg

	#put segmentation file in functional space
	3dresample -master ${pathtopostdata}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes2_norm+tlrc.BRIK -prefix ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -input ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg+tlrc.BRIK
	#put Hb mask file in functional space
	3dresample -master ${pathtopostdata}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes2_norm+tlrc.BRIK -prefix ${temppath}/sub-${sub}sess003-Bhb_funcspace+tlrc -input ${pathtoatlas}/Bhb_atlas_norm+tlrc.BRIK


	#make 2mm function space GM and CSF masks
	3dcalc -a ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -expr 'equals(a,1)' -prefix sub-${sub}sess003-GM_temp_funcspace
	3dcalc -a sub-${sub}sess003-GM_temp_funcspace+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess003-GM_funcspace+tlrc
	cp ${temppath}/sub-${sub}sess003-GM_funcspace+tlrc* ${outpath}/

	3dcalc -a ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg_funcspace+tlrc -expr 'equals(a,3)' -prefix sub-${sub}sess003-CSF_temp_funcspace
	3dcalc -a sub-${sub}sess003-CSF_temp_funcspace+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess003-CSF_funcspace+tlrc
	cp ${temppath}/sub-${sub}sess003-CSF_funcspace+tlrc* ${outpath}/

	#make anatomical space GM and CSF masks
	3dcalc -a ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg+tlrc -expr 'equals(a,1)' -prefix sub-${sub}sess003-GM_temp
	3dcalc -a sub-${sub}sess003-GM_temp+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess003-GM+tlrc
	cp ${temppath}/sub-${sub}sess003-GM+tlrc* ${outpath}/

	3dcalc -a ${temppath}/sub-${sub}sess003_space-MNI152NLin2009cAsym_dseg+tlrc -expr 'equals(a,3)' -prefix sub-${sub}sess003-CSF_temp
	3dcalc -a sub-${sub}sess003-CSF_temp+tlrc -expr 'ispositive(a)' -prefix sub-${sub}sess003-CSF+tlrc
	cp ${temppath}/sub-${sub}sess003-CSF+tlrc* ${outpath}/

	#calcuate csf and hb functional overlap image
	rm ${temppath}/sub-${sub}sess003-csf_hb_overlap*
	3dcalc -a ${temppath}/sub-${sub}sess003-Bhb_funcspace+tlrc.BRIK -b ${outpath}/sub-${sub}sess003-CSF_funcspace+tlrc -expr 'a+b' -prefix ${temppath}/sub-${sub}sess003-csf_hb_overlap_temp

	3dcalc -a ${temppath}/sub-${sub}sess003-csf_hb_overlap_temp+tlrc -expr 'ispositive(a)' -prefix ${temppath}/sub-${sub}sess003-csf_hb_overlap

	#calcuate gm and hb functional overlap image
	rm ${temppath}/sub-${sub}sess003-gm_hb_overlap*
	3dcalc -a ${temppath}/sub-${sub}sess003-Bhb_funcspace+tlrc.BRIK -b ${outpath}/sub-${sub}sess003-GM_funcspace+tlrc -expr 'a+b' -prefix ${temppath}/sub-${sub}sess003-gm_hb_overlap_temp

	3dcalc -a ${temppath}/sub-${sub}sess003-gm_hb_overlap_temp+tlrc -expr 'ispositive(a)' -prefix ${temppath}/sub-${sub}sess003-gm_hb_overlap


	#subtract gm mask alone from gm+hb mask
	rm ${temppath}/sub-${sub}sess003-hb-outside-gm*
	3dcalc -a ${temppath}/sub-${sub}sess003-gm_hb_overlap+tlrc -b ${outpath}/sub-${sub}sess003-GM_funcspace+tlrc -expr 'a-b' -prefix ${temppath}/sub-${sub}sess003-hb-outside-gm

	#calculate number of voxels in hb-outsdie-gm
	rm ${info_outpath}/sub-${sub}sess003-HB-outside-GM.txt
	3dBrickStat -count -non-zero ${temppath}/sub-${sub}sess003-hb-outside-gm+tlrc > ${info_outpath}/sub-${sub}sess003-HB-outside-GM.txt


	#make subject spesifc HB roi with CSF subtracted!
	rm ${pathtoatlas}/sub-${sub}sess003-Bhb+tlrc*
	3dcalc -a ${temppath}/sub-${sub}sess003-Bhb_funcspace+tlrc.BRIK -b ${temppath}/sub-${sub}sess003-hb-outside-gm+tlrc -expr 'a-b' -prefix ${pathtoatlas}/sub-${sub}sess003-Bhb

	#calculate number of voxels in subject spesifc hb mask
	rm ${info_outpath}/sub-${sub}sess003-HB-size.txt
	3dBrickStat -count -non-zero ${pathtoatlas}/sub-${sub}sess003-Bhb+tlrc > ${info_outpath}/sub-${sub}sess003-HB-size.txt
done
