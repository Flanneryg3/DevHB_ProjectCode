#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# AFNI Social Incentive Delay (SID) motion parameter Files

#Author: Jessica S. Flannery, 9-14-21


##############################################
# AFNI deconvolution nusance regressor file info
##############################################


#############################################################################################
# Standard imports (i.e., Python builtins) go at the top
import os
import os.path as op
from glob import glob
import numpy as np

# Now third-party imports
import pandas as pd
import csv
##############################################################################################
#This script has to be re-run for each wave separatly

runs=[1, 2]

w1_subjects=['001', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '015', '017', '018', '019', '022', '023', '024', '025', '026', '027', '028', '029', '030', '032', '037', '038', '040', '043', '044', '045', '046', '047', '048', '054', '055', '056', '057', '058', '059', '060', '061', '063', '064', '065', '068', '070', '071', '072', '074', '075', '077', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '097', '098', '099', '102', '103', '104', '106', '107', '108', '110', '111', '112', '114', '115', '116', '117', '118', '122', '123', '124', '125', '126', '128', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '142', '143', '144', '145', '147', '148', '150', '151', '153', '154', '155', '156', '157', '158', '160', '161', '162', '163', '166', '167', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '192', '999']

w2_subjects=['005', '006', '007', '008', '009', '011', '012', '017', '018', '019', '022', '023', '027', '028', '029', '030', '032', '037', '038', '040', '044', '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '071', '072', '074', '075', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '122', '124', '125', '128', '131', '133', '134', '135', '136', '139', '140', '141', '142', '143', '144', '145', '147', '154', '155', '156', '157', '158', '160', '161', '162', '163', '170', '172',	'173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '999', '193', '194', '196', '197', '198', '199', '200', '201', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '228']

