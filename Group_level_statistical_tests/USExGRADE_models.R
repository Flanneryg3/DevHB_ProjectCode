###########################################################################################################
###########################################################################################################
# USE x GRADE interaction multi-level models with lmer R-package 
# Follow-up within group tests
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
data_none <- read.csv("/path_to_data/none.csv")
data_some <- read.csv("/path_to_data/some.csv")
data_regular <- read.csv("/path_to_data/regular.csv")
###########################################################################################################
#data prep
data_long$ever_drug_w5 <- as.numeric(data_long$ever_drug_w5)
data_long$ever_drug_group <- as.factor(data_long$ever_drug_group)
data_none$ever_drug_w5 <- as.numeric(data_none$ever_drug_w5)
data_some$ever_drug_w5 <- as.numeric(data_some$ever_drug_w5)
data_regular$ever_drug_w5 <- as.numeric(data_regular$ever_drug_w5)


###############################################################################################################
###############################################################################################################
##############################################################################################################
#  GRADE x DRUG Habenula 
#########################################################################################################
############################################################################################################
Rhit_Nhit_Lhb <- lmer(Rhit_Nhit_Lhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rhit_Nhit_Lhb)
Rcue_Ncue_Lhb <- lmer(Rcue_Ncue_Lhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rcue_Ncue_Lhb)
Pcue_Ncue_Lhb <- lmer(Pcue_Ncue_Lhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pcue_Ncue_Lhb)
Pmiss_Nmiss_Lhb <- lmer(Pmiss_Nmiss_Lhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pmiss_Nmiss_Lhb)
##############################################################################################################
##############################################################################################################
Rhit_Nhit_Rhb <- lmer(Rhit_Nhit_Rhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rhit_Nhit_Rhb)
Rcue_Ncue_Rhb <- lmer(Rcue_Ncue_Rhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rcue_Ncue_Rhb)
Pcue_Ncue_Rhb <- lmer(Pcue_Ncue_Rhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pcue_Ncue_Rhb)
Pmiss_Nmiss_Rhb <- lmer(Pmiss_Nmiss_Rhb ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pmiss_Nmiss_Rhb)
##############################################################################################################
####################################################################################################
##############################################################################################################
#  GRADE x DRUG Ventral striatum
####################################################################################################
##############################################################################################################
Rhit_RVS <- lmer(Rhit_RVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rhit_RVS)
Rcue_RVS <- lmer(Rcue_RVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rcue_RVS)
Pcue_RVS <- lmer(Pcue_RVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pcue_RVS)
Pmiss_RVS <- lmer(Pmiss_RVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pmiss_RVS)
################################################################################################
##############################################################################################################
Rhit_LVS <- lmer(Rhit_LVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rhit_LVS)
Rcue_LVS <- lmer(Rcue_LVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Rcue_LVS)
Pcue_LVS <- lmer(Pcue_LVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pcue_LVS)
Pmiss_LVS <- lmer(Pmiss_LVS ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(Pmiss_LVS)
################################################################################################
##############################################################################################################
################################################################################################
#follow-up tests within group for significant interactions
##############################################################################################################
################################################################################################

#None
Pmiss_Nmiss_Rhb <- lmer(Pmiss_Nmiss_Rhb ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Pmiss_Nmiss_Rhb)

#Some
Pmiss_Nmiss_Rhb <- lmer(Pmiss_Nmiss_Rhb ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Pmiss_Nmiss_Rhb)

#Regularly
Pmiss_Nmiss_Rhb <- lmer(Pmiss_Nmiss_Rhb ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Pmiss_Nmiss_Rhb)

##############################################################################################################
##############################################################################################################
#None
Rhit_Nhit_Rhb <- lmer(Rhit_Nhit_Rhb ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Rhit_Nhit_Rhb)

#Some
Rhit_Nhit_Rhb <- lmer(Rhit_Nhit_Rhb ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Rhit_Nhit_Rhb)

#Regularly
Rhit_Nhit_Rhb <- lmer(Rhit_Nhit_Rhb ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Rhit_Nhit_Rhb)

##############################################################################################################
##############################################################################################################
#none
Pcue_RVS <- lmer(Pcue_RVS ~ grade_cen + (grade_cen | subject), data=data_none)
summary(Pcue_RVS)

#some
Pcue_RVS <- lmer(Pcue_RVS ~ grade_cen + (grade_cen | subject), data=data_some)
summary(Pcue_RVS)

#regularly
Pcue_RVS <- lmer(Pcue_RVS ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(Pcue_RVS)
##############################################################################################################
##############################################################################################################


# PLot 
#######################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
# PUNISHMENT OUTCOME
##############################################################################################################
##############################################################################################################
Pmiss_Nmiss_Rhb <- lmer(Pmiss_Nmiss_Rhb ~ grade * ever_drug_group + (1 + grade | subject), data=data_long)
summary(Pmiss_Nmiss_Rhb)
##############################################################################################################

Pmiss_Nmiss_Rhb_plot <- interact_plot(Pmiss_Nmiss_Rhb, pred=grade, modx=ever_drug_group, modxvals = c("None", "Some", "Regularly") , plot.points=FALSE,
                                      x.label="GRADE", y.label="R.HB PUNI", 
                                      legend.main="DRUG USE", interval=TRUE, 
                                      thickness.line = 1, vary.lty=FALSE, colors = c("#018571", "gray", "#980043"))

Pmiss_Nmiss_Rhb_plot + theme_classic() + theme(
  axis.line = element_line(size = 1, colour = "black")) + theme(
    axis.ticks = element_line(size = 1, colour = "black")) + theme(
      axis.ticks.length = unit(0.15, "cm")) + theme(
        legend.text = element_text(size=12, colour = 'black')) + theme(
          legend.title = element_text(size=15, colour = 'black', face='bold')) + theme(
            axis.text = element_text(size = 12, colour='black')) + theme(
              axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
                axis.title.x = element_text(size=15, colour = 'black', face='bold'))


# PLot 
#######################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
# REWARD OUTCOME
##############################################################################################################
##############################################################################################################
##############################################################################################################
Rhit_Nhit_Rhb <- lmer(Rhit_Nhit_Rhb ~ grade * ever_drug_group + (1 + grade | subject), data=data_long)
summary(Rhit_Nhit_Rhb)
##############################################################################################################

Rhit_Nhit_Rhb_plot <- interact_plot(Rhit_Nhit_Rhb, pred=grade, modx=ever_drug_group, modxvals = c("None", "Some", "Regularly") , plot.points=FALSE,
                                    x.label="GRADE", y.label="R.HB rew", 
                                    legend.main="DRUG USE", interval=TRUE, 
                                    thickness.line = 1, vary.lty=FALSE, colors = c("#018571", "gray", "#980043"))

Rhit_Nhit_Rhb_plot + theme_classic() + theme(
  axis.line = element_line(size = 1, colour = "black")) + theme(
    axis.ticks = element_line(size = 1, colour = "black")) + theme(
      axis.ticks.length = unit(0.15, "cm")) + theme(
        legend.text = element_text(size=12, colour = 'black')) + theme(
          legend.title = element_text(size=15, colour = 'black', face='bold')) + theme(
            axis.text = element_text(size = 12, colour='black')) + theme(
              axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
                axis.title.x = element_text(size=15, colour = 'black', face='bold'))

# PLot 
#######################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
# Punishment Cue
##############################################################################################################
##############################################################################################################
##############################################################################################################
#######################################################################################################
##############################################################################################################
##############################################################################################################

Pcue_RVS <- lmer(Pcue_RVS ~ grade * ever_drug_group + (1 + grade | subject), data=data_long)
summary(Pcue_RVS)
##############################################################################################################

Pcue_RVS_plot <- interact_plot(Pcue_RVS, pred=grade_cen, modx=ever_drug_group, modxvals = c("None", "Some", "Regularly") , plot.points=FALSE,
                               x.label="GRADE", y.label="R.VS pcue", 
                               legend.main="DRUG USE", interval=TRUE, 
                               thickness.line = 1, vary.lty=FALSE, colors = c("#018571", "gray", "#980043"))

Pcue_RVS_plot + theme_classic() + theme(
  axis.line = element_line(size = 1, colour = "black")) + theme(
    axis.ticks = element_line(size = 1, colour = "black")) + theme(
      axis.ticks.length = unit(0.15, "cm")) + theme(
        legend.text = element_text(size=12, colour = 'black')) + theme(
          legend.title = element_text(size=15, colour = 'black', face='bold')) + theme(
            axis.text = element_text(size = 12, colour='black')) + theme(
              axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
                axis.title.x = element_text(size=15, colour = 'black', face='bold'))



# Spaghetti Plot by subject + drug use group
#######################################################################################################
##############################################################################################################
#R.HB PUNISHMENT
##############################################################################################################
##############################################################################################################

## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = Pmiss_Nmiss_Rhb, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, size = 2, colour="#018571"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "R.HB PUNISHMENT")

p <- ggplot(data = data_long, aes(x = grade, y = Pmiss_Nmiss_Rhb, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, size = 2, colour="darkgray"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "R.HB PUNISHMENT")

p <- ggplot(data = data_long, aes(x = grade, y = Pmiss_Nmiss_Rhb, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, size = 2, colour="#980043"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "R.HB PUNISHMENT")

# Spaghetti Plot by subject + drug use group
#######################################################################################################
##############################################################################################################
#R.HB REWARD
##############################################################################################################
##############################################################################################################

p <- ggplot(data = data_long, aes(x = grade, y = Rhit_Nhit_Rhb, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,
                               size = 2, colour="#980043"
                               ) + facet_grid(. ~ ever_drug_group
                                              ) + labs(x = "GRADE", y = "R.HB REWARD")

p <- ggplot(data = data_long, aes(x = grade, y = Rhit_Nhit_Rhb, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,
                               size = 2, colour="darkgray"
                               ) + facet_grid(. ~ ever_drug_group
                                              ) + labs(x = "GRADE", y = "R.HB REWARD")

p <- ggplot(data = data_long, aes(x = grade, y = Rhit_Nhit_Rhb, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,
                               size = 2, colour="#018571"
                               ) + facet_grid(. ~ ever_drug_group
                                              ) + labs(x = "GRADE", y = "R.HB REWARD")

# Spaghetti Plot by subject + drug use group
#######################################################################################################
##############################################################################################################
#R.HB REWARD
##############################################################################################################
##############################################################################################################

p <- ggplot(data = data_long, aes(x = grade, y = Pcue_RVS, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,
                               size = 2, colour="#980043"
                               ) + facet_grid(. ~ ever_drug_group
                                              ) + labs(x = "GRADE", y = "R.VS PUNISH CUE")

p <- ggplot(data = data_long, aes(x = grade, y = Pcue_RVS, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,
                               size = 2, colour="darkgray"
                               ) + facet_grid(. ~ ever_drug_group
                                              ) + labs(x = "GRADE", y = "R.VS PUNISH CUE")

p <- ggplot(data = data_long, aes(x = grade, y = Pcue_RVS, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,
                               size = 2, colour="#018571"
                               ) + facet_grid(. ~ ever_drug_group
                                              ) + labs(x = "GRADE", y = "R.VS PUNISH CUE")

#############################################################################################################
#############################################################################################################
###########
