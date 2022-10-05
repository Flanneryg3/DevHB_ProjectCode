#!/bin/bash


################################################
# Normalize to percent bold signal change

#Jessica S. Flannery

runs='1 2'


w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060	061 063 064 065 068 070 071 072 074 075 077 078	079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 122 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191	999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

w3_subjects='003 005 006 008 009 010 011 012 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 123 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'

for sub in ${w1_subjects}; do
	cd /path_to_data/data_fmriprep/fmriprep/${sub}sess001/func/
	for run in ${runs}; do

		3dcopy ${sub}sess001_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz ${sub}sess001_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold

		3dTstat -mean \
		-prefix ${sub}sess001_task-Shapes${run}_mean \
		${sub}sess001_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold+tlrc\[1..$\]

		3dcalc -a ${sub}sess001_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold+tlrc \
		-b ${sub}sess001_task-Shapes${run}_mean+tlrc \
		-c ${sub}sess001_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz \
		-prefix ${sub}sess001_task-Shapes${run}_norm \
		-expr '100*step(c)*(a/b)'
	done
done

for sub in ${w2_subjects}; do
	cd /path_to_data/data_fmriprep/fmriprep/${sub}sess002/func/
	for run in ${runs}; do

		3dcopy ${sub}sess002_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz ${sub}sess002_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold

		3dTstat -mean \
		-prefix ${sub}sess002_task-Shapes${run}_mean \
		${sub}sess002_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold+tlrc\[1..$\]

		3dcalc -a ${sub}sess002_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold+tlrc \
		-b ${sub}sess002_task-Shapes${run}_mean+tlrc \
		-c ${sub}sess002_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz \
		-prefix ${sub}sess002_task-Shapes${run}_norm \
		-expr '100*step(c)*(a/b)'
	done
done

for sub in ${w3_subjects}; do
	cd /path_to_data/data_fmriprep/fmriprep/${sub}sess003/func/
	for run in ${runs}; do

		3dcopy ${sub}sess003_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz ${sub}sess003_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold

		3dTstat \
		-mean \
		-prefix ${sub}sess003_task-Shapes${run}_mean \
		${sub}sess003_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold+tlrc\[1..$\]

		3dcalc -a ${sub}sess003_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-preproc_bold+tlrc \
		-b ${sub}sess003_task-Shapes${run}_mean+tlrc \
		-c ${sub}sess003_task-Shapes${run}_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz \
		-prefix ${sub}sess003_task-Shapes${run}_norm \
		-expr '100*step(c)*(a/b)'
	done
done
