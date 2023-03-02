#!bin/bash/

#Jessica S. Flannery
#https://afni.nimh.nih.gov/CD-CorrAna

w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060 061 064 065 068 070 071 072 074 075 077 078 079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

w3_subjects='003 005 006 008 009 010 011 012 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 123 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'

projectpath=''
glmpath=''
roipath=''

ROIs='Bhb B_VS'

for r in ${ROIs}; do
	cd ${projectpath}/PPI/out/
	dir=./${r}-PPI
	if [ -d "$dir" ]; then
		echo "output dir already exsits"
	fi
	mkdir ${r}-PPI
	for sub in ${w1_subjects}; do


		cd ${projectpath}/PPI/out/${r}-PPI

#clean up from perivious runs
		rm sub-${sub}sess001-${r}-run*.1D
		rm sub-${sub}sess001-${r}*.1D
		rm ${glmpath}/sub-${sub}sess001/func/sub-${sub}sess001-${r}-Inter_*.1D
		rm ${glmpath}/sub-${sub}sess001/func/sub-${sub}sess001-${r}-concat_Neur*.1D

############################################################################################################################################
	#For each run extract the average time series of the ROI
############################################################################################################################################
		#run 1
3dmaskave -mask ${roipath}/${r}_atlas_norm+tlrc -quiet ${glmpath}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes1_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1.1D
		#run 2
3dmaskave -mask ${roipath}/${r}_atlas_norm+tlrc -quiet ${glmpath}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes2_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2.1D

	#Remove the trend from the seed time series
		#run 1
3dDetrend -polort 3 -prefix ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_detrend.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1.1D\'

		#run 2
3dDetrend -polort 3 -prefix ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_detrend.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2.1D\'

	#transpose the roi time series so it can be deconvolved in the next step
		#run 1
		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_detrend.1D ./sub-${sub}sess001-${r}-run1_t.1D

		#run 1
		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_detrend.1D ./sub-${sub}sess001-${r}-run2_t.1D

############################################################################################################################################
# put roi timeseries in neural time (aka. take out hemodynamic resposne function)
############################################################################################################################################
#Generate the impulse response function:
	waver -dt 2 -GAM -inline 1@1 > ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D

#Run deconvolution on the seed time series
		3dTfitter -RHS ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_t.1D -FALTUNG ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D sub-${sub}sess001-${r}-run1_Neur.1D 12 -1

		3dTfitter -RHS ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_t.1D -FALTUNG ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D sub-${sub}sess001-${r}-run2_Neur.1D 12 -1

############################################################################################################################################
#get number of TRs for each sub and run and save to a variable!
############################################################################################################################################

		run1trs=$(3dinfo -nv ${glmpath}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes1_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc)
		echo $run1trs
		run1len=$(($run1trs * 2))
		run2trs=$(3dinfo -nv ${glmpath}/sub-${sub}sess001/func/sub-${sub}sess001_task-Shapes2_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc)
		run2len=$(($run2trs * 2))
		bothtrs=$(($run1trs+$run2trs))
		echo $bothtrs

# split task timing files into run 1 row and run2 row.

		cd ${glmpath}/sub-${sub}sess001/func/

		head -n 1 Rhit.txt > Rhit_run1.txt
		tail -n 1 Rhit.txt > Rhit_run2.txt

		head -n 1 Rmiss.txt > Rmiss_run1.txt
		tail -n 1 Rmiss.txt > Rmiss_run2.txt

		head -n 1 Phit.txt > Phit_run1.txt
		tail -n 1 Phit.txt > Phit_run2.txt

		head -n 1 Pmiss.txt > Pmiss_run1.txt
		tail -n 1 Pmiss.txt > Pmiss_run2.txt

############################################################################################################################################
	#For each run make a file for each tasks event of intrest
	# the 1D file will have 1s and 0s where the event happened that is the lengh of the run in seconds: aka number of trs * 2
############################################################################################################################################
#Rhit
################################################################################################################################
		timing_tool.py -timing Rhit_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rhit-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Rhit_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rhit-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Rmiss
