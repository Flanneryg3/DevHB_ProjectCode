#!/bin/bash

#####################################################
# define variables

# tranform r to z values
#####################################################
# Jessica S. Flannery

w1_subjects='001 003 004 005 006 007 008 009 010 011 012 013 015 017 018 019 022 023 024 025 026 027 028 029 030 032 037 038 040 043 044 045 046 047 048 054 055 056 057 058 059 060 061 064 065 068 070 071 072 074 075 077 078 079 080 081 084 085 086 087 088 090 092 093 095 096 097 098 099 102 103 104 106 107 108 110 111 112 114 115 116 117 118 122 123 124 125 126 128 130 131 132 133 134 135 136 137 138 139 140 142 143 144 145 147 148 150 151 153 154 155 156 157 158 160 161 162 163 166 167 170 172 173 175 176 182 184 185 186 187 188 189 190 191 192 999'

w2_subjects='005 006 007 008 009 011 012 017 018 019 022 023 027 028 029 030 032 037 038 040 044 045 047 054 055 056 059 060 061 062 063 064 068 071 072 074 075 078 079 080 081 084 085 086 087 088 090 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 124 125 128 131 133 134 135 136 139 140 141 142 143 144 145 147 154 155 156 157 158 160 161 162 163 170 172	173 175 176 182 184 185 186 187 188 189 190 191	999 193 194 196 197 198 199 200 201 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 228'

w3_subjects='003 005 006 008 009 010 011 012 017 018 019 022 023 027 028 029 030 032 038 040 043 044 045 047 054 055 056 059 060 061 062 063 064 068 070 071 074 075 078 080 085 086 087 088 092 093 095 096 098 099 103 104 106 111 114 115 116 118 119 123 124 125 126 128 131 132 133 134 135 136 138 141 142 143 144 145 147 151 154 155 156 158 160 161 162 163 170 172 173 175 176 182 184 185 186 187 188 189 190 191 999 193 194 197 198 199 200 201 203 204 205 207 208 209 210 211 212 213 214 215 220 221 222 226 228'
#################################################################################################
#  WAVE 1
#################################################################################################
events='Rhit Rmiss Phit Pmiss'
data_path=''
#####################################################
# convert R^2 to z-scores
#####################################################



for sub in ${w1_subjects}; do

	cd ${data_path}/sub-${sub}sess001/func/
	#VS
	rm Rhit-VS-zscore+tlrc*
	rm Rmiss-VS-zscore+tlrc*
	rm Phit-VS-zscore+tlrc*
	rm Pmiss-VS-zscore+tlrc*

	rm Rhit-HB-zscore+tlrc*
	rm Rmiss-HB-zscore+tlrc*
	rm Phit-HB-zscore+tlrc*
	rm Pmiss-HB-zscore+tlrc*

	#However 3dDeconvolve can only spill out R2, not correlation coefficient R itself.
	#So if you want R, you would have to take square root and find out its sign based on the sign of its corresponding beta value.
##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[34]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[32]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rhit-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Rhit-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rhit-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[37]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[35]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rmiss-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Rmiss-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rmiss-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[40]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[38]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Phit-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Phit-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Phit-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[43]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-VS-REML+tlrc.BRIK'[41]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Pmiss-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Pmiss-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Pmiss-VS-zscore
##################################################################################################


	#HB
##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[34]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[32]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rhit-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Rhit-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rhit-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[37]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[35]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rmiss-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Rmiss-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rmiss-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[40]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[38]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Phit-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Phit-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Phit-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[43]' -b ${data_path}/sub-${sub}sess001/func/sub-${sub}sess001-SID-PPI-HB-REML+tlrc.BRIK'[41]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Pmiss-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess001/func/Pmiss-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Pmiss-HB-zscore
##################################################################################################

done


for sub in ${w2_subjects}; do

	cd ${data_path}/sub-${sub}sess002/func/

	rm Rhit-VS-zscore+tlrc*
	rm Rmiss-VS-zscore+tlrc*
	rm Phit-VS-zscore+tlrc*
	rm Pmiss-VS-zscore+tlrc*

	rm Rhit-HB-zscore+tlrc*
	rm Rmiss-HB-zscore+tlrc*
	rm Phit-HB-zscore+tlrc*
	rm Pmiss-HB-zscore+tlrc*



##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[34]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[32]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rhit-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Rhit-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rhit-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[37]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[35]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rmiss-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Rmiss-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rmiss-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[40]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[38]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Phit-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Phit-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Phit-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[43]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-VS-REML+tlrc.BRIK'[41]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Pmiss-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Pmiss-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Pmiss-VS-zscore
##################################################################################################


	#HB
##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[34]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[32]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rhit-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Rhit-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rhit-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[37]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[35]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rmiss-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Rmiss-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rmiss-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[40]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[38]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Phit-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Phit-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Phit-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[43]' -b ${data_path}/sub-${sub}sess002/func/sub-${sub}sess002-SID-PPI-HB-REML+tlrc.BRIK'[41]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Pmiss-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess002/func/Pmiss-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Pmiss-HB-zscore
##################################################################################################



done


for sub in ${w3_subjects}; do

	cd ${data_path}/sub-${sub}sess003/func/

	rm Rhit-VS-zscore+tlrc*
	rm Rmiss-VS-zscore+tlrc*
	rm Phit-VS-zscore+tlrc*
	rm Pmiss-VS-zscore+tlrc*

	rm Rhit-HB-zscore+tlrc*
	rm Rmiss-HB-zscore+tlrc*
	rm Phit-HB-zscore+tlrc*
	rm Pmiss-HB-zscore+tlrc*

	#VS
	##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[34]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[32]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rhit-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Rhit-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rhit-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[37]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[35]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rmiss-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Rmiss-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rmiss-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[40]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[38]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Phit-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Phit-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Phit-VS-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[43]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-VS-REML+tlrc.BRIK'[41]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Pmiss-VS-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Pmiss-VS-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Pmiss-VS-zscore
##################################################################################################


	#HB
##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[34]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[32]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rhit-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Rhit-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rhit-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[37]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[35]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Rmiss-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Rmiss-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Rmiss-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[40]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[38]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Phit-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Phit-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Phit-HB-zscore

##################################################################################################

	3dcalc -a ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[43]' -b ${data_path}/sub-${sub}sess003/func/sub-${sub}sess003-SID-PPI-HB-REML+tlrc.BRIK'[41]' -expr 'ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)' -prefix Pmiss-HB-corrvalue

	3dcalc -a ${data_path}/sub-${sub}sess003/func/Pmiss-HB-corrvalue+tlrc.BRIK -expr 'log((1+a)/(1-a))/2' -prefix Pmiss-HB-zscore
##################################################################################################


done
