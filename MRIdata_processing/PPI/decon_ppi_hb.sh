#!/bin/bash


#################################################################################################
#  PPI: FIRST LEVEL SOICAL INCENTIVE DELAY REGRESSIONS
#################################################################################################
#author: Jessica S. Flannery

runs='1 2'


w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060 061 064 065 068 070 071 072 074 075 077 078 079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

w3_subjects='003 005 006 008 009 010 011 012 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 123 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'

#################################################################################################
#  WAVE 1
#################################################################################################
datapath=''


for sub in ${w1_subjects}; do
	cd ${datapath}/sub-${sub}sess001/func/

	rm *${sub}sess001-SID-PPI-HB-x1D*
	rm *${sub}sess001-SID-PPI-HB-REML*
	rm *SID-PPI-HB-xjpeg*

	3dDeconvolve \
	-jobs 6 \
	-mask ${datapath}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes1_space-MNI152NLin2009cAsym_desc-brain_mask_2mm+tlrc \
	-polort A \
	-x1D_stop \
	-input sub-${sub}sess001_task-Shapes1_norm+tlrc.BRIK sub-${sub}sess001_task-Shapes2_norm+tlrc.BRIK \
	-censor concat-censor_09.txt \
	-ortvec Shapes-concat-motion_csf.txt mopars \
	-stim_times_subtract 1 \
	-num_stimts 14 \
	-stim_times 1 Rhit.txt SPMG1 -stim_label 1 Rhit \
	-stim_times 2 Rmiss.txt SPMG1 -stim_label 2 Rmiss \
	-stim_times 3 Phit.txt SPMG1 -stim_label 3 Phit \
	-stim_times 4 Pmiss.txt SPMG1 -stim_label 4 Pmiss \
	-stim_times 5 Nhit.txt SPMG1 -stim_label 5 Nhit \
	-stim_times 6 Nmiss.txt SPMG1 -stim_label 6 Nmiss \
	-stim_times 7 reward_cue.txt SPMG1 -stim_label 7 Rcue \
	-stim_times 8 neutral_cue.txt SPMG1 -stim_label 8 Ncue \
	-stim_times 9 punish_cue.txt SPMG1 -stim_label 9 Pcue \
	-stim_file 10 sub-${sub}sess001-Bhb-concat_Neur_t.1D -stim_label 10 HB \
	-stim_file 11 sub-${sub}sess001-Bhb-Inter_Rhit_concat.1D -stim_label 11 RhitHB \
	-stim_file 12 sub-${sub}sess001-Bhb-Inter_Rmiss_concat.1D -stim_label 12 RmissHB \
	-stim_file 13 sub-${sub}sess001-Bhb-Inter_Phit_concat.1D -stim_label 13 PhitHB \
	-stim_file 14 sub-${sub}sess001-Bhb-Inter_Pmiss_concat.1D -stim_label 14 PmissHB \
	-num_glt 12 \
	-gltsym 'SYM: +Rhit -Rmiss' \
	-glt_label 1 Rhit-Rmiss \
	-gltsym 'SYM: +Phit -Pmiss' \
	-glt_label 2 Phit-Pmiss \
	-gltsym 'SYM: +Rhit -Nhit' \
	-glt_label 3 Rhit-Nhit \
	-gltsym 'SYM: +Rmiss -Nmiss' \
	-glt_label 4 Rmiss-Nmiss \
	-gltsym 'SYM: +Phit -Nhit' \
	-glt_label 5 Phit-Nhit \
	-gltsym 'SYM: +Pmiss -Nmiss' \
	-glt_label 6 Pmiss-Nmiss \
	-gltsym 'SYM: +Rhit -Phit' \
	-glt_label 7 Rhit-Phit \
	-gltsym 'SYM: +Rhit -Pmiss' \
	-glt_label 8 Rhit-Pmiss \
	-gltsym 'SYM: +Rmiss -Pmiss' \
	-glt_label 9 Rmiss-Pmiss \
	-gltsym 'SYM: +Rcue -Ncue' \
	-glt_label 10 Rcue-Ncue \
	-gltsym 'SYM: +Pcue -Ncue' \
	-glt_label 11 Pcue-Ncue \
	-gltsym 'SYM: +Rcue -Pcue' \
	-glt_label 12 Rcue-Pcue \
	-rout \
	-tout -xsave -xjpeg sub-${sub}sess001-SID-PPI-HB-xjpeg -x1D sub-${sub}sess001-SID-PPI-HB-x1D

	3dREMLfit -matrix sub-${sub}sess001-SID-PPI-HB-x1D \
	-input "sub-${sub}sess001_task-Shapes1_norm+tlrc sub-${sub}sess001_task-Shapes2_norm+tlrc" \
	-mask ${datapath}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes1_space-MNI152NLin2009cAsym_desc-brain_mask_2mm+tlrc \
	-rout \
	-tout -Rbuck sub-${sub}sess001-SID-PPI-HB-REML -Rvar sub-${sub}sess001-SID-PPI-HB-REMLvar -verb $*