################################################################################################################################
		timing_tool.py -timing Rmiss_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rmiss-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Rmiss_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rmiss-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Phit
################################################################################################################################
		timing_tool.py -timing Phit_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Phit-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Phit_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Phit-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Pmiss
################################################################################################################################
		timing_tool.py -timing Pmiss_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Pmiss-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Pmiss_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Pmiss-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

####################################################################################################################
#Obtain the interaction regressor
####################################################################################################################
#Rhit
####################################################################################################################

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rhit-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rhit_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rhit-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rhit_run2.1D

####################################################################################################################
#Rhit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rhit_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rhit_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rhit_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rhit_run2.1D


####################################################################################################################
#Rmiss
	#Obtain the interaction regressor

####################################################################################################################
		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rmiss-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rmiss_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Rmiss-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rmiss_run2.1D

####################################################################################################################
#Rmiss
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################


		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rmiss_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rmiss_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Rmiss_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rmiss_run2.1D

####################################################################################################################
#Phit
	#Obtain the interaction regressor
####################################################################################################################
		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Phit-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Phit_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Phit-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Phit_run2.1D

####################################################################################################################
#Phit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################


		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Phit_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Phit_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Phit_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Phit_run2.1D

####################################################################################################################
#Pmiss

	#Obtain the interaction regressor

####################################################################################################################


		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Pmiss-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Pmiss_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Pmiss-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Pmiss_run2.1D

####################################################################################################################
#Phit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Pmiss_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Pmiss_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_neu_Pmiss_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Pmiss_run2.1D


 ##################################################################################################################################################################################################################
	# transpose roi timeseries for proper format for stim_file option in 3ddeconvolve

 ###################################################################################################################################################

		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur_t.1D

		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur_t.1D

 ###################################################################################################################################################
	# concatinate runs for roi time series regressor and 4 task event - roi interaction regressors: these will be 1d files with 1 column and about 395 rows (same number as number of timepoint/run length: (TRs * 2)
 ###################################################################################################################################################
		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run1_Neur_t.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-run2_Neur_t.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-concat_Neur_t.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rhit_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rhit_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rhit_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rmiss_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rmiss_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rmiss_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Phit_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Phit_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Phit_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Pmiss_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Pmiss_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Pmiss_concat.1D
 ###################################################################################################################################################
		#copy to decon subject folder
 ###################################################################################################################################################
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-concat_Neur_t.1D ${glmpath}/sub-${sub}sess001/func/

		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rhit_concat.1D ${glmpath}/sub-${sub}sess001/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Rmiss_concat.1D ${glmpath}/sub-${sub}sess001/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Phit_concat.1D ${glmpath}/sub-${sub}sess001/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess001-${r}-Inter_Pmiss_concat.1D ${glmpath}/sub-${sub}sess001/func/

	done
done
####################################################################################################################
####################################################################################################################

#6. Regression analysis

#Basically add two more regressors from step (5) to your original 3dDeconvolve script by using option -stim_file, and add option -rout in 3dDeconvolve since the correlation coefficient for regressor Inter_ts.1D will be taken for group analysis. That is, include all of the original regressors (of interest and no interest) plus the two new ones. That way all sources of variabilities in the data would be properly accounted for.

#7. Group analysis

#Take beta value associated with each interaction regressor to group analysis (paired t-test, ANOVA, or even ANCOVA).

#8. Interpretation of the effect of seed on a target region.

#First of all, the PPI effect is independent of the typical effect (e.g., the contrast between conditions A and B). In other words, positive PPI effect has nothing to do with the sign of the contrast between conditions A and B. Secondly, a positive context-dependent (or interaction) effect means:

#(1) the seed region tends to increase the contrast between the effects of A and B on the target region; or
#(2) the contrast between the effects of A and B  tends to increase the effect of the seed region on the target region; or
#(3) both (1) and (2).
#Vice versa for the negative value.


####################################################################################################################
########################################################################################################################################################################################################################################
####################################################################################################################




