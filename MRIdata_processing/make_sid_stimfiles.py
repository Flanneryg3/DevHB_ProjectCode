#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# AFNI Social Incentive Delay (SID) Stim Files. event design
#requires behavioral task data to be in certain CSV file format
#Author: Jessica S. Flannery, 9-8-21


#######################
# SID TASK info
#######################
#task events:
#######################
#- anticipation: reward (cue)
#- anticipation: punishment (cue)
#- anticipation: neurtral (cue)
#- reward hit outcome
#- reward miss outcome
#- punish hit outcome
#- punish miss outcome
#- neutral outcome

#######################
#contrasts of intrest:
#######################
#- reward-neutral anticipation
#- punish-neutral anticipation
#- valence-neutral anticipation
#- reward-punish anticipation

#- Rhit-neutral outcome
#- Rmiss-neutral outcome
#- Rhit-Rmiss outcome

#- Phit-neutral outcome
#- Pmiss-neutral outcome
#- Phit-Pmiss outcome

#- Rhit-Phit outcome
#- Rmiss-Pmiss outcome
#- Rhit-Pmiss outcome
#- Rmiss-Phit outcome
########################

# task
#- 2 runs
#- The task has 2 rounds. Each round of the task lasted 6.5 minutes, 13 minutes total.
#- Each of the 2 rounds consists of 58 trials.
#- Round 1 consists of 24 Circles (Reward trials), 24 Triangles (Punishment trials), and 10 Diamonds (Neutral trials). Round 2 also consists of 24 Circles, 24 Triangles, and 10 Diamonds.



#############################################################################################
# Standard imports (i.e., Python builtins) go at the top
import os
import os.path as op
import os
from glob import glob
import numpy as np

# Now third-party imports
import pandas as pd
import xlrd
import openpyxl
##############################################################################################
#This script has to be re-run for each wave separatly
#waves= ['1', '', '3']

runs=['1', '2']

#subjects=['001', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '015', '017', '018', '019', '022', '023', '024', '025', '026', '027', '028', '029', '030', '032', '037', '038', '040', '043', '044', '045', '046', '047', '048', '054', '055', '056', '057', '058', '059', '060', '061', '062', '063', '064', '065', '068', '070', '071', '072', '074', '075', '077', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '097', '098', '099', '102', '103', '104', '106', '107', '108', '110', '111', '112', '114', '115', '116', '117', '118', '122', '123', '124', '125', '126', '128', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '142', '143', '144', '145', '147', '148', '150', '151', '153', '154', '155', '156', '157', '158', '160', '161', '162', '163', '166', '167', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '192', '999', '119', '141', '193', '194', '196', '197', '198', '199', '00', '01', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '28', '26']
##############################################################################################

