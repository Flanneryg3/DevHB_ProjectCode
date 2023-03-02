#!/bin/bash

#####################################################
# define variables

# extract mean non-zero beta weights for each ROI for each subject and for each contrast
#####################################################
# Jessica S. Flannery


roi_path=''
data_path=''
out_dir=''
ROIs=''

subjects='001 044 085 124 158 003 045 086 125 160 004 046 087 126 161 005 047 088 128 162 006 048 089 130 163 007 054 090 131 166 008 055 092 132 167 009 056 093 133 169 010 057 095 134 170 011 058 096 135 172 012 059 097 136 173 013 060 098 137 174 015 061 099 138 175 017 062 102 139 176 018 063 103 140 178 019 064 104 141 179 022 065 106 142 182 023 068 107 143 184 024 070 108 144 185 025 071 110 145 186 026 072 111 147 187 027 074 112 148 188 028 075 114 149 189 029 077 115 150 190 030 078 116 151 191 032 079 117 153 192 037 080 118 154 999 038 081 119 155 040 083 122 156 043 084 123 157'


w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060 061 064 065 068 070 071 072 074 075 077 078 079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

#063

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172	173 175 176 182 184 185 186 187 188 189 190 191	999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

#122

w3_subjects='003 005 006 008 009 010 011 012 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 123 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'
#################################################################################################
#  WAVE 1
#################################################################################################


#####################################################
# extract mean beta values (excluding zero) within HB rois
#for each contract, hemishere, wave, and subject
#####################################################


cd ${out_dir}/
for r in ${ROIs}; do
	dir=./B_VS_beta-output
	if [ -d "$dir" ]; then
		echo "output dir already exsits"
	fi
	mkdir B_VS_beta-output
	for sub in ${w1_subjects}; do

		rm ${out_dir}/B_VS_beta-output/B_VS_*_001_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[39]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_Ncue_001_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[41]' > ${out_dir}/B_VS_beta-output/B_VS_Pcue_Ncue_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[21]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_Rmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[23]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_Phit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[25]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_Nhit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[27]' > ${out_dir}/B_VS_beta-output/B_VS_Rmiss_Nmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[29]' > ${out_dir}/B_VS_beta-output/B_VS_Phit_Nhit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[31]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_Nmiss_001_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[43]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_Pcue_001_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[17]' > ${out_dir}/B_VS_beta-output/B_VS_Pcue_001_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[14]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_001_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[15]' > ${out_dir}/B_VS_beta-output/B_VS_Ncue_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[1]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[3]' > ${out_dir}/B_VS_beta-output/B_VS_Rmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[7]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[5]' > ${out_dir}/B_VS_beta-output/B_VS_Phit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[11]' > ${out_dir}/B_VS_beta-output/B_VS_Nmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-REML+tlrc.BRIK'[9]' > ${out_dir}/B_VS_beta-output/B_VS_Nhit_001_${sub}.txt

	done
done


cd ${data_path}/ROIextract/
for r in ${ROIs}; do
	for sub in ${w2_subjects}; do

		rm ${out_dir}/B_VS_beta-output/B_VS_*_002_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[39]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_Ncue_002_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[41]' > ${out_dir}/B_VS_beta-output/B_VS_Pcue_Ncue_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[21]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_Rmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[23]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_Phit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[25]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_Nhit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[27]' > ${out_dir}/B_VS_beta-output/B_VS_Rmiss_Nmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[29]' > ${out_dir}/B_VS_beta-output/B_VS_Phit_Nhit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[31]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_Nmiss_002_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[43]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_Pcue_002_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[17]' > ${out_dir}/B_VS_beta-output/B_VS_Pcue_002_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[14]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_002_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[15]' > ${out_dir}/B_VS_beta-output/B_VS_Ncue_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[1]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[3]' > ${out_dir}/B_VS_beta-output/B_VS_Rmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[7]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[5]' > ${out_dir}/B_VS_beta-output/B_VS_Phit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[11]' > ${out_dir}/B_VS_beta-output/B_VS_Nmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-REML+tlrc.BRIK'[9]' > ${out_dir}/B_VS_beta-output/B_VS_Nhit_002_${sub}.txt

	done
done


cd ${data_path}/ROIextract/
for r in ${ROIs}; do
	for sub in ${w3_subjects}; do

		rm ${out_dir}/B_VS_beta-output/B_VS_*_003_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[39]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_Ncue_003_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[41]' > ${out_dir}/B_VS_beta-output/B_VS_Pcue_Ncue_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[21]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_Rmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[23]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_Phit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[25]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_Nhit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[27]' > ${out_dir}/B_VS_beta-output/B_VS_Rmiss_Nmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[29]' > ${out_dir}/B_VS_beta-output/B_VS_Phit_Nhit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[31]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_Nmiss_003_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[43]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_Pcue_003_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[17]' > ${out_dir}/B_VS_beta-output/B_VS_Pcue_003_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[14]' > ${out_dir}/B_VS_beta-output/B_VS_Rcue_003_${sub}.txt

		#3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[15]' > ${out_dir}/B_VS_beta-output/B_VS_Ncue_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[1]' > ${out_dir}/B_VS_beta-output/B_VS_Rhit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[3]' > ${out_dir}/B_VS_beta-output/B_VS_Rmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[7]' > ${out_dir}/B_VS_beta-output/B_VS_Pmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[5]' > ${out_dir}/B_VS_beta-output/B_VS_Phit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[11]' > ${out_dir}/B_VS_beta-output/B_VS_Nmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-REML+tlrc.BRIK'[9]' > ${out_dir}/B_VS_beta-output/B_VS_Nhit_003_${sub}.txt

	done
