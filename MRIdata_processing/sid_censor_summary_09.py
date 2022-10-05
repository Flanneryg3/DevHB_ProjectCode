
#################################################################################################
#  Find timepoints (TR's) with > 0.9 framewise_displacement using confound files from fmriprep output
#################################################################################################
#author: Jessica S. Flannery



import os
from os import listdir
import os.path as op
from glob import glob
import numpy as np
# Now third-party imports
import pandas as pd
import csv

runs = ['1', '2']

w1_subjects=['001', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '015', '017', '018', '019', '022', '023', '024', '025', '026', '027', '028', '029', '030', '032',	'037', '038', '040', '043', '044', '045', '046', '047', '048', '054', '055', '056', '057', '058', '059', '060',	'061', '063', '064', '065', '068', '070', '071', '072', '074', '075', '077', '078',	'079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '097', '098', '099', '102', '103', '104', '106', '107', '108', '110', '111', '112', '114', '115', '116', '117', '118', '122', '123', '124', '125', '126', '128', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '142', '143', '144', '145', '147', '148', '150', '151', '153', '154', '155', '156', '157', '158', '160', '161', '162', '163', '166', '167', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '192', '999']

w2_subjects=['005', '006', '007', '008', '009', '011', '012', '017', '018', '019', '022', '023', '027', '028', '029', '030', '032', '037',	'038', '040', '044', '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '071', '072', '074', '075', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '122', '124', '125', '128', '131', '133', '134', '135', '136', '139', '140', '141', '142', '143', '144', '145', '147', '154', '155', '156', '157', '158', '160', '161', '162', '163', '170', '172',	'173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191',	'999', '193', '194', '196', '197', '198', '199', '200', '201', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '228']

w3_subjects=['003', '005', '006', '008', '009', '010', '011', '012', '017', '018', '019', '022', '023', '027', '028', '029', '030', '032', '038', '040', '043', '044',  '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '070', '071', '074', '075', '078', '080', '085', '086', '087', '088', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '123', '124', '125', '126', '128', '131', '132', '133', '134', '135', '136', '138', '141', '142', '143', '144', '145', '147', '151', '154', '155', '156', '158', '160', '161', '162', '163', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '999', '193', '194', '197', '198', '199', '200', '201', '203', '204', '205', '207', '208', '209',	'210', '211', '212', '213',	'214', '215', '220', '221',	'222', '226', '228']

func_local = './data_fmriprep/fmriprep'
out_dir = './outdir/'

############################################################################
#   WAVE 1 FD descriptives
###############################################################################

for run in runs:
	for subject in w1_subjects:
		try:
			print('Processing subject: {0} wave 1 run {1}'.format(subject, run))
			func_folder = op.join(func_local, '{0}sess001'.format(subject), 'func')
			print(func_folder)

			FD_text = []
			FD_text_for_sample =[]
			#get confound tsv files for both Shape runs
			sub_file = op.join(func_folder, '{0}sess001_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			df = pd.read_csv(sub_file, sep='\t')
			FD = df['framewise_displacement']

			#get each subjects mean FD for that run
			FD = [df['framewise_displacement'].mean()]
			print(FD)

		#join each subject's two run's mean fd with a new line
		#make a file with all subject's two mean FD values
			FD_file = op.join(out_dir, 'FD_summary_sid{0}_w1.txt'.format(run))
			with open(FD_file, "a") as file:
				file.write('{0}'.format(subject) + '\t' + '{0}'.format(run) + '\t'+ str(FD) + '\n')
		except:
			print("missing sub {0} censoring wave 1".format(subject))
############################################################################
#   WAVE 1 censoring descriptives
###############################################################################

for subject in w1_subjects:
	try:
		print('Processing subject: {0} wave 1'.format(subject))
		func_folder = op.join(out_dir, 'HB', '{0}sess001'.format(subject), 'func')
		print(func_folder)

		censor_text = []
		all_tr_text = []

		for run in runs:
			#get censor 1D files for both Shape runs
			censor_file = op.join(func_folder, 'Shapes{0}-censor_09.txt'.format(run))

			#Prefix to add to column numbers when no header
			df = pd.read_csv(censor_file, delimiter="\t", header=None, prefix="cen")
			a = [df[['cen0']].sum()]
			b = [df[['cen0']].count()]
			censor = np.subtract(b, a)

			#join values from two runs in one line with tab
			censor_text.append('\t'.join([str(num) for num in censor]))
			all_tr_text.append('\t'.join([str(num) for num in b]))

		#join values from all subjects with enter
		censor_sum_file = op.join(out_dir, 'censor_summary_sid_w1.txt')
		with open(censor_sum_file, "a") as file:
			file.write('{0}'.format(subject) + '\t' + str(censor_text) + '\n')

		tr_sum_file = op.join(out_dir, 'tr_summary_sid_w1.txt')
		with open(tr_sum_file, "a") as file:
			file.write('{0}'.format(subject) + '\t' + str(all_tr_text) + '\n')

	except:
		print("missing sub {0} censoring wave 1".format(subject))

############################################################################
#   WAVE 2 FD descriptives
###############################################################################

for run in runs:
	for subject in w2_subjects:
		try:
			print('Processing subject: {0} wave 2 run {1}'.format(subject, run))
			func_folder = op.join(func_local, '{0}sess002'.format(subject), 'func')
			print(func_folder)

			FD_text = []
			FD_text_for_sample =[]
			#get confound tsv files for both Shape runs
			sub_file = op.join(func_folder, '{0}sess002_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			df = pd.read_csv(sub_file, sep='\t')
			FD = df['framewise_displacement']

			#get each subjects mean FD for that run
			FD = [df['framewise_displacement'].mean()]
			print(FD)

	#join each subject's two run's mean fd with a new line
	#make a file with all subject's two mean FD values
			FD_file = op.join(out_dir, 'FD_summary_sid{0}_w2.txt'.format(run))
			with open(FD_file, "a") as file:
				file.write('{0}'.format(subject) + '\t' + '{0}'.format(run) + '\t'+ str(FD) + '\n')
		except:
			print("missing sub {0} censoring wave 2".format(subject))
############################################################################
#   WAVE 2 censoring descriptives
###############################################################################

for subject in w2_subjects:
	try:
		print('Processing subject: {0} wave 2'.format(subject))
		func_folder = op.join(out_dir, 'HB', '{0}sess002'.format(subject), 'func')
		print(func_folder)

		censor_text = []
		all_tr_text = []

		for run in runs:
			#get censor 1D files for both Shape runs
			censor_file = op.join(func_folder, 'Shapes{0}-censor_09.txt'.format(run))

			#Prefix to add to column numbers when no header
			df = pd.read_csv(censor_file, delimiter="\t", header=None, prefix="cen")
			a = [df[['cen0']].sum()]
			b = [df[['cen0']].count()]
			censor = np.subtract(b, a)

			#join values from two runs in one line with tab
			censor_text.append('\t'.join([str(num) for num in censor]))
			all_tr_text.append('\t'.join([str(num) for num in b]))

		#join values from all subjects with enter
		censor_sum_file = op.join(out_dir, 'censor_summary_sid_w2.txt')
		with open(censor_sum_file, "a") as file:
			file.write('{0}'.format(subject) + '\t' + str(censor_text) + '\n')

		tr_sum_file = op.join(out_dir, 'tr_summary_sid_w2.txt')
		with open(tr_sum_file, "a") as file:
			file.write('{0}'.format(subject) + '\t' + str(all_tr_text) + '\n')

	except:
		print("missing sub {0} censoring wave 2".format(subject))



############################################################################
#   WAVE 3 FD descriptives
###############################################################################

for run in runs:
	for subject in w3_subjects:
		try:
			print('Processing subject: {0} wave 3 run {1}'.format(subject, run))
			func_folder = op.join(func_local, '{0}sess003'.format(subject), 'func')
			print(func_folder)

			FD_text = []
			FD_text_for_sample =[]
			#get confound tsv files for both Shape runs
			sub_file = op.join(func_folder, '{0}sess003_task-Shapes{1}_desc-confounds_regressors.tsv'.format(subject, run))
			df = pd.read_csv(sub_file, sep='\t')
			FD = df['framewise_displacement']

			#get each subjects mean FD for that run
			FD = [df['framewise_displacement'].mean()]

			#join each subject's two run's mean fd with a new line
			#make a file with all subject's two mean FD values
			FD_file = op.join(out_dir, 'FD_summary_sid{0}_w3.txt'.format(run))
			with open(FD_file, "a") as file:
				file.write('{0}'.format(subject) + '\t' + '{0}'.format(run) + '\t'+ str(FD) + '\n')
		except:
			print("missing sub {0} censoring wave 3".format(subject))
############################################################################
#   WAVE 3 censoring descriptives
###############################################################################

for subject in w3_subjects:
	try:
		print('Processing subject: {0} wave 3'.format(subject))
		func_folder = op.join(out_dir, 'HB', '{0}sess003'.format(subject), 'func')
		print(func_folder)

		censor_text = []
		all_tr_text = []

		for run in runs:
			#get censor 1D files for both Shape runs
			censor_file = op.join(func_folder, 'Shapes{0}-censor_09.txt'.format(run))

			#Prefix to add to column numbers when no header
			df = pd.read_csv(censor_file, delimiter="\t", header=None, prefix="cen")
			a = [df[['cen0']].sum()]
			b = [df[['cen0']].count()]
			censor = np.subtract(b, a)

			#join values from two runs in one line with tab
			censor_text.append('\t'.join([str(num) for num in censor]))
			all_tr_text.append('\t'.join([str(num) for num in b]))

		#join values from all subjects with enter
		censor_sum_file = op.join(out_dir, 'censor_summary_sid_w3.txt')
		with open(censor_sum_file, "a") as file:
			file.write('{0}'.format(subject) + '\t' + str(censor_text) + '\n')

		tr_sum_file = op.join(out_dir, 'tr_summary_sid_w3.txt')
		with open(tr_sum_file, "a") as file:
			file.write('{0}'.format(subject) + '\t' + str(all_tr_text) + '\n')

	except:
		print("missing sub {0} censoring wave 3".format(subject))
