#!bin/bash

#################################################################################
# Calculate a mean image for each subject per task contrast of intrest using all their aviable timepoints.
#################################################################################
#Jessica S. Flannery

subjects='001 044 085 124 158 003 045 086 125 160 004 046 087 126 161 005 047 088 128 162 006 048 089 130 163 007 054 090 131 166 008 055 092 132 167 009 056 093 133 169 010 057 095 134 170 011 058 096 135 172 012 059 097 136 173 013 060 098 137 174 015 061 099 138 175 017 062 102 139 176 018 063 103 140 178 019 064 104 141 179 022 065 106 142 182 023 068 107 143 184 024 070 108 144 185 025 071 110 145 186 026 072 111 147 187 027 074 112 148 188 028 075 114 149 189 029 077 115 150 190 030 078 116 151 191 032 079 117 153 192 037 080 118 154 999 038 081 119 155 040 083 122 156 043 084 123 157 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 095 096 098 099 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'

waves='1 2 3'

path='/path_to_data'

for sub in ${subjects}; do
  if [[ ! -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    3dcalc -a ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -b ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a+b)/2' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -b ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a+b)/2' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} is only missing wave 1"
  elif [[ -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -b ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a+b)/2' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -b ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a+b)/2' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} is only missing wave 2"
  elif [[ -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -b ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a+b)/2' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -b ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a+b)/2' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} is only missing wave 3"
  elif [[ -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a)/1' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a)/1' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} only has wave 1"
  elif [[ ! -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    3dcalc -a ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a)/1' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a)/1' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} only has wave 2"
  elif [[ ! -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    3dcalc -a ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a)/1' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a)/1' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} only has wave 3"
  elif [[ ! -f "${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK" ]] && [[ ! -f "${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK" ]]; then
    echo "${sub} is missing all waves!!"
  else
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -b ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -c ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[13]' \
    -expr '(a+b+c)/3' -prefix ${path}/subject_mean/${sub}_Rhit_Nhit_mean
    3dcalc -a ${path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -b ${path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -c ${path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-OUTCOME-REML+tlrc.BRIK'[21]' \
    -expr '(a+b+c)/3' -prefix ${path}/subject_mean/${sub}_Pmiss_Nmiss_mean
    echo "${sub} has all waves!!"
  fi
done
