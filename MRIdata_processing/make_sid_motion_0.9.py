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
import xlrd
import openpyxl
import csv
##############################################################################################
#This script has to be re-run for each wave separatly
#waves= ['1', '2', '3']

runs=['1', '2']

#subjects=['001', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '015', '017', '018', '019', '022', '023', '024', '025', '026', '027', '028', '029', '030', '032', '037', '038', '040', '043', '044', '045', '046', '047', '048', '054', '055', '056', '057', '058', '059', '060', '061', '062', '063', '064', '065', '068', '070', '071', '072', '074', '075', '077', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '097', '098', '099', '102', '103', '104', '106', '107', '108', '110', '111', '112', '114', '115', '116', '117', '118', '122', '123', '124', '125', '126', '128', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '142', '143', '144', '145', '147', '148', '150', '151', '153', '154', '155', '156', '157', '158', '160', '161', '162', '163', '166', '167', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '192', '999', '119', '141', '193', '194', '196', '197', '198', '199', '00', '01', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '28', '26']
##############################################################################################

#full_subjects=['1001', '005', '3003', '1003', '006',	'3005', '1004',	'007',	'3006', '1005',	'008',	'3008', '1006', '009', '3009', '1007',	'011',	'3010', '1008',	'012',	'3011', '1009',	'017',	'3012', '1010',	'018',	'3017', '1011', '019',	'3018', '1012',	'022',	'3019', '1013',	'023',	'3022', '1015',	'027',	'3023', '1017',	'028', '3027', '1018',	'029',	'3028', '1019', '030',	'3029', '1022',	'032',	'3030', '1023',	'037',	'3032', '1024',	'038', '3038', '1025',	'040',	'3040', '1026',	'044',	'3043', '1027', '045',	'3044', '1028',	'047',	'3045', '1029', '054',	'3047', '1030',	'055',	'3054', '1032',	'056',	'3055', '1037',	'059',	'3056', '1038',	'060',	'3059', '1040',	'061',	'3060', '1043',	'062',	'3061', '1044',	'063',	'3062', '1045',	'064',	'3063', '1046',	'068',	'3064', '1047', '071', '3068', '1048',	'072',	'3070', '1054',	'074',	'3071', '1055',	'075',	'3074', '1056',	'078',	'3075', '1057',	'079',	'3078', '1058', '080',	'3080', '1059',	'081',	'3085', '1060',	'084',	'3086', '1061',	'085',	'3087', '1063',	'086',	'3088', '1064',	'087',	'3092', '1065',	'088',	'3093', '1068',	'090',	'3095', '1070', '092',	'3096', '1071',	'093',	'3098', '1072',	'095',	'3099', '1074',	'096',	'3103', '1075',	'098',	'3104', '1077',	'099',	'3106', '1078',	'103',	'3111', '1079',	'104',	'3114', '1080',	'106',	'3115', '1081',	'111',	'3116', '1084',	'114',	'3118', '1085', '115', '3119', '1086',	'116',	'3123', '1087',	'118',	'3124', '1088',	'119',	'3125', '1090',	'122',	'3126', '1092',	'124',	'3128', '1093', '125',	'3131', '1095',	'128',	'3132', '1096',	'131',	'3133', '1097',	'133',	'3134', '1098',	'134',	'3135', '1099',	'135',	'3136', '1102',	'136',	'3138', '1103',	'139',	'3141', '1104', '140',	'3142', '1106',	'141',	'3143', '1107',	'142',	'3144', '1108', '143',	'3145', '1110',	'144',	'3147', '1111',	'145',	'3151', '1112',	'147',	'3154', '1114',	'154',	'3155', '1115',	'155',	'3156', '1116', '156',	'3158', '1117',	'157',	'3160', '1118',	'158',	'3161', '1122',	'160',	'3162', '1123',	'161',	'3163', '1124',	'162',	'3170', '1125',	'163',	'3172', '1126',	'170',	'3173', '1128',	'172',	'3175', '1130',	'173',	'3176', '1131',	'175',	'3182', '1132', '176', '3184', '1133',	'182',	'3185', '1134',	'184',	'3186', '1135',	'185',	'3187', '1136',	'186',	'3188', '1137',	'187',	'3189', '1138', '188',	'3190', '1139',	'189',	'3191', '1140',	'190',	'3999', '1142',	'191', '1143',	'999', '1144',	'3193', '1145',	'3194', '1147',	'3197', '1148',	'3198', '1150',	'3199', '1151',	'3200', '1153',	'3201', '1154',	'3203', '1155',	'3204', '1156',	'3205', '1157',	'3207', '1158',	'3208', '1160',	'3209', '1161',	'3210', '1162',	'3211', '1163',	'3212', '1166',	'3213', '1167',	'3214', '1170',	'3215', '1172',	'3220', '1173',	'3221', '1175',	'3222', '1176',	'3226', '1182',	'3228', '1184', '1185', '1186', '1187', '1188', '1189', '1190', '1191', '1192', '1999', '193', '194', '196', '197', '198', '199', '200', '201', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '228']

