###########################################################################################################
###########################################################################################################
# Average change over GRADE multi-level models with lmer R-package 
# Plotting

###########################################################################################################
# Jessica S. Flannery, 2022

###########################################################################################################
###########################################################################################################
# package imports
###########################################################################################################
library(dplyr)
library(ggplot2)
library(viridis)
library(lme4)
library(lmerTest)
library(lavaan)
library(lavaanPlot)
library(nlme)
library(interactions)
library(data.table)
library(rmcorr)
library(misty)
library(aod)

###########################################################################################################
# data import
data_long <- read.csv("/path_to_data/final_data.csv")


##############################################################################################################
Pmiss_Nmiss_Rhb <- lmer(Pmiss_Nmiss_Rhb ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Pmiss_Nmiss_Rhb)
##############################################################################################################
Rhit_Nhit_Rhb <- lmer(Rhit_Nhit_Rhb ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Rhit_Nhit_Rhb)
##############################################################################################################
Rcue_Ncue_Rhb <- lmer(Rcue_Ncue_Rhb ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Rcue_Ncue_Rhb)
##############################################################################################################
Pcue_Ncue_Rhb <- lmer(Pcue_Ncue_Rhb ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Pcue_Ncue_Rhb)
##############################################################################################################
Pmiss_Nmiss_Lhb <- lmer(Pmiss_Nmiss_Lhb ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Pmiss_Nmiss_Lhb)
##############################################################################################################
Rhit_Nhit_Lhb <- lmer(Rhit_Nhit_Lhb ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Rhit_Nhit_Lhb)
##############################################################################################################
Rcue_Ncue_Lhb <- lmer(Rcue_Ncue_Lhb ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Rcue_Ncue_Lhb)
##############################################################################################################
Pcue_Ncue_Lhb <- lmer(Pcue_Ncue_Lhb ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Pcue_Ncue_Lhb)
##############################################################################################################
Pcue_RVS <- lmer(Pcue_RVS ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Pcue_RVS)
##############################################################################################################
Rcue_RVS <- lmer(Rcue_RVS ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Rcue_RVS)
##############################################################################################################
Pmiss_RVS <- lmer(Pmiss_RVS ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Pmiss_RVS)
##############################################################################################################
Rhit_RVS <- lmer(Rhit_RVS ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Rhit_RVS)
##############################################################################################################
Pcue_LVS <- lmer(Pcue_LVS ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Pcue_LVS)
##############################################################################################################
Rcue_LVS <- lmer(Rcue_LVS ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Rcue_LVS)
##############################################################################################################
Pmiss_LVS <- lmer(Pmiss_LVS ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Pmiss_LVS)
##############################################################################################################
Rhit_LVS <- lmer(Rhit_LVS ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Rhit_LVS)

