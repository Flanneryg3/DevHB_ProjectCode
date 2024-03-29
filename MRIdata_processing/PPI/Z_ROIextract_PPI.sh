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

w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060 061 064 065 068 070 071 072 074 075 077 078 079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172	173 175 176 182 184 185 186 187 188 189 190 191	999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

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
	dir=./Z_PPI_beta-output
	if [ -d "$dir" ]; then
		echo "output dir already exsits"
	fi
	mkdir Z_PPI_beta-output
	for sub in ${w1_subjects}; do

		rm ${out_dir}/Z_PPI_beta-output/VS-HB_*_001_${sub}.txt
		rm ${out_dir}/Z_PPI_beta-output/HB-VS_*_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Rhit-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Rhit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Rmiss-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Rmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Phit-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Phit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Pmiss-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Pmiss_001_${sub}.txt



		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Rhit-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Rhit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Rmiss-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Rmiss_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Phit-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Phit_001_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess001-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess001/func/Pmiss-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Pmiss_001_${sub}.txt



	done
done


cd ${data_path}/ROIextract/
for r in ${ROIs}; do
	for sub in ${w2_subjects}; do

		rm ${out_dir}/Z_PPI_beta-output/VS-HB_*_002_${sub}.txt
		rm ${out_dir}/Z_PPI_beta-output/HB-VS_*_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Rhit-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Rhit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Rmiss-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Rmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Phit-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Phit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Pmiss-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Pmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Rhit-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Rhit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Rmiss-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Rmiss_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Phit-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Phit_002_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess002-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess002/func/Pmiss-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Pmiss_002_${sub}.txt


	done
done


cd ${data_path}/ROIextract/
for r in ${ROIs}; do
	for sub in ${w3_subjects}; do

		rm ${out_dir}/Z_PPI_beta-output/VS-HB_*_003_${sub}.txt
		rm ${out_dir}/Z_PPI_beta-output/HB-VS_*_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Rhit-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Rhit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Rmiss-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Rmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Phit-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Phit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bhb+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Pmiss-VS-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/VS-HB_Pmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Rhit-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Rhit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Rmiss-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Rmiss_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Phit-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Phit_003_${sub}.txt

		3dROIstats -mask ${roi_path}/sub-${sub}sess003-Bvs+tlrc.BRIK -nzmean ${data_path}/sub-${sub}sess003/func/Pmiss-HB-zscore+tlrc.BRIK > ${out_dir}/Z_PPI_beta-output/HB-VS_Pmiss_003_${sub}.txt

	done
done


###########################################
#put all subjects in one file
###########################################

for r in ${ROIs}; do
	cd ${out_dir}/Z_PPI_beta-output/
	rm CAT_w1*_VS-HB_betas.txt
	rm CAT_w1*_HB-VS_betas.txt


	cat VS-HB_Rhit_001_*.txt > CAT_w1_Rhit_VS-HB_betas.txt

	cat VS-HB_Rmiss_001_*.txt > CAT_w1_Rmiss_VS-HB_betas.txt

	cat VS-HB_Phit_001_*.txt > CAT_w1_Phit_VS-HB_betas.txt

	cat VS-HB_Pmiss_001_*.txt > CAT_w1_Pmiss_VS-HB_betas.txt


	cat HB-VS_Rhit_001_*.txt > CAT_w1_Rhit_HB-VS_betas.txt

	cat HB-VS_Rmiss_001_*.txt > CAT_w1_Rmiss_HB-VS_betas.txt

	cat HB-VS_Phit_001_*.txt > CAT_w1_Phit_HB-VS_betas.txt

	cat HB-VS_Pmiss_001_*.txt > CAT_w1_Pmiss_HB-VS_betas.txt
done

for r in ${ROIs}; do
	cd ${out_dir}/Z_PPI_beta-output/
	rm CAT_w2*_VS-HB_betas.txt
	rm CAT_w2*_HB-VS_betas.txt


	cat VS-HB_Rhit_002_*.txt > CAT_w2_Rhit_VS-HB_betas.txt

	cat VS-HB_Rmiss_002_*.txt > CAT_w2_Rmiss_VS-HB_betas.txt

	cat VS-HB_Phit_002_*.txt > CAT_w2_Phit_VS-HB_betas.txt

	cat VS-HB_Pmiss_002_*.txt > CAT_w2_Pmiss_VS-HB_betas.txt


	cat HB-VS_Rhit_002_*.txt > CAT_w2_Rhit_HB-VS_betas.txt

	cat HB-VS_Rmiss_002_*.txt > CAT_w2_Rmiss_HB-VS_betas.txt

	cat HB-VS_Phit_002_*.txt > CAT_w2_Phit_HB-VS_betas.txt

	cat HB-VS_Pmiss_002_*.txt > CAT_w2_Pmiss_HB-VS_betas.txt
done

for r in ${ROIs}; do
	cd ${out_dir}/Z_PPI_beta-output/
	rm CAT_w3*_VS-HB_betas.txt
	rm CAT_w3*_HB-VS_betas.txt


	cat VS-HB_Rhit_003_*.txt > CAT_w3_Rhit_VS-HB_betas.txt

	cat VS-HB_Rmiss_003_*.txt > CAT_w3_Rmiss_VS-HB_betas.txt

	cat VS-HB_Phit_003_*.txt > CAT_w3_Phit_VS-HB_betas.txt

	cat VS-HB_Pmiss_003_*.txt > CAT_w3_Pmiss_VS-HB_betas.txt


	cat HB-VS_Rhit_003_*.txt > CAT_w3_Rhit_HB-VS_betas.txt

	cat HB-VS_Rmiss_003_*.txt > CAT_w3_Rmiss_HB-VS_betas.txt

	cat HB-VS_Phit_003_*.txt > CAT_w3_Phit_HB-VS_betas.txt

	cat HB-VS_Pmiss_003_*.txt > CAT_w3_Pmiss_HB-VS_betas.txt


done

######################################################
#move final output to easily accessable place
#####################################################