for r in ${ROIs}; do
	cd ${projectpath}/PPI/out/
	dir=./${r}-PPI
	if [ -d "$dir" ]; then
		echo "output dir already exsits"
	fi
	mkdir ${r}-PPI
	for sub in ${w2_subjects}; do


		cd ${projectpath}/PPI/out/${r}-PPI

#clean up from perivious runs
		rm sub-${sub}sess002-${r}-run*.1D
		rm sub-${sub}sess002-${r}*.1D
		rm ${glmpath}/sub-${sub}sess002/func/sub-${sub}sess002-${r}-Inter_*.1D
		rm ${glmpath}/sub-${sub}sess002/func/sub-${sub}sess002-${r}-concat_Neur*.1D

############################################################################################################################################
	#For each run extract the average time series of the ROI
############################################################################################################################################
		#run 1
3dmaskave -mask ${roipath}/${r}_atlas_norm+tlrc -quiet ${glmpath}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes1_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1.1D
		#run 2
3dmaskave -mask ${roipath}/${r}_atlas_norm+tlrc -quiet ${glmpath}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes2_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2.1D

	#Remove the trend from the seed time series
		#run 1
3dDetrend -polort 3 -prefix ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_detrend.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1.1D\'

		#run 2
3dDetrend -polort 3 -prefix ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_detrend.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2.1D\'

	#transpose the roi time series so it can be deconvolved in the next step
		#run 1
		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_detrend.1D ./sub-${sub}sess002-${r}-run1_t.1D

		#run 1
		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_detrend.1D ./sub-${sub}sess002-${r}-run2_t.1D

############################################################################################################################################
# put roi timeseries in neural time (aka. take out hemodynamic resposne function)
############################################################################################################################################
#Generate the impulse response function:
	waver -dt 2 -GAM -inline 1@1 > ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D

#Run deconvolution on the seed time series
		3dTfitter -RHS ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_t.1D -FALTUNG ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D sub-${sub}sess002-${r}-run1_Neur.1D 12 -1

		3dTfitter -RHS ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_t.1D -FALTUNG ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D sub-${sub}sess002-${r}-run2_Neur.1D 12 -1

############################################################################################################################################
#get number of TRs for each sub and run and save to a variable!
############################################################################################################################################

		run1trs=$(3dinfo -nv ${glmpath}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes1_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc)
		echo $run1trs
		run1len=$(($run1trs * 2))
		run2trs=$(3dinfo -nv ${glmpath}/sub-${sub}sess002/func/sub-${sub}sess002_task-Shapes2_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc)
		run2len=$(($run2trs * 2))
		bothtrs=$(($run1trs+$run2trs))
		echo $bothtrs

# split task timing files into run 1 row and run2 row.

		cd ${glmpath}/sub-${sub}sess002/func/

		head -n 1 Rhit.txt > Rhit_run1.txt
		tail -n 1 Rhit.txt > Rhit_run2.txt

		head -n 1 Rmiss.txt > Rmiss_run1.txt
		tail -n 1 Rmiss.txt > Rmiss_run2.txt

		head -n 1 Phit.txt > Phit_run1.txt
		tail -n 1 Phit.txt > Phit_run2.txt

		head -n 1 Pmiss.txt > Pmiss_run1.txt
		tail -n 1 Pmiss.txt > Pmiss_run2.txt

############################################################################################################################################
	#For each run make a file for each tasks event of intrest
	# the 1D file will have 1s and 0s where the event happened that is the lengh of the run in seconds: aka number of trs * 2
############################################################################################################################################
#Rhit
################################################################################################################################
		timing_tool.py -timing Rhit_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rhit-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Rhit_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rhit-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Rmiss
################################################################################################################################
		timing_tool.py -timing Rmiss_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rmiss-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Rmiss_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rmiss-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Phit
################################################################################################################################
		timing_tool.py -timing Phit_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Phit-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Phit_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Phit-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Pmiss
################################################################################################################################
		timing_tool.py -timing Pmiss_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Pmiss-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Pmiss_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Pmiss-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