w1_subjects=['001', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '015', '017', '018', '019', '022', '023', '024', '025', '026', '027', '028', '029', '030', '032',	'037', '038', '040', '043', '044', '045', '046', '047', '048', '054', '055', '056', '057', '058', '059', '060',	'061', '063', '064', '065', '068', '070', '071', '072', '074', '075', '077', '078',	'079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '097', '098', '099', '102', '103', '104', '106', '107', '108', '110', '111', '112', '114', '115', '116', '117', '118', '122', '123', '124', '125', '126', '128', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '142', '143', '144', '145', '147', '148', '150', '151', '153', '154', '155', '156', '157', '158', '160', '161', '162', '163', '166', '167', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '192', '999']

w2_subjects=['005', '006', '007', '008', '009', '011', '012', '017', '018', '019', '022', '023', '027', '028', '029', '030', '032', '037',	'038', '040', '044', '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '071', '072', '074', '075', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '122', '124', '125', '128', '131', '133', '134', '135', '136', '139', '140', '141', '142', '143', '144', '145', '147', '154', '155', '156', '157', '158', '160', '161', '162', '163', '170', '172',	'173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191',	'999', '193', '194', '196', '197', '198', '199', '200', '201', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '228']

w3_subjects=['003', '005', '006', '008', '009', '010', '011', '012', '017', '018', '019', '022', '023', '027', '028', '029', '030', '032', '038', '040', '043', '044', '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '070', '071', '074', '075', '078', '080', '085', '086', '087', '088', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '123', '124', '125', '126', '128', '131', '132', '133', '134', '135', '136', '138', '141', '142', '143', '144', '145', '147', '151', '154', '155', '156', '158', '160', '161', '162', '163', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '999', '193', '194', '197', '198', '199', '200', '201', '203', '204', '205', '207', '208', '209',	'210', '211', '212', '213',	'214', '215', '220', '221',	'222', '226', '228']

# saving stim text files to each subject's func folder
func_local = '/path_to_data/data_fmriprep/fmriprep'
out_dir = './out_dir/'

for subject in w1_subjects:
	try:
		print('Processing subject: {0} wave 1'.format(subject))
		func_folder = op.join(func_local, '{0}sess001'.format(subject), 'func')
		out_folder = op.join(out_dir, '{0}sess001'.format(subject), 'func')
		print(func_folder)

		for run in runs:
			# And grab each confound tsv file
			confound_file = op.join(func_folder, '{0}sess001_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			#df_in = csv.reader(file, delimiter="\t")
			#df_in = pd.read_csv('{0}'.format(file), sep='\t')
			df_in = pd.read_csv(confound_file, delimiter="\t", header=0)

			#Grab columns with 6 motion paramerters and their 6 derivatives
			#write 12 motion params to txt file
			#os.remove(op.join(func_folder,'Shapes{0}-motion.txt'.format(run)))
			#df_out.to_csv(op.join(func_folder,'Shapes{0}-motion.txt'.format(run)), sep='\t', index=False, header=False)

			#make 1s and 0s for censoring for each run
			fd = df_in['framewise_displacement']
			fd = fd[1:,]
			fd_cens = np.ones(len(fd.index)+1)
			fd_list = []
			for i, tmp_fd in enumerate(fd):
				if float(tmp_fd) > 0.90:
					fd_list.append(i+1)
			fd_cens[fd_list] = 0

			#write censor file for each run
			os.remove(op.join(out_folder,'Shapes{0}-censor_09.txt'.format(run)))
			with open(op.join(out_folder,'Shapes{0}-censor_09.txt'.format(run)), 'a') as fo:
				for tmp in fd_cens:
					fo.write('{0}\n'.format(tmp))

	#concatinate runs make new concat motion file
		#motion_df1 = pd.read_csv(op.join(func_folder, 'Shapes1-motion.txt'), delimiter="\t")
		#motion_df2 = pd.read_csv(op.join(func_folder, 'Shapes2-motion.txt'), delimiter="\t")
		#df = pd.concat([motion_df1, motion_df2], sort=True)
		#os.remove(op.join(func_folder,'Shapes-concat-motion.txt'))
		#df_out.to_csv(op.join(func_folder, 'Shapes-concat-motion.txt'), sep='\t', index=False, header=False)

	#concatinate runs make new concat censor file
	#censor_list1 = csv.reader(op.join(func_folder, 'Shapes1-censor.1D'), delimiter="\n")
	#censor_list2 = csv.reader(op.join(func_folder, 'Shapes2-censor.1D'), delimiter="\n")
	# using + operator to concat
	#cat_censor_list = censor_list1 + censor_list2
	#write censor file for each run
	#with open(op.join(func_folder,'Shapes-concat-censor.1D'), 'a') as fo:
		#for tmp in cat_censor_list:
			#fo.write('{0}\n'.format(tmp))
	except:
		print("missing {0} wave 1".format(subject))

for subject in w2_subjects:
	try:
		print('Processing subject: {0} wave 2'.format(subject))
		func_folder = op.join(func_local, '{0}sess002'.format(subject), 'func')
		out_folder = op.join(out_dir, '{0}sess002'.format(subject), 'func')
		print(func_folder)

		for run in runs:
			# And grab each confound tsv file
			confound_file = op.join(func_folder, '{0}sess002_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			#df_in = csv.reader(file, delimiter="\t")
			#df_in = pd.read_csv('{0}'.format(file), sep='\t')
			df_in = pd.read_csv(confound_file, delimiter="\t", header=0)

			#Grab columns with 6 motion paramerters and their 6 derivatives
			#write 12 motion params to txt file
			#os.remove(op.join(func_folder,'Shapes{0}-motion.txt'.format(run)))
			#df_out.to_csv(op.join(func_folder,'Shapes{0}-motion.txt'.format(run)), sep='\t', index=False, header=False)

			#make 1s and 0s for censoring for each run
			fd = df_in['framewise_displacement']
			fd = fd[1:,]
			fd_cens = np.ones(len(fd.index)+1)
			fd_list = []
			for i, tmp_fd in enumerate(fd):
				if float(tmp_fd) > 0.90:
					fd_list.append(i+1)
			fd_cens[fd_list] = 0

			#write censor file for each run
			os.remove(op.join(out_folder,'Shapes{0}-censor_09.txt'.format(run)))
			with open(op.join(out_folder,'Shapes{0}-censor_09.txt'.format(run)), 'a') as fo:
				for tmp in fd_cens:
					fo.write('{0}\n'.format(tmp))

	#concatinate runs make new concat motion file
		#motion_df1 = pd.read_csv(op.join(func_folder, 'Shapes1-motion.txt'), delimiter="\t")
		#motion_df2 = pd.read_csv(op.join(func_folder, 'Shapes2-motion.txt'), delimiter="\t")
		#df = pd.concat([motion_df1, motion_df2], sort=True)
		#os.remove(op.join(func_folder, 'Shapes-concat-motion.txt'))
		#df_out.to_csv(op.join(func_folder, 'Shapes-concat-motion.txt'), sep='\t', index=False, header=False)

	#concatinate runs make new concat censor file
	#censor_list1 = csv.reader(op.join(func_folder, 'Shapes1-censor.1D'), delimiter="\n")
	#censor_list2 = csv.reader(op.join(func_folder, 'Shapes2-censor.1D'), delimiter="\n")
	# using + operator to concat
	#cat_censor_list = censor_list1 + censor_list2
	#write censor file for each run
	#with open(op.join(func_folder,'Shapes-concat-censor.1D'), 'a') as fo:
		#for tmp in cat_censor_list:
			#fo.write('{0}\n'.format(tmp))
	except:
		print("missing {0} wave 2".format(subject))

for subject in w3_subjects:
	try:
		print('Processing subject: {0} wave 3'.format(subject))
		func_folder = op.join(func_local, '{0}sess003'.format(subject), 'func')
		out_folder = op.join(out_dir, '{0}sess003'.format(subject), 'func')
		print(func_folder)

		for run in runs:
			# And grab each confound tsv file
			confound_file = op.join(func_folder, '{0}sess003_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			#df_in = csv.reader(file, delimiter="\t")
			#df_in = pd.read_csv('{0}'.format(file), sep='\t')
			df_in = pd.read_csv(confound_file, delimiter="\t", header=0)

			#Grab columns with 6 motion paramerters and their 6 derivatives
			cols = ['trans_x', 'trans_x_derivative1', 'trans_y', 'trans_y_derivative1', 'trans_z', 'trans_z_derivative1', 'rot_x', 'rot_x_derivative1', 'rot_y', 'rot_y_derivative1', 'rot_z', 'rot_z_derivative1']

			df_out = df_in[cols]
			#write 12 motion params to txt file
			#os.remove(op.join(func_folder,'Shapes{0}-motion.txt'.format(run)))
			#df_out.to_csv(op.join(func_folder,'Shapes{0}-motion.txt'.format(run)), sep='\t', index=False, header=False)

			#make 1s and 0s for censoring for each run
			fd = df_in['framewise_displacement']
			fd = fd[1:,]
			fd_cens = np.ones(len(fd.index)+1)
			fd_list = []
			for i, tmp_fd in enumerate(fd):
				if float(tmp_fd) > 0.90:
					fd_list.append(i+1)
			fd_cens[fd_list] = 0

			#write censor file for each run
			os.remove(op.join(out_folder,'Shapes{0}-censor_09.txt'.format(run)))
			with open(op.join(out_folder,'Shapes{0}-censor_09.txt'.format(run)), 'a') as fo:
				for tmp in fd_cens:
					fo.write('{0}\n'.format(tmp))

	#concatinate runs make new concat motion file
		#motion_df1 = pd.read_csv(op.join(func_folder, 'Shapes1-motion.txt'), delimiter="\t")
		#motion_df2 = pd.read_csv(op.join(func_folder, 'Shapes2-motion.txt'), delimiter="\t")
		#df = pd.concat([motion_df1, motion_df2], sort=True)
		#os.remove(op.join(func_folder,'Shapes-concat-motion.txt'))
		#df_out.to_csv(op.join(func_folder, 'Shapes-concat-motion.txt'), sep='\t', index=False, header=False)

	#concatinate runs make new concat censor file
	#censor_list1 = csv.reader(op.join(func_folder, 'Shapes1-censor.1D'), delimiter="\n")
	#censor_list2 = csv.reader(op.join(func_folder, 'Shapes2-censor.1D'), delimiter="\n")
	# using + operator to concat
	#cat_censor_list = censor_list1 + censor_list2
	#write censor file for each run
	#with open(op.join(func_folder,'Shapes-concat-censor.1D'), 'a') as fo:
		#for tmp in cat_censor_list:
			#fo.write('{0}\n'.format(tmp))
	except:
		print("missing {0} wave 3".format(subject))