w3_subjects=['003', '005', '006', '008', '009', '010', '011', '012', '017', '018', '019', '022', '023', '027', '028', '029', '030', '032', '038', '040', '043', '044', '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '070', '071', '074', '075', '078', '080', '085', '086', '087', '088', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '123', '124', '125', '126', '128', '131', '132', '133', '134', '135', '136', '138', '141', '142', '143', '144', '145', '147', '151', '154', '155', '156', '158', '160', '161', '162', '163', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '999', '193', '194', '197', '198', '199', '200', '201', '203', '204', '205', '207', '208', '209', '210', '211', '212', '213', '214', '215', '220', '221', '222', '226', '228']

# saving stim text files to each subject's func folder
func_local = ''
out_dir = ''

for subject in w1_subjects:
	try:
		print('Processing subject: {0} wave 1'.format(subject))
		func_folder = op.join(func_local, 'sub-{0}sess001'.format(subject), 'func')
		out_folder = op.join(out_dir, 'sub-{0}sess001'.format(subject), 'func')
		print(func_folder)

		for run in runs:
			# And grab each confound tsv file
			confound_file = op.join(func_folder, 'sub-{0}sess001_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			#df_in = csv.reader(file, delimiter="\t")
			#df_in = pd.read_csv('{0}'.format(file), sep='\t')
			df_in = pd.read_csv(confound_file, delimiter="\t", header=0)
			df_in.fillna(0, inplace=True)
			print(df_in)

			#Grab columns with csf and it's derivative, and #6 motion params and their derivatives
			motion_csf_df=df_in[['csf', 'csf_derivative1', 'trans_x', 'trans_x_derivative1', 'trans_y', 'trans_y_derivative1', 'trans_z', 'trans_z_derivative1', 'rot_x', 'rot_x_derivative1', 'rot_y', 'rot_y_derivative1', 'rot_z', 'rot_z_derivative1']].copy()

			#write 12 motion and 2 csf params to txt file, remove top row with header
			os.remove(op.join(func_folder,'Shapes{0}-motion_csf.txt'.format(run)))
			with open(op.join(func_folder,'Shapes{0}-motion_csf.txt'.format(run)), "a") as fo:
				df_string = motion_csf_df.to_string(header=None, index=False)
				fo.write(df_string)

		#concatinate runs make new concat motion file
		motion_df1 = pd.read_csv(op.join(func_folder, 'Shapes1-motion_csf.txt'), delimiter="\t", header=None)
		motion_df2 = pd.read_csv(op.join(func_folder, 'Shapes2-motion_csf.txt'), delimiter="\t", header=None)
		motion_df1 = motion_df1.fillna(0)
		motion_df2 = motion_df2.fillna(0)
		all_motion_df = pd.concat([motion_df1, motion_df2], sort=True, axis=0, ignore_index=True)
		os.remove(op.join(func_folder,'Shapes-concat-motion_csf.txt'))
		all_motion_df.to_csv(op.join(func_folder, 'Shapes-concat-motion_csf.txt'), index=False, header=0)

	except:
		print("missing {0} wave 1".format(subject))

for subject in w2_subjects:
	try:
		print('Processing subject: {0} wave 2'.format(subject))
		func_folder = op.join(func_local, 'sub-{0}sess002'.format(subject), 'func')
		out_folder = op.join(out_dir, 'sub-{0}sess002'.format(subject), 'func')
		print(func_folder)

		for run in runs:
			# And grab each confound tsv file
			confound_file = op.join(func_folder, 'sub-{0}sess002_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			#df_in = csv.reader(file, delimiter="\t")
			#df_in = pd.read_csv('{0}'.format(file), sep='\t')
			df_in = pd.read_csv(confound_file, delimiter="\t", header=0)
			df_in.fillna(0, inplace=True)
			print(df_in)

			#Grab columns with csf and it's derivative, and #6 motion params and their derivatives
			motion_csf_df=df_in[['csf', 'csf_derivative1', 'trans_x', 'trans_x_derivative1', 'trans_y', 'trans_y_derivative1', 'trans_z', 'trans_z_derivative1', 'rot_x', 'rot_x_derivative1', 'rot_y', 'rot_y_derivative1', 'rot_z', 'rot_z_derivative1']].copy()

			#write 12 motion and 2 csf params to txt file, remove top row with header
			os.remove(op.join(func_folder,'Shapes{0}-motion_csf.txt'.format(run)))
			with open(op.join(func_folder,'Shapes{0}-motion_csf.txt'.format(run)), "a") as fo:
				df_string = motion_csf_df.to_string(header=None, index=False)
				fo.write(df_string)

		#concatinate runs make new concat motion file
		motion_df1 = pd.read_csv(op.join(func_folder, 'Shapes1-motion_csf.txt'), delimiter="\t", header=None)
		motion_df2 = pd.read_csv(op.join(func_folder, 'Shapes2-motion_csf.txt'), delimiter="\t", header=None)
		motion_df1 = motion_df1.fillna(0)
		motion_df2 = motion_df2.fillna(0)
		all_motion_df = pd.concat([motion_df1, motion_df2], sort=True, axis=0, ignore_index=True)
		os.remove(op.join(func_folder,'Shapes-concat-motion_csf.txt'))
		all_motion_df.to_csv(op.join(func_folder, 'Shapes-concat-motion_csf.txt'), index=False, header=0)

	except:
		print("missing {0} wave 2".format(subject))

for subject in w3_subjects:
	try:
		print('Processing subject: {0} wave 3'.format(subject))
		func_folder = op.join(func_local, 'sub-{0}sess003'.format(subject), 'func')
		out_folder = op.join(out_dir, 'sub-{0}sess003'.format(subject), 'func')
		print(func_folder)

		for run in runs:
			# And grab each confound tsv file
			confound_file = op.join(func_folder, 'sub-{0}sess003_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			#df_in = csv.reader(file, delimiter="\t")
			#df_in = pd.read_csv('{0}'.format(file), sep='\t')
			df_in = pd.read_csv(confound_file, delimiter="\t", header=0)
			df_in.fillna(0, inplace=True)
			print(df_in)

			#Grab columns with csf and it's derivative, and #6 motion params and their derivatives
			motion_csf_df=df_in[['csf', 'csf_derivative1', 'trans_x', 'trans_x_derivative1', 'trans_y', 'trans_y_derivative1', 'trans_z', 'trans_z_derivative1', 'rot_x', 'rot_x_derivative1', 'rot_y', 'rot_y_derivative1', 'rot_z', 'rot_z_derivative1']].copy()

			#write 12 motion and 2 csf params to txt file, remove top row with header
			os.remove(op.join(func_folder,'Shapes{0}-motion_csf.txt'.format(run)))
			with open(op.join(func_folder,'Shapes{0}-motion_csf.txt'.format(run)), "a") as fo:
				df_string = motion_csf_df.to_string(header=None, index=False)
				fo.write(df_string)

		#concatinate runs make new concat motion file
		motion_df1 = pd.read_csv(op.join(func_folder, 'Shapes1-motion_csf.txt'), delimiter="\t", header=None)
		motion_df2 = pd.read_csv(op.join(func_folder, 'Shapes2-motion_csf.txt'), delimiter="\t", header=None)
		motion_df1 = motion_df1.fillna(0)
		motion_df2 = motion_df2.fillna(0)
		all_motion_df = pd.concat([motion_df1, motion_df2], sort=True, axis=0, ignore_index=True)
		os.remove(op.join(func_folder,'Shapes-concat-motion_csf.txt'))
		all_motion_df.to_csv(op.join(func_folder, 'Shapes-concat-motion_csf.txt'), index=False, header=0)

	except:
		print("missing {0} wave 3".format(subject))