####################################################################################################################
#Obtain the interaction regressor
####################################################################################################################
#Rhit
####################################################################################################################

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rhit-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rhit_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rhit-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rhit_run2.1D

####################################################################################################################
#Rhit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rhit_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rhit_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rhit_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rhit_run2.1D


####################################################################################################################
#Rmiss
	#Obtain the interaction regressor

####################################################################################################################
		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rmiss-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rmiss_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Rmiss-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rmiss_run2.1D

####################################################################################################################
#Rmiss
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################


		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rmiss_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rmiss_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Rmiss_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rmiss_run2.1D

####################################################################################################################
#Phit
	#Obtain the interaction regressor
####################################################################################################################
		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Phit-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Phit_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Phit-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Phit_run2.1D

####################################################################################################################
#Phit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################


		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Phit_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Phit_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Phit_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Phit_run2.1D

####################################################################################################################
#Pmiss

	#Obtain the interaction regressor

####################################################################################################################


		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Pmiss-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Pmiss_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Pmiss-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Pmiss_run2.1D

####################################################################################################################
#Phit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Pmiss_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Pmiss_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_neu_Pmiss_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Pmiss_run2.1D


 ##################################################################################################################################################################################################################
	# transpose roi timeseries for proper format for stim_file option in 3ddeconvolve

 ###################################################################################################################################################

		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur_t.1D

		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur_t.1D

 ###################################################################################################################################################
	# concatinate runs for roi time series regressor and 4 task event - roi interaction regressors: these will be 1d files with 1 column and about 395 rows (same number as number of timepoint/run length: (TRs * 2)
 ###################################################################################################################################################
		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run1_Neur_t.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-run2_Neur_t.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-concat_Neur_t.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rhit_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rhit_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rhit_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rmiss_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rmiss_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rmiss_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Phit_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Phit_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Phit_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Pmiss_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Pmiss_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Pmiss_concat.1D
 ###################################################################################################################################################
		#copy to decon subject folder
 ###################################################################################################################################################
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-concat_Neur_t.1D ${glmpath}/sub-${sub}sess002/func/

		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rhit_concat.1D ${glmpath}/sub-${sub}sess002/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Rmiss_concat.1D ${glmpath}/sub-${sub}sess002/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Phit_concat.1D ${glmpath}/sub-${sub}sess002/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess002-${r}-Inter_Pmiss_concat.1D ${glmpath}/sub-${sub}sess002/func/

	done
done
####################################################################################################################
####################################################################################################################

#6. Regression analysis

#Basically add two more regressors from step (5) to your original 3dDeconvolve script by using option -stim_file, and add option -rout in 3dDeconvolve since the correlation coefficient for regressor Inter_ts.1D will be taken for group analysis. That is, include all of the original regressors (of interest and no interest) plus the two new ones. That way all sources of variabilities in the data would be properly accounted for.

#7. Group analysis

#Take beta value associated with each interaction regressor to group analysis (paired t-test, ANOVA, or even ANCOVA).

#8. Interpretation of the effect of seed on a target region.

#First of all, the PPI effect is independent of the typical effect (e.g., the contrast between conditions A and B). In other words, positive PPI effect has nothing to do with the sign of the contrast between conditions A and B. Secondly, a positive context-dependent (or interaction) effect means:

#(1) the seed region tends to increase the contrast between the effects of A and B on the target region; or
#(2) the contrast between the effects of A and B  tends to increase the effect of the seed region on the target region; or
#(3) both (1) and (2).
#Vice versa for the negative value.

###########################################################################################################################################################

for r in ${ROIs}; do
	cd ${projectpath}/PPI/out/
	dir=./${r}-PPI
	if [ -d "$dir" ]; then
		echo "output dir already exsits"
	fi
	mkdir ${r}-PPI
	for sub in ${w3_subjects}; do


		cd ${projectpath}/PPI/out/${r}-PPI

