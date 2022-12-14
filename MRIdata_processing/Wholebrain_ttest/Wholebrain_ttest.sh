#!/bin/bash
#
##################################################
#

task_con = 'Rhit_Nhit Rcue_Ncue Pcue_Ncue Pmiss_Nmiss'
##################################################
for con in ${task_con}; do

  cd /path_to_data/

  3dttest++ -prefix ${con}_submean \
  -mask ./mask+tlrc.BRIK \
  -setA \
  -clustsim \
  /path_to_data/001_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/003_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/004_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/005_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/006_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/007_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/008_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/009_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/010_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/011_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/012_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/013_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/015_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/017_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/018_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/019_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/022_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/023_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/024_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/025_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/026_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/027_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/028_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/029_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/030_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/032_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/037_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/038_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/040_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/043_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/044_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/045_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/046_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/047_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/048_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/054_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/055_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/056_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/057_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/058_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/059_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/060_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/061_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/062_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/063_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/064_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/065_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/068_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/070_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/071_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/072_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/074_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/075_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/077_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/078_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/079_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/080_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/081_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/084_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/085_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/086_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/087_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/088_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/090_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/092_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/093_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/095_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/096_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/097_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/098_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/099_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/102_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/103_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/104_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/106_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/107_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/108_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/110_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/111_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/112_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/114_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/115_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/116_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/117_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/118_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/119_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/122_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/123_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/124_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/125_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/126_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/128_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/130_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/131_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/132_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/133_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/134_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/135_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/136_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/137_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/138_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/139_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/140_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/141_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/142_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/143_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/144_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/145_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/147_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/148_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/150_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/151_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/153_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/154_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/155_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/156_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/157_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/158_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/160_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/161_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/162_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/163_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/166_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/167_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/170_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/172_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/173_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/175_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/176_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/182_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/184_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/185_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/186_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/187_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/188_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/189_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/190_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/191_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/192_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/193_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/194_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/197_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/198_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/199_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/200_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/201_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/203_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/204_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/205_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/207_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/208_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/209_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/210_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/211_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/212_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/213_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/214_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/215_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/220_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/221_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/222_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/226_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/228_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/999_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/228_Rhit_Nhit_mean+tlrc.BRIK \
  /path_to_data/999_Rhit_Nhit_mean+tlrc.BRIK
done