done


#################################################################################################
#  WAVE 2
#################################################################################################
for sub in ${w2_subjects}; do
	cd ${datapath}/sub-${sub}sess002/func/

	rm *${sub}sess002-SID-PPI-HB-x1D*
	rm *${sub}sess002-SID-PPI-HB-REML*
	rm *SID-PPI-HB-xjpeg*

	3dDeconvolve \
	-jobs 6 \
	-mask ${datapath}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes1_space-MNI152NLin2009cAsym_desc-brain_mask_2mm+tlrc \
	-polort A \
	-x1D_stop \
	-input sub-${sub}sess002_task-Shapes1_norm+tlrc.BRIK sub-${sub}sess002_task-Shapes2_norm+tlrc.BRIK \
	-censor concat-censor_09.txt \
	-ortvec Shapes-concat-motion_csf.txt mopars \
	-stim_times_subtract 1 \
	-num_stimts 14 \
	-stim_times 1 Rhit.txt SPMG1 -stim_label 1 Rhit \
	-stim_times 2 Rmiss.txt SPMG1 -stim_label 2 Rmiss \
	-stim_times 3 Phit.txt SPMG1 -stim_label 3 Phit \
	-stim_times 4 Pmiss.txt SPMG1 -stim_label 4 Pmiss \
	-stim_times 5 Nhit.txt SPMG1 -stim_label 5 Nhit \
	-stim_times 6 Nmiss.txt SPMG1 -stim_label 6 Nmiss \
	-stim_times 7 reward_cue.txt SPMG1 -stim_label 7 Rcue \
	-stim_times 8 neutral_cue.txt SPMG1 -stim_label 8 Ncue \
	-stim_times 9 punish_cue.txt SPMG1 -stim_label 9 Pcue \
	-stim_file 10 sub-${sub}sess002-Bhb-concat_Neur_t.1D -stim_label 10 HB \
	-stim_file 11 sub-${sub}sess002-Bhb-Inter_Rhit_concat.1D -stim_label 11 RhitHB \
	-stim_file 12 sub-${sub}sess002-Bhb-Inter_Rmiss_concat.1D -stim_label 12 RmissHB \
	-stim_file 13 sub-${sub}sess002-Bhb-Inter_Phit_concat.1D -stim_label 13 PhitHB \
	-stim_file 14 sub-${sub}sess002-Bhb-Inter_Pmiss_concat.1D -stim_label 14 PmissHB \
	-num_glt 12 \
	-gltsym 'SYM: +Rhit -Rmiss' \
	-glt_label 1 Rhit-Rmiss \
	-gltsym 'SYM: +Phit -Pmiss' \
	-glt_label 2 Phit-Pmiss \
	-gltsym 'SYM: +Rhit -Nhit' \
	-glt_label 3 Rhit-Nhit \
	-gltsym 'SYM: +Rmiss -Nmiss' \
	-glt_label 4 Rmiss-Nmiss \
	-gltsym 'SYM: +Phit -Nhit' \
	-glt_label 5 Phit-Nhit \
	-gltsym 'SYM: +Pmiss -Nmiss' \
	-glt_label 6 Pmiss-Nmiss \
	-gltsym 'SYM: +Rhit -Phit' \
	-glt_label 7 Rhit-Phit \
	-gltsym 'SYM: +Rhit -Pmiss' \
	-glt_label 8 Rhit-Pmiss \
	-gltsym 'SYM: +Rmiss -Pmiss' \
	-glt_label 9 Rmiss-Pmiss \
	-gltsym 'SYM: +Rcue -Ncue' \
	-glt_label 10 Rcue-Ncue \
	-gltsym 'SYM: +Pcue -Ncue' \
	-glt_label 11 Pcue-Ncue \
	-gltsym 'SYM: +Rcue -Pcue' \
	-glt_label 12 Rcue-Pcue \
	-rout \
	-tout -xsave -xjpeg sub-${sub}sess002-SID-PPI-HB-xjpeg -x1D sub-${sub}sess002-SID-PPI-HB-x1D

	3dREMLfit -matrix sub-${sub}sess002-SID-PPI-HB-x1D \
	-input "sub-${sub}sess002_task-Shapes1_norm+tlrc sub-${sub}sess002_task-Shapes2_norm+tlrc" \
	-mask ${datapath}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes1_space-MNI152NLin2009cAsym_desc-brain_mask_2mm+tlrc \
	-rout \
	-tout -Rbuck sub-${sub}sess002-SID-PPI-HB-REML -Rvar sub-${sub}sess002-SID-PPI-HB-REMLvar -verb $*