#clean up from perivious runs
		rm sub-${sub}sess003-${r}-run*.1D
		rm sub-${sub}sess003-${r}*.1D
		rm ${glmpath}/sub-${sub}sess003/func/sub-${sub}sess003-${r}-Inter_*.1D
		rm ${glmpath}/sub-${sub}sess003/func/sub-${sub}sess003-${r}-concat_Neur*.1D

############################################################################################################################################
	#For each run extract the average time series of the ROI
############################################################################################################################################
		#run 1
3dmaskave -mask ${roipath}/${r}_atlas_norm+tlrc -quiet ${glmpath}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes1_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1.1D
		#run 2
3dmaskave -mask ${roipath}/${r}_atlas_norm+tlrc -quiet ${glmpath}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes2_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2.1D

	#Remove the trend from the seed time series
		#run 1
3dDetrend -polort 3 -prefix ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_detrend.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1.1D\'

		#run 2
3dDetrend -polort 3 -prefix ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_detrend.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2.1D\'

	#transpose the roi time series so it can be deconvolved in the next step
		#run 1
		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_detrend.1D ./sub-${sub}sess003-${r}-run1_t.1D

		#run 1
		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_detrend.1D ./sub-${sub}sess003-${r}-run2_t.1D

############################################################################################################################################
# put roi timeseries in neural time (aka. take out hemodynamic resposne function)
############################################################################################################################################
#Generate the impulse response function:
	waver -dt 2 -GAM -inline 1@1 > ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D

#Run deconvolution on the seed time series
		3dTfitter -RHS ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_t.1D -FALTUNG ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D sub-${sub}sess003-${r}-run1_Neur.1D 12 -1

		3dTfitter -RHS ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_t.1D -FALTUNG ${projectpath}/PPI/out/${r}-PPI/GammaHR.1D sub-${sub}sess003-${r}-run2_Neur.1D 12 -1

############################################################################################################################################
#get number of TRs for each sub and run and save to a variable!
############################################################################################################################################

		run1trs=$(3dinfo -nv ${glmpath}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes1_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc)
		echo $run1trs
		run1len=$(($run1trs * 2))
		run2trs=$(3dinfo -nv ${glmpath}/sub-${sub}sess003/func/sub-${sub}sess003_task-Shapes2_space-MNI152NLin2009cAsym_desc-preproc_bold_2mm+tlrc)
		run2len=$(($run2trs * 2))
		bothtrs=$(($run1trs+$run2trs))
		echo $bothtrs

# split task timing files into run 1 row and run2 row.

		cd ${glmpath}/sub-${sub}sess003/func/

		head -n 1 Rhit.txt > Rhit_run1.txt
		tail -n 1 Rhit.txt > Rhit_run2.txt

		head -n 1 Rmiss.txt > Rmiss_run1.txt
		tail -n 1 Rmiss.txt > Rmiss_run2.txt

		head -n 1 Phit.txt > Phit_run1.txt
		tail -n 1 Phit.txt > Phit_run2.txt

		head -n 1 Pmiss.txt > Pmiss_run1.txt
		tail -n 1 Pmiss.txt > Pmiss_run2.txt

############################################################################################################################################
	#For each run make a file for each tasks event of intrest
	# the 1D file will have 1s and 0s where the event happened that is the lengh of the run in seconds: aka number of trs * 2
############################################################################################################################################
#Rhit
################################################################################################################################
		timing_tool.py -timing Rhit_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rhit-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Rhit_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rhit-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Rmiss
################################################################################################################################
		timing_tool.py -timing Rmiss_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rmiss-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Rmiss_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rmiss-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Phit
################################################################################################################################
		timing_tool.py -timing Phit_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Phit-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Phit_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Phit-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

############################################################################################################################################
#Pmiss
################################################################################################################################
		timing_tool.py -timing Pmiss_run1.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Pmiss-file_run1.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run1len

		timing_tool.py -timing Pmiss_run2.txt -timing_to_1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Pmiss-file_run2.1D -tr 2 -stim_dur 2 -verb 4 -timing_to_1D_warn_ok -run_len $run2len

