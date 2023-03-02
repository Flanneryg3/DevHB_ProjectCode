library(ggpubr)
library(dplyr)
library(ggplot2)
library(viridis)
library(lme4)
library(lmerTest)
library(lavaan)
library(lavaanPlot)
library(nlme)

###########################################################################################################
# PPI
# task effect
# Plotting

###########################################################################################################
# Jessica S. Flannery, 2023


data <- read.csv("/path/ppi_subave.csv")
theme_set(theme_pubclean())

p <- ggbarplot(data, x = "TYPE", y = "VS_HB", size=1, 
               add = c("mean_se", 'jitter'), 
               add.params = list(size = 2, alpha = 0.5),
               color = "ACCURACY", palette = c("#006D2C", "#99000d"), 
               position = position_dodge(0.8))

p + theme(axis.title.y = element_text(size=15, colour = 'black', face='bold'), 
          axis.title.x = element_text(size=15, colour = 'black', face='bold'))


###########################################################################################################
# PPI
# Average change over GRADE multi-level models with lmer R-package 
# Plotting

###########################################################################################################
# Jessica S. Flannery, 2023

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

VS_HB_Rhit_Rmiss <- lmer(VS_HB_Rhit_Rmiss ~ grade_grandmc + grade_submc + (grade_grandmc | subject) + (grade_submc | subject), data=data_long)
summary(VS_HB_Rhit_Rmiss)
VS_HB_Phit_Pmiss <- lmer(VS_HB_Phit_Pmiss ~ grade_grandmc + grade_submc + (grade_grandmc | subject) + (grade_submc | subject), data=data_long)
summary(VS_HB_Phit_Pmiss)

VS_HB_Rhit_Rmiss <- lmer(VS_HB_Rhit_Rmiss ~ grade_cen + (grade_cen | subject), data=data_long)
summary(VS_HB_Rhit_Rmiss)
VS_HB_Phit_Pmiss <- lmer(VS_HB_Phit_Pmiss ~ grade_cen + (grade_cen | subject), data=data_long)
summary(VS_HB_Phit_Pmiss)



###########################
plotting
###########################

##############################################################################################################
VS_HB_Rhit_Rmiss <- lmer(VS_HB_Rhit_Rmiss ~ grade + (1 + grade | subject), data=data_long)
summary(VS_HB_Rhit_Rmiss)
##############################################################################################################
## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = VS_HB_Rhit_Rmiss, group = subject, ci=TRUE))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#fec44f"
) + labs(x = "GRADE", y = "VS-HB Rhit-Rmiss") + theme_classic() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))


##############################################################################################################
VS_HB_Phit_Pmiss <- lmer(VS_HB_Phit_Pmiss ~ grade + (1 + grade | subject), data=data_long)
summary(VS_HB_Phit_Pmiss)
##############################################################################################################
## define base for the graphs and store in object 'p'
p <- ggplot(data = data_long, aes(x = grade, y = VS_HB_Phit_Pmiss, group = subject, ci=TRUE))
p + geom_line() + stat_summary(aes(group = 1), geom = "line", fun = mean,  linewidth= 2, colour="#fec44f"
) + labs(x = "GRADE", y = "VS-HB Phit-Pmiss") + theme_classic() + theme(
  axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
    axis.title.x = element_text(size=15, colour = 'black', face='bold')) + theme(
      axis.text = element_text(size = 12, colour='black'))

###########################################################################################################
###########################################################################################################
# PPI
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

##############################################################################################################
#  GRADE x DRUG PPI VS - HB
#########################################################################################################
############################################################################################################
VS_HB_Rhit <- lmer(VS_HB_Rhit ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(VS_HB_Rhit)

VS_HB_Phit_Pmiss <- lmer(VS_HB_Phit_Pmiss ~ grade_cen * ever_drug_w5 + (1 + grade_cen | subject), data=data_long)
summary(VS_HB_Phit_Pmiss)

