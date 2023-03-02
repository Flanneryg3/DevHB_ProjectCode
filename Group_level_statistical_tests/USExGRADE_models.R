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
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(HB_Rhit_Rmiss)
HB_Phit_Pmiss <- lmer(HB_Phit_Pmiss ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(HB_Phit_Pmiss)
##############################################################################################################
##############################################################################################################

##############################################################################################################
#  GRADE x DRUG Ventral striatum
####################################################################################################
##############################################################################################################
VS_Rhit_Rmiss <- lmer(VS_Rhit_Rmiss ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(VS_Rhit_Rmiss)
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(VS_Phit_Pmiss)
################################################################################################

################################################################################################
##############################################################################################################
################################################################################################
#follow-up tests within group for significant interactions
##############################################################################################################
################################################################################################

#None
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade_cen + (grade_cen | subject), data=data_none)
summary(HB_Rhit_Rmiss)

#Some
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade_cen + (grade_cen | subject), data=data_some)
summary(HB_Rhit_Rmiss)

#Regularly
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(HB_Rhit_Rmiss)

##############################################################################################################
##############################################################################################################
#None
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade_cen + (grade_cen | subject), data=data_none)
summary(VS_Phit_Pmiss)

#Some
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade_cen + (grade_cen | subject), data=data_some)
summary(VS_Phit_Pmiss)

#Regularly
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade_cen + (grade_cen | subject), data=data_regular)
summary(VS_Phit_Pmiss)

##############################################################################################################
##############################################################################################################
##############################################################################################################


# PLot 
#######################################################################################################
##############################################################################################################
##############################################################################################################
##############################################################################################################
# HB RHIT RMISS
##############################################################################################################
##############################################################################################################
HB_Rhit_Rmiss <- lmer(HB_Rhit_Rmiss ~ grade * ever_drug_group + (1 + grade | subject), data=data_long)
summary(HB_Rhit_Rmiss)
##############################################################################################################

HB_Rhit_Rmiss_plot <- interact_plot(HB_Rhit_Rmiss, pred=grade, modx=ever_drug_group, modxvals = c("None", "Some", "Regularly") , plot.points=FALSE,
                                    x.label="GRADE", y.label="HB Rhit - Rmiss", 
                                    legend.main="DRUG USE", interval=TRUE, 
                                    thickness.line = 1, vary.lty=FALSE, colors = c("#018571", "gray", "#980043"))

HB_Rhit_Rmiss_plot + theme_classic() + theme(
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
# VS Pmiss Phit
##############################################################################################################
##############################################################################################################
VS_Phit_Pmiss <- lmer(VS_Phit_Pmiss ~ grade * ever_drug_group + (1 + grade | subject), data=data_long)
summary(VS_Phit_Pmiss)
##############################################################################################################

VS_Phit_Pmiss_plot <- interact_plot(VS_Phit_Pmiss, pred=grade, modx=ever_drug_group, modxvals = c("None", "Some", "Regularly") , plot.points=FALSE,
                                    x.label="GRADE", y.label="VS Phit - Pmiss", 
                                    legend.main="DRUG USE", interval=TRUE, 
                                    thickness.line = 1, vary.lty=FALSE, colors = c("#018571", "gray", "#980043"))

VS_Phit_Pmiss_plot + theme_classic() + theme(
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
#HB RHIT RMISS
##############################################################################################################
##############################################################################################################

## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = HB_Rhit_Rmiss, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#018571"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "HB Rhit - Rmiss") + theme_gray() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))

p <- ggplot(data = data_long, aes(x = grade, y = HB_Rhit_Rmiss, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, linewidth = 2, colour="darkgray"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "HB Rhit - Rmiss") + theme_gray() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))

p <- ggplot(data = data_long, aes(x = grade, y = HB_Rhit_Rmiss, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, linewidth = 2, colour="#980043"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "HB Rhit - Rmiss") + theme_gray() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))


#######################################################################################################
# Spaghetti Plot by subject + drug use group
#######################################################################################################
##############################################################################################################
#VS PHIT PMISS
##############################################################################################################
##############################################################################################################

## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = VS_Phit_Pmiss, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#018571"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "VS Phit - Pmiss") + theme_gray() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))

p <- ggplot(data = data_long, aes(x = grade, y = VS_Phit_Pmiss, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, linewidth = 2, colour="darkgray"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "VS Phit - Pmiss") + theme_gray() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))

p <- ggplot(data = data_long, aes(x = grade, y = VS_Phit_Pmiss, group = subject))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean, linewidth = 2, colour="#980043"
) + facet_grid(. ~ ever_drug_group) + labs(x = "GRADE", y = "VS Phit - Pmiss") + theme_gray() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))


#############################################################################################################
#############################################################################################################
###########