####################################################################################################################
#Obtain the interaction regressor
####################################################################################################################
#Rhit
####################################################################################################################

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rhit-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rhit_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rhit-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rhit_run2.1D

####################################################################################################################
#Rhit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rhit_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rhit_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rhit_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rhit_run2.1D


####################################################################################################################
#Rmiss
	#Obtain the interaction regressor

####################################################################################################################
		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rmiss-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rmiss_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Rmiss-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rmiss_run2.1D

####################################################################################################################
#Rmiss
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################


		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rmiss_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rmiss_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Rmiss_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rmiss_run2.1D

####################################################################################################################
#Phit
	#Obtain the interaction regressor
####################################################################################################################
		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Phit-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Phit_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Phit-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Phit_run2.1D

####################################################################################################################
#Phit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################


		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Phit_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Phit_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Phit_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Phit_run2.1D

####################################################################################################################
#Pmiss

	#Obtain the interaction regressor

####################################################################################################################


		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Pmiss-file_run1.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Pmiss_run1.1D

		1deval -a ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur.1D\' -b ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Pmiss-file_run2.1D -expr 'a*b' > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Pmiss_run2.1D

####################################################################################################################
#Phit
#Put interaction regressor in neural time (aka. take out the hymodynamic resposne function)
####################################################################################################################

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Pmiss_run1.1D -numout $run1trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Pmiss_run1.1D

		waver -dt 2 -GAM -peak 1 -input ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_neu_Pmiss_run2.1D -numout $run2trs > ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Pmiss_run2.1D


 ##################################################################################################################################################################################################################
	# transpose roi timeseries for proper format for stim_file option in 3ddeconvolve

 ###################################################################################################################################################

		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur_t.1D

		1dtranspose ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur_t.1D

 ###################################################################################################################################################
	# concatinate runs for roi time series regressor and 4 task event - roi interaction regressors: these will be 1d files with 1 column and about 395 rows (same number as number of timepoint/run length: (TRs * 2)
 ###################################################################################################################################################
		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run1_Neur_t.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-run2_Neur_t.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-concat_Neur_t.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rhit_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rhit_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rhit_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rmiss_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rmiss_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rmiss_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Phit_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Phit_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Phit_concat.1D

		cat ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Pmiss_run1.1D ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Pmiss_run2.1D >> ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Pmiss_concat.1D
 ###################################################################################################################################################
		#copy to decon subject folder
 ###################################################################################################################################################
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-concat_Neur_t.1D ${glmpath}/sub-${sub}sess003/func/

		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rhit_concat.1D ${glmpath}/sub-${sub}sess003/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Rmiss_concat.1D ${glmpath}/sub-${sub}sess003/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Phit_concat.1D ${glmpath}/sub-${sub}sess003/func/
		cp ${projectpath}/PPI/out/${r}-PPI/sub-${sub}sess003-${r}-Inter_Pmiss_concat.1D ${glmpath}/sub-${sub}sess003/func/

	done
done
####################################################################################################################
####################################################################################################################

#6. Regression analysis

#Basically add two more regressors from step (5) to your original 3dDeconvolve script by using option -stim_file, and add option -rout in 3dDeconvolve since the correlation coefficient for regressor Inter_ts.1D will be taken for group analysis. That is, include all of the original regressors (of interest and no interest) plus the two new ones. That way all sources of variabilities in the data would be properly accounted for.

#7. Group analysis

#Take beta value associated with each interaction regressor to group analysis (paired t-test, ANOVA, or even ANCOVA).

#8. Interpretation of the effect of seed on a target region.

#First of all, the PPI effect is independent of the typical effect (e.g., the contrast between conditions A and B). In other words, positive PPI effect has nothing to do with the sign of the contrast between conditions A and B. Secondly, a positive context-dependent (or interaction) effect means:

#(1) the seed region tends to increase the contrast between the effects of A and B on the target region; or
#(2) the contrast between the effects of A and B  tends to increase the effect of the seed region on the target region; or
#(3) both (1) and (2).
#Vice versa for the negative value.



 
