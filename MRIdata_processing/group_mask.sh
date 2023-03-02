#!/bin/bash


#################################################################################################
#  70% group gray matter mask
#################################################################################################
#author: Jessica S. Flannery

path=''

cd ${path}/roi_placement_check/sub_masks/

rm ${path}/scripts/group_GM_mask_70*

3dmask_tool -input sub-*-GM+tlrc.BRIK -frac 0.7 -fill_holes -dilate_result 5 -2 -prefix /proj/telzerlab/NT/analyses/Jessica_S_Flannery_AFNI_SID/scripts/group_GM_temp_70

3dmask_tool -input sub-*-CSF+tlrc.BRIK -frac 0.7 -fill_holes -prefix /proj/telzerlab/NT/analyses/Jessica_S_Flannery_AFNI_SID/scripts/group_CSF_mask_70

3dcalc -a ${path}/scripts/group_CSF_mask_70+tlrc.BRIK -b ${path}/scripts/group_GM_temp_70+tlrc.BRIK -expr 'b-a' -prefix ${path}/scripts/group_GM_temp2_70+tlrc.BRIK

3dresample -master ${path}/HB/sub-005sess001/func/sub-005sess001_task-Shapes2_norm+tlrc.BRIK -prefix ${path}/scripts/group_GM_mask_70 -input ${path}/scripts/group_GM_temp2_70+tlrc.BRIK