done


###########################################
#put all subjects in one file
###########################################

for r in ${ROIs}; do
	cd ${outdir}/B_VS_beta-output/
	rm CAT_w2*_B_VS_betas.txt
	cat B_VS_Rhit_Rmiss_002_*.txt > CAT_w2_Rhit-Rmiss_B_VS_betas.txt
	cat B_VS_Pmiss_Phit_002_*.txt > CAT_w2_Pmiss-Phit_B_VS_betas.txt
	cat B_VS_Rhit_Nhit_002_*.txt > CAT_w2_Rhit_Nhit_B_VS_betas.txt
	cat B_VS_Rmiss_Nmiss_002_*.txt > CAT_w2_Rmiss_Nmiss_B_VS_betas.txt
	cat B_VS_Phit_Nhit_002_*.txt > CAT_w2_Phit_Nhit_B_VS_betas.txt
	cat B_VS_Pmiss_Nmiss_002_*.txt > CAT_w2_Pmiss_Nmiss_B_VS_betas.txt
	cat B_VS_Rhit_002_*.txt > CAT_w2_Rhit_B_VS_betas.txt
	cat B_VS_Phit_002_*.txt > CAT_w2_Phit_B_VS_betas.txt
	cat B_VS_Rmiss_002_*.txt > CAT_w2_Rmiss_B_VS_betas.txt
	cat B_VS_Pmiss_002_*.txt > CAT_w2_Pmiss_B_VS_betas.txt
	cat B_VS_Nhit_002_*.txt > CAT_w2_Nhit_B_VS_betas.txt
	cat B_VS_Nmiss_002_*.txt > CAT_w2_Nmiss_B_VS_betas.txt
done

for r in ${ROIs}; do
	cd ${outdir}/B_VS_beta-output/
	rm CAT_w1*_B_VS_betas.txt
	cat B_VS_Rhit_Rmiss_001_*.txt > CAT_w1_Rhit-Rmiss_B_VS_betas.txt
	cat B_VS_Pmiss_Phit_001_*.txt > CAT_w1_Pmiss-Phit_B_VS_betas.txt
	cat B_VS_Rhit_Nhit_001_*.txt > CAT_w1_Rhit_Nhit_B_VS_betas.txt
	cat B_VS_Rmiss_Nmiss_001_*.txt > CAT_w1_Rmiss_Nmiss_B_VS_betas.txt
	cat B_VS_Phit_Nhit_001_*.txt > CAT_w1_Phit_Nhit_B_VS_betas.txt
	cat B_VS_Pmiss_Nmiss_001_*.txt > CAT_w1_Pmiss_Nmiss_B_VS_betas.txt
	cat B_VS_Rhit_001_*.txt > CAT_w1_Rhit_B_VS_betas.txt
	cat B_VS_Phit_001_*.txt > CAT_w1_Phit_B_VS_betas.txt
	cat B_VS_Rmiss_001_*.txt > CAT_w1_Rmiss_B_VS_betas.txt
	cat B_VS_Pmiss_001_*.txt > CAT_w1_Pmiss_B_VS_betas.txt
	cat B_VS_Nhit_001_*.txt > CAT_w1_Nhit_B_VS_betas.txt
	cat B_VS_Nmiss_001_*.txt > CAT_w1_Nmiss_B_VS_betas.txt
done

for r in ${ROIs}; do
	cd ${outdir}/B_VS_beta-output/
	rm CAT_w3*_B_VS_betas.txt
	cat B_VS_Rhit_Rmiss_003_*.txt > CAT_w3_Rhit-Rmiss_B_VS_betas.txt
	cat B_VS_Pmiss_Phit_003_*.txt > CAT_w3_Pmiss_Phit_B_VS_betas.txt
	cat B_VS_Rhit_Nhit_003_*.txt > CAT_w3_Rhit_Nhit_B_VS_betas.txt
	cat B_VS_Rmiss_Nmiss_003_*.txt > CAT_w3_Rmiss_Nmiss_B_VS_betas.txt
	cat B_VS_Phit_Nhit_003_*.txt > CAT_w3_Phit_Nhit_B_VS_betas.txt
	cat B_VS_Pmiss_Nmiss_003_*.txt > CAT_w3_Pmiss_Nmiss_B_VS_betas.txt
	cat B_VS_Rhit_003_*.txt > CAT_w3_Rhit_B_VS_betas.txt
	cat B_VS_Phit_003_*.txt > CAT_w3_Phit_B_VS_betas.txt
	cat B_VS_Rmiss_003_*.txt > CAT_w3_Rmiss_B_VS_betas.txt
	cat B_VS_Pmiss_003_*.txt > CAT_w3_Pmiss_B_VS_betas.txt
	cat B_VS_Nhit_003_*.txt > CAT_w3_Nhit_B_VS_betas.txt
	cat B_VS_Nmiss_003_*.txt > CAT_w3_Nmiss_B_VS_betas.txt
done

######################################################
#move final output to easily accessable place
#####################################################