#full_subjects=['1001', '005', '3003', '1003', '006',	'3005', '1004',	'007',	'3006', '1005',	'008',	'3008', '1006', '009', '3009', '1007',	'011',	'3010', '1008',	'012',	'3011', '1009',	'017',	'3012', '1010',	'018',	'3017', '1011', '019',	'3018', '1012',	'022',	'3019', '1013',	'023',	'3022', '1015',	'027',	'3023', '1017',	'028', '3027', '1018',	'029',	'3028', '1019', '030',	'3029', '1022',	'032',	'3030', '1023',	'037',	'3032', '1024',	'038', '3038', '1025',	'040',	'3040', '1026',	'044',	'3043', '1027', '045',	'3044', '1028',	'047',	'3045', '1029', '054',	'3047', '1030',	'055',	'3054', '1032',	'056',	'3055', '1037',	'059',	'3056', '1038',	'060',	'3059', '1040',	'061',	'3060', '1043',	'062',	'3061', '1044',	'063',	'3062', '1045',	'064',	'3063', '1046',	'068',	'3064', '1047', '071', '3068', '1048',	'072',	'3070', '1054',	'074',	'3071', '1055',	'075',	'3074', '1056',	'078',	'3075', '1057',	'079',	'3078', '1058', '080',	'3080', '1059',	'081',	'3085', '1060',	'084',	'3086', '1061',	'085',	'3087', '1063',	'086',	'3088', '1064',	'087',	'3092', '1065',	'088',	'3093', '1068',	'090',	'3095', '1070', '092',	'3096', '1071',	'093',	'3098', '1072',	'095',	'3099', '1074',	'096',	'3103', '1075',	'098',	'3104', '1077',	'099',	'3106', '1078',	'103',	'3111', '1079',	'104',	'3114', '1080',	'106',	'3115', '1081',	'111',	'3116', '1084',	'114',	'3118', '1085', '115', '3119', '1086',	'116',	'3123', '1087',	'118',	'3124', '1088',	'119',	'3125', '1090',	'122',	'3126', '1092',	'124',	'3128', '1093', '125',	'3131', '1095',	'128',	'3132', '1096',	'131',	'3133', '1097',	'133',	'3134', '1098',	'134',	'3135', '1099',	'135',	'3136', '1102',	'136',	'3138', '1103',	'139',	'3141', '1104', '140',	'3142', '1106',	'141',	'3143', '1107',	'142',	'3144', '1108', '143',	'3145', '1110',	'144',	'3147', '1111',	'145',	'3151', '1112',	'147',	'3154', '1114',	'154',	'3155', '1115',	'155',	'3156', '1116', '156',	'3158', '1117',	'157',	'3160', '1118',	'158',	'3161', '1122',	'160',	'3162', '1123',	'161',	'3163', '1124',	'162',	'3170', '1125',	'163',	'3172', '1126',	'170',	'3173', '1128',	'172',	'3175', '1130',	'173',	'3176', '1131',	'175',	'3182', '1132', '176', '3184', '1133',	'182',	'3185', '1134',	'184',	'3186', '1135',	'185',	'3187', '1136',	'186',	'3188', '1137',	'187',	'3189', '1138', '188',	'3190', '1139',	'189',	'3191', '1140',	'190',	'3999', '1142',	'191', '1143',	'999', '1144',	'3193', '1145',	'3194', '1147',	'3197', '1148',	'3198', '1150',	'3199', '1151',	'3200', '1153',	'3201', '1154',	'3203', '1155',	'3204', '1156',	'3205', '1157',	'3207', '1158',	'3208', '1160',	'3209', '1161',	'3210', '1162',	'3211', '1163',	'3212', '1166',	'3213', '1167',	'3214', '1170',	'3215', '1172',	'3220', '1173',	'3221', '1175',	'3222', '1176',	'3226', '1182',	'3228', '1184', '1185', '1186', '1187', '1188', '1189', '1190', '1191', '1192', '1999', '193', '194', '196', '197', '198', '199', '200', '201', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '228']