done

#################################################################################################
#  WAVE 3
#################################################################################################
for sub in ${w3_subjects}; do
	cd ${datapath}/sub-${sub}sess003/func/

	rm *${sub}sess003-SID-PPI-HB-x1D*
	rm *${sub}sess003-SID-PPI-HB-REML*
	rm *SID-PPI-HB-xjpeg*

	3dDeconvolve \
	-jobs 6 \
	-mask ${datapath}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes1_space-MNI152NLin2009cAsym_desc-brain_mask_2mm+tlrc \
	-polort A \
	-x1D_stop \
	-input sub-${sub}sess003_task-Shapes1_norm+tlrc.BRIK sub-${sub}sess003_task-Shapes2_norm+tlrc.BRIK \
	-censor concat-censor_09.txt \
	-ortvec Shapes-concat-motion_csf.txt mopars \
	-stim_times_subtract 1 \
	-num_stimts 14 \
	-stim_times 1 Rhit.txt SPMG1 -stim_label 1 Rhit \
	-stim_times 2 Rmiss.txt SPMG1 -stim_label 2 Rmiss \
	-stim_times 3 Phit.txt SPMG1 -stim_label 3 Phit \
	-stim_times 4 Pmiss.txt SPMG1 -stim_label 4 Pmiss \
	-stim_times 5 Nhit.txt SPMG1 -stim_label 5 Nhit \
	-stim_times 6 Nmiss.txt SPMG1 -stim_label 6 Nmiss \
	-stim_times 7 reward_cue.txt SPMG1 -stim_label 7 Rcue \
	-stim_times 8 neutral_cue.txt SPMG1 -stim_label 8 Ncue \
	-stim_times 9 punish_cue.txt SPMG1 -stim_label 9 Pcue \
	-stim_file 10 sub-${sub}sess003-Bhb-concat_Neur_t.1D -stim_label 10 HB \
	-stim_file 11 sub-${sub}sess003-Bhb-Inter_Rhit_concat.1D -stim_label 11 RhitHB \
	-stim_file 12 sub-${sub}sess003-Bhb-Inter_Rmiss_concat.1D -stim_label 12 RmissHB \
	-stim_file 13 sub-${sub}sess003-Bhb-Inter_Phit_concat.1D -stim_label 13 PhitHB \
	-stim_file 14 sub-${sub}sess003-Bhb-Inter_Pmiss_concat.1D -stim_label 14 PmissHB \
	-num_glt 12 \
	-gltsym 'SYM: +Rhit -Rmiss' \
	-glt_label 1 Rhit-Rmiss \
	-gltsym 'SYM: +Phit -Pmiss' \
	-glt_label 2 Phit-Pmiss \
	-gltsym 'SYM: +Rhit -Nhit' \
	-glt_label 3 Rhit-Nhit \
	-gltsym 'SYM: +Rmiss -Nmiss' \
	-glt_label 4 Rmiss-Nmiss \
	-gltsym 'SYM: +Phit -Nhit' \
	-glt_label 5 Phit-Nhit \
	-gltsym 'SYM: +Pmiss -Nmiss' \
	-glt_label 6 Pmiss-Nmiss \
	-gltsym 'SYM: +Rhit -Phit' \
	-glt_label 7 Rhit-Phit \
	-gltsym 'SYM: +Rhit -Pmiss' \
	-glt_label 8 Rhit-Pmiss \
	-gltsym 'SYM: +Rmiss -Pmiss' \
	-glt_label 9 Rmiss-Pmiss \
	-gltsym 'SYM: +Rcue -Ncue' \
	-glt_label 10 Rcue-Ncue \
	-gltsym 'SYM: +Pcue -Ncue' \
	-glt_label 11 Pcue-Ncue \
	-gltsym 'SYM: +Rcue -Pcue' \
	-glt_label 12 Rcue-Pcue \
	-rout \
	-tout -xsave -xjpeg sub-${sub}sess003-SID-PPI-HB-xjpeg -x1D sub-${sub}sess003-SID-PPI-HB-x1D

	3dREMLfit -matrix sub-${sub}sess003-SID-PPI-HB-x1D \
	-input "sub-${sub}sess003_task-Shapes1_norm+tlrc sub-${sub}sess003_task-Shapes2_norm+tlrc" \
	-mask ${datapath}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes1_space-MNI152NLin2009cAsym_desc-brain_mask_2mm+tlrc \
	-rout \
	-tout -Rbuck sub-${sub}sess003-SID-PPI-HB-REML -Rvar sub-${sub}sess003-SID-PPI-HB-REMLvar -verb $*
done
