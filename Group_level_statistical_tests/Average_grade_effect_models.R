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


###########################################################################################################
#Centering stuff! 
data_long$grade_grandmc <- data_long$grade - mean(data_long$grade)
data_long$grade_submean <- ave(data_long$grade, data_long$subject, FUN = mean)
data_long$grade_submc <- data_long$grade - data_long$grade_submean
###############################################################################################################
###############################################################################################################
##############################################################################################################
# GRADE EFFECT Habenula 
#########################################################################################################
############################################################################################################
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade_grandmc + grade_submc + (grade_grandmc | subject) + (grade_submc | subject), data=data_long)
summary(HB_Rhit_Rmiss)
HB_Phit_Pmiss <- lmer(HB_Phit_Pmiss ~ grade_grandmc + grade_submc + (grade_grandmc | subject) + (grade_submc | subject), data=data_long)
summary(HB_Phit_Pmiss)

HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ (1 | subject), data=data_long)
summary(HB_Rhit_Rmiss)
icc(HB_Rhit_Rmiss)

HB_Phit_Pmiss <- lmer(HB_Phit_Pmiss ~ (1 | subject), data=data_long)
summary(HB_Phit_Pmiss)
icc(HB_Phit_Pmiss)

##############################################################################################################
# GRADE EFFECT Ventral Striatum
#########################################################################################################
############################################################################################################
VS_Rhit_Rmiss <- lmer(VS_Rhit_Rmiss ~ grade_grandmc + grade_submc + (grade_grandmc | subject) + (grade_submc | subject), data=data_long)
summary(VS_Rhit_Rmiss)
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade_grandmc + grade_submc + (grade_grandmc | subject) + (grade_submc | subject), data=data_long)
summary(VS_Phit_Pmiss)

VS_Rhit_Rmiss <- lmer(VS_Rhit_Rmiss ~ (1 | subject), data=data_long)
summary(VS_Rhit_Rmiss)
icc(VS_Rhit_Rmiss)

VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ (1 | subject), data=data_long)
summary(VS_Phit_Pmiss)
icc(VS_Phit_Pmiss)

##############################################################################################################
# GRADE EFFECT nonlinear models
#########################################################################################################
##########################################################################
data_long$grade_cen2 <- data_long$grade_cen^2

HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade_cen + grade_cen2 + (grade_cen | subject) + (grade_cen2 | subject), data=data_long)
summary(HB_Rhit_Rmiss)
HB_Phit_Pmiss <- lmer(HB_Phit_Pmiss ~ grade_cen + grade_cen2 + (1 + grade_cen | subject) + (grade_cen2 | subject),, data=data_long)
summary(HB_Phit_Pmiss)

VS_Rhit_Rmiss <- lmer(VS_Rhit_Rmiss ~ grade_cen + grade_cen2 + (1 + grade_cen | subject) + (grade_cen2 | subject),, data=data_long)
summary(VS_Rhit_Rmiss)
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade_cen + grade_cen2 + (1 + grade_cen | subject) + (grade_cen2 | subject),, data=data_long)
summary(VS_Phit_Pmiss)

# PLot 

# Spaghetti Plot by subject + drug use group
#######################################################################################################
##############################################################################################################

##############################################################################################################
VS_Rhit_Rmiss <- lmer(VS_Rhit_Rmiss ~ grade + (1 + grade | subject), data=data_long)
summary(VS_Rhit_Rmiss)
##############################################################################################################
## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade_grandmc, y = VS_Rhit_Rmiss, group = subject, ci=TRUE))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#2b8cbe"
) + labs(x = "GRADE", y = "VS Rhit - Rmiss") + theme_classic() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))
##############################################################################################################
##############################################################################################################
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade + (1 + grade | subject), data=data_long)
summary(HB_Phit_Pmiss)
##############################################################################################################
## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = VS_Phit_Pmiss, group = subject, ci=TRUE))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#2b8cbe"
) + labs(x = "GRADE", y = "VS Phit - Pmiss") + theme_classic() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))

##############################################################################################################
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade + (1 + grade | subject), data=data_long)
summary(HB_Rhit_Rmiss)
##############################################################################################################
## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = HB_Rhit_Rmiss, group = subject, ci=TRUE))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#2ca25f"
) + labs(x = "GRADE", y = "HB Rhit - Rmiss") + theme_classic() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))
##############################################################################################################
##############################################################################################################
HB_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade + (1 + grade | subject), data=data_long)
summary(HB_Phit_Pmiss)
##############################################################################################################
## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = HB_Phit_Pmiss, group = subject, ci=TRUE))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#2ca25f"
) + labs(x = "GRADE", y = "HB Phit - Pmiss") + theme_classic() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))