w1_subjects=['001', '003', '004', '005', '006', '007', '008', '009', '010', '011', '012', '013', '015', '017', '018', '019', '022', '023', '024', '025', '026', '027', '028', '029', '030', '032', '037', '038', '040', '043',	'044', '045', '046', '047', '048', '054', '055', '056', '057', '058', '059', '060',	'061', '063', '064', '065', '068', '070', '071', '072', '074', '075', '077', '078',	'079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '097', '098', '099', '102', '103', '104', '106', '107', '108', '110', '111', '112', '114', '115', '116', '117', '118', '122', '123', '124', '125', '126', '128', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '142', '143', '144', '145', '147', '148', '150', '151', '153', '154', '155', '156', '157', '158', '160', '161', '162', '163', '166', '167', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '192', '999']

w2_subjects=['005', '006', '007', '008', '009', '011', '012', '017', '018', '019', '022', '023', '027',	'028',	'029', '030', '032', '037',	'038', '040', '044', '045', '047', '054', '055', '056', '059', '060', '061', '062', '063', '064', '068', '071', '072', '074', '075', '078', '079', '080', '081', '084', '085', '086', '087', '088', '090', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '122', '124', '125', '128', '131', '133', '134', '135', '136', '139', '140', '141', '142', '143', '144', '145', '147', '154', '155', '156', '157', '158', '160', '161', '162', '163', '170', '172',	'173', '175', '176', '182',	'184', '185', '186', '187', '188', '189', '190', '191',	'999', '193', '194', '196', '197', '198', '199', '200', '201', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '228']

w3_subjects=['003', '005', '006', '008', '009', '010', '011', '012', '017', '018', '019', '022', '023', '027',	'028', '029', '030', '032', '038', '040', '043', '044', '045', '047', '054', '055', '056', '059', '060', '061',	'062', '063', '064', '068', '070', '071', '074', '075', '078', '080', '085', '086', '087', '088', '092', '093', '095', '096', '098', '099', '103', '104', '106', '111', '114', '115', '116', '118', '119', '123', '124', '125', '126', '128', '131', '132', '133', '134', '135', '136', '138', '141', '142', '143', '144', '145', '147', '151', '154', '155', '156', '158', '160', '161', '162', '163', '170', '172', '173', '175', '176', '182', '184', '185', '186', '187', '188', '189', '190', '191', '999', '193', '194', '197', '198', '199', '200', '201', '203', '204', '205', '207', '208', '209',	'210', '211', '212', '213',	'214', '215', '220', '221',	'222', '226', '228']

# saving stim text files to each subject's func folder
func_local = '/path_to_data/'

#where we are grabing the eprime excel files from and where we are writting to new run-spesifc csv files
in_folder = '/path_to_behavioral_csv_files/eprime_data/shape_csv_files'

for subject in w1_subjects:
    print('Processing subject: {0}'.format(subject))
    func_folder = op.join(func_local, '{0}sess001'.format(subject), 'func')
    print(func_folder)
    # And grab *all* sid task events files
    try:
        stim_file = op.join(in_folder, 'NT1{0}_Shapes.xlsx'.format(subject))
        df = pd.read_excel(stim_file, sheet_name='Raw', header=0)
    except:
        print("missing wave")
    try:
        #convert onset times from miliseconds to seconds
        df['Cue_OnsetTime_sec'] = np.divide(df['Cue_OnsetTime'].values, 1000)
        df['Feedback_OnsetTime_sec'] = np.divide(df['Feedback_OnsetTime'].values, 1000)
        df['GetReady_OnsetTime'] = np.divide(df['GetReady_OnsetTime'].values, 1000)
        df['GetReady2_OnsetTime'] = np.divide(df['GetReady2_OnsetTime'].values, 1000)
    except:
        #convert onset times from miliseconds to seconds
        df['Cue_OnsetTime_sec'] = np.divide(df['CueOnsetTime'].values, 1000)
        df['Feedback_OnsetTime_sec'] = np.divide(df['FeedbackOnsetTime'].values, 1000)
        df['Target_RESP'] = df['TargetRESP']
        df['GetReady_OnsetTime'] = np.divide(df['GetReadyOnsetTime'].values, 1000)
        df['GetReady2_OnsetTime'] = np.divide(df['GetReady2OnsetTime'].values, 1000)

    #split into two runs and save two run csv files
    dfr1 = df.iloc[:58]
    dfr2 = df.iloc[58:]

    dfr1['Cue_OnsetTime_sec'] = dfr1['Cue_OnsetTime_sec'].subtract(dfr1['GetReady_OnsetTime'].values)
    dfr2['Cue_OnsetTime_sec'] = dfr2['Cue_OnsetTime_sec'].subtract(dfr2['GetReady2_OnsetTime'].values)
    dfr1['Feedback_OnsetTime_sec'] = dfr1['Feedback_OnsetTime_sec'].subtract(dfr1['GetReady_OnsetTime'].values)
    dfr2['Feedback_OnsetTime_sec'] = dfr2['Feedback_OnsetTime_sec'].subtract(dfr2['GetReady2_OnsetTime'].values)

    dfr1.to_csv(op.join(in_folder, '{0}-wave1-run1.csv'.format(subject)))
    dfr2.to_csv(op.join(in_folder,'{0}-wave1-run2.csv'.format(subject)))

    reward_cue_text = []
    punish_cue_text = []
    neutral_cue_text = []
    Rhit_text = []
    Rmiss_text = []
    Phit_text = []
    Pmiss_text = []
    Nhit_text = []
    Nmiss_text = []

    for run in runs:
    	#Make lists to place all lines in
    	run_df = (op.join(in_folder, '{0}-wave1-run{1}.csv'.format(subject, run)))
    	df = pd.read_csv(run_df, header=0)

    	# Grab reward cue trials and get cue onset time
    	reward_cue_df = df.loc[df['TrialType'].isin(['Reward'])]
    	reward_cue = reward_cue_df['Cue_OnsetTime_sec'].values
    	if reward_cue.size == 0:
    		reward_cue = ['']
    	reward_cue_text.append('\t'.join([str(num) for num in reward_cue]))

    	# Grab punish cue trials and get cue onset time
    	punish_cue_df = df.loc[df['TrialType'].isin(['Punish'])]
    	punish_cue = punish_cue_df['Cue_OnsetTime_sec'].values
    	if punish_cue.size == 0:
    		punish_cue = ['']
    	punish_cue_text.append('\t'.join([str(num) for num in punish_cue]))

    	# Grab neutral cue trials and get cue onset time
    	neutral_cue_df = df.loc[df['TrialType'].isin(['Neutral'])]
    	neutral_cue = neutral_cue_df['Cue_OnsetTime_sec'].values
    	if neutral_cue.size == 0:
    		neutral_cue = ['']
    	neutral_cue_text.append('\t'.join([str(num) for num in neutral_cue]))

    	# Grab reward hit trials and get outcome onset time
    	reward_hit_df = reward_cue_df.loc[reward_cue_df['Target_RESP'].isin([float('2.0')])]
    	reward_hit = reward_hit_df['Feedback_OnsetTime_sec'].values
    	if reward_hit.size == 0:
    		reward_hit = ['']
    	Rhit_text.append('\t'.join([str(num) for num in reward_hit]))

    	# Grab reward miss trials and get outcome onset time
    	reward_miss_df = reward_cue_df.loc[reward_cue_df['Target_RESP'].isin([float('NaN')])]
    	reward_miss = reward_miss_df['Feedback_OnsetTime_sec'].values
    	if reward_miss.size == 0:
    		reward_miss = ['']
    	Rmiss_text.append('\t'.join([str(num) for num in reward_miss]))

    	# Grab punish hit trials and get outcome onset time
    	punish_cue_df = df.loc[df['TrialType'].isin(['Punish'])]
    	punish_hit_df = punish_cue_df.loc[punish_cue_df['Target_RESP'].isin([float('2.0')])]
    	punish_hit = punish_hit_df['Feedback_OnsetTime_sec'].values
    	if punish_hit.size == 0:
    		punish_hit = ['']
    	Phit_text.append('\t'.join([str(num) for num in punish_hit]))

    	#Grab punish miss trials and get outcome onset time
    	punish_miss_df = punish_cue_df.loc[punish_cue_df['Target_RESP'].isin([float('NaN')])]
    	punish_miss = punish_miss_df['Feedback_OnsetTime_sec'].values
    	if punish_miss.size == 0:
    		punish_miss = ['']
    	Pmiss_text.append('\t'.join([str(num) for num in punish_miss]))

    	#Grab neutral cue trials and get outcome onset time
    	Nhit_df = neutral_cue_df.loc[neutral_cue_df['Target_RESP'].isin([float('2.0')])]
    	Nhit = Nhit_df['Feedback_OnsetTime_sec'].values
    	if Nhit.size == 0:
    		Nhit = ['']
    	Nhit_text.append('\t'.join([str(num) for num in Nhit]))

    	#Grab neutral cue trials and get outcome onset time
    	Nmiss_df = neutral_cue_df.loc[neutral_cue_df['Target_RESP'].isin([float('NaN')])]
    	Nmiss = Nmiss_df['Feedback_OnsetTime_sec'].values
    	if Nmiss.size == 0:
    		Nmiss = ['']
    	Nmiss_text.append('\t'.join([str(num) for num in Nmiss]))

    #different line for each run
    #Merge list of single-line strings into multiline string
    reward_cue_text = '\n'.join(reward_cue_text)
    punish_cue_text = '\n'.join(punish_cue_text)
    neutral_cue_text = '\n'.join(neutral_cue_text)
    Rhit_text = '\n'.join(Rhit_text)
    Rmiss_text = '\n'.join(Rmiss_text)
    Phit_text = '\n'.join(Phit_text)
    Pmiss_text = '\n'.join(Pmiss_text)
    Nhit_text = '\n'.join(Nhit_text)
    Nmiss_text = '\n'.join(Nmiss_text)

    #different file for each event type
    reward_cue_file = op.join(func_folder, 'reward_cue.txt')
    os.remove(reward_cue_file)
    with open(reward_cue_file, 'w') as fo:
    	fo.write(reward_cue_text)

    punish_cue_file = op.join(func_folder, 'punish_cue.txt')
    os.remove(punish_cue_file)
    with open(punish_cue_file, 'w') as fo:
    	fo.write(punish_cue_text)

    neutral_cue_file = op.join(func_folder, 'neutral_cue.txt')
    os.remove(neutral_cue_file)
    with open(neutral_cue_file, 'w') as fo:
    	fo.write(neutral_cue_text)

    Rhit_file = op.join(func_folder, 'Rhit.txt')
    os.remove(Rhit_file)
    with open(Rhit_file, 'w') as fo:
    	fo.write(Rhit_text)

    Rmiss_file = op.join(func_folder, 'Rmiss.txt')
    os.remove(Rmiss_file)
    with open(Rmiss_file, 'w') as fo:
    	fo.write(Rmiss_text)

    Phit_file = op.join(func_folder, 'Phit.txt')
    os.remove(Phit_file)
    with open(Phit_file, 'w') as fo:
    	fo.write(Phit_text)

    Pmiss_file = op.join(func_folder, 'Pmiss.txt')
    os.remove(Pmiss_file)
    with open(Pmiss_file, 'w') as fo:
    	fo.write(Pmiss_text)

    Nhit_file = op.join(func_folder, 'Nhit.txt')
    os.remove(Nhit_file)
    with open(Nhit_file, 'w') as fo:
    	fo.write(Nhit_text)

    Nmiss_file = op.join(func_folder, 'Nmiss.txt')
    os.remove(Nmiss_file)
    with open(Nmiss_file, 'w') as fo:
    	fo.write(Nmiss_text)
#########################################################################################################
#end
#
for subject in w2_subjects:
    print('Processing subject: {0}'.format(subject))
    func_folder = op.join(func_local, '{0}sess002'.format(subject), 'func')
    print(func_folder)
    # And grab *all* nback task events files
    try:
        stim_file = op.join(in_folder, 'NT2{0}_Shapes.xlsx'.format(subject))
        df = pd.read_excel(stim_file, sheet_name='Raw', header=0)
    except:
        print("missing wave")
    try:
        #convert onset times from miliseconds to seconds
        df['Cue_OnsetTime_sec'] = np.divide(df['Cue_OnsetTime'].values, 1000)
        df['Feedback_OnsetTime_sec'] = np.divide(df['Feedback_OnsetTime'].values, 1000)
        df['GetReady_OnsetTime'] = np.divide(df['GetReady_OnsetTime'].values, 1000)
        df['GetReady2_OnsetTime'] = np.divide(df['GetReady2_OnsetTime'].values, 1000)
    except:
        #convert onset times from miliseconds to seconds
        df['Cue_OnsetTime_sec'] = np.divide(df['CueOnsetTime'].values, 1000)
        df['Feedback_OnsetTime_sec'] = np.divide(df['FeedbackOnsetTime'].values, 1000)
        df['Target_RESP'] = df['TargetRESP']
        df['GetReady_OnsetTime'] = np.divide(df['GetReadyOnsetTime'].values, 1000)
        df['GetReady2_OnsetTime'] = np.divide(df['GetReady2OnsetTime'].values, 1000)

    #split into two runs and save two run csv files
    dfr1 = df.iloc[:58]
    dfr2 = df.iloc[58:]

    dfr1['Cue_OnsetTime_sec'] = dfr1['Cue_OnsetTime_sec'].subtract(dfr1['GetReady_OnsetTime'].values)
    dfr2['Cue_OnsetTime_sec'] = dfr2['Cue_OnsetTime_sec'].subtract(dfr2['GetReady2_OnsetTime'].values)
    dfr1['Feedback_OnsetTime_sec'] = dfr1['Feedback_OnsetTime_sec'].subtract(dfr1['GetReady_OnsetTime'].values)
    dfr2['Feedback_OnsetTime_sec'] = dfr2['Feedback_OnsetTime_sec'].subtract(dfr2['GetReady2_OnsetTime'].values)

    dfr1.to_csv(op.join(in_folder, '{0}-wave2-run1.csv'.format(subject)))
    dfr2.to_csv(op.join(in_folder,'{0}-wave2-run2.csv'.format(subject)))

    reward_cue_text = []
    punish_cue_text = []
    neutral_cue_text = []
    Rhit_text = []
    Rmiss_text = []
    Phit_text = []
    Pmiss_text = []
    Nhit_text = []
    Nmiss_text = []

    for run in runs:
    	# Make lists to place all lines in
    	run_df = (op.join(in_folder, '{0}-wave2-run{1}.csv'.format(subject, run)))
    	df = pd.read_csv(run_df, header=0)

    	# Grab reward cue trials and get cue onset time
    	reward_cue_df = df.loc[df['TrialType'].isin(['Reward'])]
    	reward_cue = reward_cue_df['Cue_OnsetTime_sec'].values
    	if reward_cue.size == 0:
    		reward_cue = ['']
    	reward_cue_text.append('\t'.join([str(num) for num in reward_cue]))

    	# Grab punish cue trials and get cue onset time
    	punish_cue_df = df.loc[df['TrialType'].isin(['Punish'])]
    	punish_cue = punish_cue_df['Cue_OnsetTime_sec'].values
    	if punish_cue.size == 0:
    		punish_cue = ['']
    	punish_cue_text.append('\t'.join([str(num) for num in punish_cue]))

    	# Grab neutral cue trials and get cue onset time
    	neutral_cue_df = df.loc[df['TrialType'].isin(['Neutral'])]
    	neutral_cue = neutral_cue_df['Cue_OnsetTime_sec'].values
    	if neutral_cue.size == 0:
    		neutral_cue = ['']
    	neutral_cue_text.append('\t'.join([str(num) for num in neutral_cue]))

    	# Grab reward hit trials and get outcome onset time
    	reward_hit_df = reward_cue_df.loc[reward_cue_df['Target_RESP'].isin([float('2.0')])]
    	reward_hit = reward_hit_df['Feedback_OnsetTime_sec'].values
    	if reward_hit.size == 0:
    		reward_hit = ['']
    	Rhit_text.append('\t'.join([str(num) for num in reward_hit]))

    	# Grab reward miss trials and get outcome onset time
    	reward_miss_df = reward_cue_df.loc[reward_cue_df['Target_RESP'].isin([float('NaN')])]
    	reward_miss = reward_miss_df['Feedback_OnsetTime_sec'].values
    	if reward_miss.size == 0:
    		reward_miss = ['']
    	Rmiss_text.append('\t'.join([str(num) for num in reward_miss]))

    	# Grab punish hit trials and get outcome onset time
    	punish_cue_df = df.loc[df['TrialType'].isin(['Punish'])]
    	punish_hit_df = punish_cue_df.loc[punish_cue_df['Target_RESP'].isin([float('2.0')])]
    	punish_hit = punish_hit_df['Feedback_OnsetTime_sec'].values
    	if punish_hit.size == 0:
    		punish_hit = ['']
    	Phit_text.append('\t'.join([str(num) for num in punish_hit]))

    	#Grab punish miss trials and get outcome onset time
    	punish_miss_df = punish_cue_df.loc[punish_cue_df['Target_RESP'].isin([float('NaN')])]
    	punish_miss = punish_miss_df['Feedback_OnsetTime_sec'].values
    	if punish_miss.size == 0:
    		punish_miss = ['']
    	Pmiss_text.append('\t'.join([str(num) for num in punish_miss]))

    	#Grab neutral cue trials and get outcome onset time
    	Nhit_df = neutral_cue_df.loc[neutral_cue_df['Target_RESP'].isin([float('2.0')])]
    	Nhit = Nhit_df['Feedback_OnsetTime_sec'].values
    	if Nhit.size == 0:
    		Nhit = ['']
    	Nhit_text.append('\t'.join([str(num) for num in Nhit]))

    	#Grab neutral cue trials and get outcome onset time
    	Nmiss_df = neutral_cue_df.loc[neutral_cue_df['Target_RESP'].isin([float('NaN')])]
    	Nmiss = Nmiss_df['Feedback_OnsetTime_sec'].values
    	if Nmiss.size == 0:
    		Nmiss = ['']
    	Nmiss_text.append('\t'.join([str(num) for num in Nmiss]))

    #different line for each run
    #Merge list of single-line strings into multiline string
    reward_cue_text = '\n'.join(reward_cue_text)
    punish_cue_text = '\n'.join(punish_cue_text)
    neutral_cue_text = '\n'.join(neutral_cue_text)
    Rhit_text = '\n'.join(Rhit_text)
    Rmiss_text = '\n'.join(Rmiss_text)
    Phit_text = '\n'.join(Phit_text)
    Pmiss_text = '\n'.join(Pmiss_text)
    Nhit_text = '\n'.join(Nhit_text)
    Nmiss_text = '\n'.join(Nmiss_text)

    #different file for each event type
    reward_cue_file = op.join(func_folder, 'reward_cue.txt')
    os.remove(reward_cue_file)
    with open(reward_cue_file, 'w') as fo:
    	fo.write(reward_cue_text)

    punish_cue_file = op.join(func_folder, 'punish_cue.txt')
    os.remove(punish_cue_file)
    with open(punish_cue_file, 'w') as fo:
    	fo.write(punish_cue_text)

    neutral_cue_file = op.join(func_folder, 'neutral_cue.txt')
    os.remove(neutral_cue_file)
    with open(neutral_cue_file, 'w') as fo:
    	fo.write(neutral_cue_text)

    Rhit_file = op.join(func_folder, 'Rhit.txt')
    os.remove(Rhit_file)
    with open(Rhit_file, 'w') as fo:
    	fo.write(Rhit_text)

    Rmiss_file = op.join(func_folder, 'Rmiss.txt')
    os.remove(Rmiss_file)
    with open(Rmiss_file, 'w') as fo:
    	fo.write(Rmiss_text)

    Phit_file = op.join(func_folder, 'Phit.txt')
    os.remove(Phit_file)
    with open(Phit_file, 'w') as fo:
    	fo.write(Phit_text)

    Pmiss_file = op.join(func_folder, 'Pmiss.txt')
    os.remove(Pmiss_file)
    with open(Pmiss_file, 'w') as fo:
    	fo.write(Pmiss_text)

    Nhit_file = op.join(func_folder, 'Nhit.txt')
    os.remove(Nhit_file)
    with open(Nhit_file, 'w') as fo:
    	fo.write(Nhit_text)

    Nmiss_file = op.join(func_folder, 'Nmiss.txt')
    os.remove(Nmiss_file)
    with open(Nmiss_file, 'w') as fo:
    	fo.write(Nmiss_text)
#########################################################################################################
#end
#
#
for subject in w3_subjects:
    print('Processing subject: {0}'.format(subject))
    func_folder = op.join(func_local, '{0}sess003'.format(subject), 'func')
    print(func_folder)
    # And grab *all* nback task events files
    try:
        stim_file = op.join(in_folder, 'NT3{0}_Shapes.xlsx'.format(subject))
        df = pd.read_excel(stim_file, sheet_name='Raw', header=0)
    except:
        print("missing wave")
    try:
        #convert onset times from miliseconds to seconds
        df['Cue_OnsetTime_sec'] = np.divide(df['Cue_OnsetTime'].values, 1000)
        df['Feedback_OnsetTime_sec'] = np.divide(df['Feedback_OnsetTime'].values, 1000)
        df['GetReady_OnsetTime'] = np.divide(df['GetReady_OnsetTime'].values, 1000)
        df['GetReady2_OnsetTime'] = np.divide(df['GetReady2_OnsetTime'].values, 1000)
    except:
        #convert onset times from miliseconds to seconds
        df['Cue_OnsetTime_sec'] = np.divide(df['CueOnsetTime'].values, 1000)
        df['Feedback_OnsetTime_sec'] = np.divide(df['FeedbackOnsetTime'].values, 1000)
        df['Target_RESP'] = df['TargetRESP']
        df['GetReady_OnsetTime'] = np.divide(df['GetReadyOnsetTime'].values, 1000)
        df['GetReady2_OnsetTime'] = np.divide(df['GetReady2OnsetTime'].values, 1000)

    #split into two runs and save two run csv files
    dfr1 = df.iloc[:58]
    dfr2 = df.iloc[58:]

    dfr1['Cue_OnsetTime_sec'] = dfr1['Cue_OnsetTime_sec'].subtract(dfr1['GetReady_OnsetTime'].values)
    dfr2['Cue_OnsetTime_sec'] = dfr2['Cue_OnsetTime_sec'].subtract(dfr2['GetReady2_OnsetTime'].values)
    dfr1['Feedback_OnsetTime_sec'] = dfr1['Feedback_OnsetTime_sec'].subtract(dfr1['GetReady_OnsetTime'].values)
    dfr2['Feedback_OnsetTime_sec'] = dfr2['Feedback_OnsetTime_sec'].subtract(dfr2['GetReady2_OnsetTime'].values)

    dfr1.to_csv(op.join(in_folder, '{0}-wave3-run1.csv'.format(subject)))
    dfr2.to_csv(op.join(in_folder,'{0}-wave3-run2.csv'.format(subject)))

    reward_cue_text = []
    punish_cue_text = []
    neutral_cue_text = []
    Rhit_text = []
    Rmiss_text = []
    Phit_text = []
    Pmiss_text = []
    Nhit_text = []
    Nmiss_text = []

    for run in runs:
        # Make lists to place all lines in

        try:
            run_df = (op.join(in_folder, '{0}-wave3-run{1}.csv'.format(subject, run)))
            df = pd.read_csv(run_df, header=0)

            # Grab reward cue trials and get cue onset time
            reward_cue_df = df.loc[df['TrialType'].isin(['Reward'])]
            reward_cue = reward_cue_df['Cue_OnsetTime_sec'].values
            if reward_cue.size == 0:
            	reward_cue = ['']
            reward_cue_text.append('\t'.join([str(num) for num in reward_cue]))

            # Grab punish cue trials and get cue onset time
            punish_cue_df = df.loc[df['TrialType'].isin(['Punish'])]
            punish_cue = punish_cue_df['Cue_OnsetTime_sec'].values
            if punish_cue.size == 0:
            	punish_cue = ['']
            punish_cue_text.append('\t'.join([str(num) for num in punish_cue]))

            # Grab neutral cue trials and get cue onset time
            neutral_cue_df = df.loc[df['TrialType'].isin(['Neutral'])]
            neutral_cue = neutral_cue_df['Cue_OnsetTime_sec'].values
            if neutral_cue.size == 0:
            	neutral_cue = ['']
            neutral_cue_text.append('\t'.join([str(num) for num in neutral_cue]))

            # Grab reward hit trials and get outcome onset time
            reward_hit_df = reward_cue_df.loc[reward_cue_df['Target_RESP'].isin([float('2.0')])]
            reward_hit = reward_hit_df['Feedback_OnsetTime_sec'].values
            if reward_hit.size == 0:
            	reward_hit = ['']
            Rhit_text.append('\t'.join([str(num) for num in reward_hit]))

            # Grab reward miss trials and get outcome onset time
            reward_miss_df = reward_cue_df.loc[reward_cue_df['Target_RESP'].isin([float('NaN')])]
            reward_miss = reward_miss_df['Feedback_OnsetTime_sec'].values
            if reward_miss.size == 0:
            	reward_miss = ['']
            Rmiss_text.append('\t'.join([str(num) for num in reward_miss]))

            # Grab punish hit trials and get outcome onset time
            punish_cue_df = df.loc[df['TrialType'].isin(['Punish'])]
            punish_hit_df = punish_cue_df.loc[punish_cue_df['Target_RESP'].isin([float('2.0')])]
            punish_hit = punish_hit_df['Feedback_OnsetTime_sec'].values
            if punish_hit.size == 0:
            	punish_hit = ['']
            Phit_text.append('\t'.join([str(num) for num in punish_hit]))

            #Grab punish miss trials and get outcome onset time
            punish_miss_df = punish_cue_df.loc[punish_cue_df['Target_RESP'].isin([float('NaN')])]
            punish_miss = punish_miss_df['Feedback_OnsetTime_sec'].values
            if punish_miss.size == 0:
            	punish_miss = ['']
            Pmiss_text.append('\t'.join([str(num) for num in punish_miss]))

            #Grab neutral cue trials and get outcome onset time
            Nhit_df = neutral_cue_df.loc[neutral_cue_df['Target_RESP'].isin([float('2.0')])]
            Nhit = Nhit_df['Feedback_OnsetTime_sec'].values
            if Nhit.size == 0:
            	Nhit = ['']
            Nhit_text.append('\t'.join([str(num) for num in Nhit]))

            #Grab neutral cue trials and get outcome onset time
            Nmiss_df = neutral_cue_df.loc[neutral_cue_df['Target_RESP'].isin([float('NaN')])]
            Nmiss = Nmiss_df['Feedback_OnsetTime_sec'].values
            if Nmiss.size == 0:
            	Nmiss = ['']
            Nmiss_text.append('\t'.join([str(num) for num in Nmiss]))

        except:
            print("could not read run csv's")

    try:
        #different line for each run
        #Merge list of single-line strings into multiline string
        reward_cue_text = '\n'.join(reward_cue_text)
        punish_cue_text = '\n'.join(punish_cue_text)
        neutral_cue_text = '\n'.join(neutral_cue_text)
        Rhit_text = '\n'.join(Rhit_text)
        Rmiss_text = '\n'.join(Rmiss_text)
        Phit_text = '\n'.join(Phit_text)
        Pmiss_text = '\n'.join(Pmiss_text)
        Nhit_text = '\n'.join(Nhit_text)
        Nmiss_text = '\n'.join(Nmiss_text)
    except:
        print("no run lines")

    try:
        #different file for each event type
        reward_cue_file = op.join(func_folder, 'reward_cue.txt')
        os.remove(reward_cue_file)
        with open(reward_cue_file, 'w') as fo:
        	fo.write(reward_cue_text)

        punish_cue_file = op.join(func_folder, 'punish_cue.txt')
        os.remove(punish_cue_file)
        with open(punish_cue_file, 'w') as fo:
        	fo.write(punish_cue_text)

        neutral_cue_file = op.join(func_folder, 'neutral_cue.txt')
        os.remove(neutral_cue_file)
        with open(neutral_cue_file, 'w') as fo:
        	fo.write(neutral_cue_text)

        Rhit_file = op.join(func_folder, 'Rhit.txt')
        os.remove(Rhit_file)
        with open(Rhit_file, 'w') as fo:
        	fo.write(Rhit_text)

        Rmiss_file = op.join(func_folder, 'Rmiss.txt')
        os.remove(Rmiss_file)
        with open(Rmiss_file, 'w') as fo:
        	fo.write(Rmiss_text)

        Phit_file = op.join(func_folder, 'Phit.txt')
        os.remove(Phit_file)
        with open(Phit_file, 'w') as fo:
        	fo.write(Phit_text)

        Pmiss_file = op.join(func_folder, 'Pmiss.txt')
        os.remove(Pmiss_file)
        with open(Pmiss_file, 'w') as fo:
        	fo.write(Pmiss_text)

        Nhit_file = op.join(func_folder, 'Nhit.txt')
        os.remove(Nhit_file)
        with open(Nhit_file, 'w') as fo:
        	fo.write(Nhit_text)

        Nmiss_file = op.join(func_folder, 'Nmiss.txt')
        os.remove(Nmiss_file)
        with open(Nmiss_file, 'w') as fo:
        	fo.write(Nmiss_text)
    except:
        print("missing subject")
#########################################################################################################
#end
#
