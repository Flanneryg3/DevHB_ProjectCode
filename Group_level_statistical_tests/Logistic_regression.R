###########################################################################################################
###########################################################################################################
# Logistic Regression Anaylsis to assess first-timepoint (6th-7th grade) brain activity 
#effect on drug use in later adolescence (8th-11th grade)
# Plus plotting
#adapted from:
# https://stats.oarc.ucla.edu/r/dae/logit-regression/

###########################################################################################################
# Jessica S. Flannery, 2022

###########################################################################################################
###########################################################################################################
# package imports
###########################################################################################################
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

###########################################################################################################
# data import
data <- read.csv("/path_to_data/LR_data.csv")

###########################################################################################################
#data prep
data$grade_time1 <- factor(data$grade_time1)
data$grade_time1
data$later_bi

###########################################################################################################
###########################################################################################################
# Logistic Regression Anaylsis to assess first-timepoint (6th-7th grade) brain activity 
#effect on drug use in later adolescence (8th-11th grade)
###########################################################################################################
#R.HB
###########################################################################################################
mylogit <- glm(later_bi ~ RHB_Rhit_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ RHB_Rcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ RHB_Pcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ RHB_Pmiss_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)
###########################################################################################################
#L.HB
###########################################################################################################
mylogit <- glm(later_bi ~ LHB_Rhit_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ LHB_Rcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ LHB_Pcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ LHB_Pmiss_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)
###########################################################################################################
#R. VS
###########################################################################################################
mylogit <- glm(later_bi ~ RVS_Pcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ RVS_Pmiss_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ RVS_Rhit_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ RVS_Rcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

###########################################################################################################
#L. VS
###########################################################################################################
mylogit <- glm(later_bi ~ LVS_Pcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ LVS_Pmiss_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ LVS_Rcue_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

mylogit <- glm(later_bi ~ LVS_Rhit_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

#####################################################################################################
#####################################################################################################
# plotting
#####################################################################################################
#####################################################################################################

mylogit <- glm(later_bi ~ RHB_Pmiss_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)


## get odds ratios
exp(coef(mylogit))

#calculate change in probability per one unit chnage in brain activity
a <- plogis(1)
b <- plogis(1.299)
change_in_probability <- b -a

# get predicted probabilities for plotting
newdata1 <- with(data, data.frame(RHB_Pmiss_time1, first_drug = 0, grade_time1 = factor(6)))
## view data frame
newdata1

newdata1$P <- predict(mylogit, newdata = newdata1, type = "response")
newdata2 <- with(data, data.frame(RHB_Pmiss_time1 = rep(seq(from = -8, to = 8, length.out = 100),
                                                        4), first_drug = 0, grade_time1 = factor(6)))

newdata3 <- cbind(newdata2, predict(mylogit, newdata = newdata2, type = "link",
                                    se = TRUE))
newdata3 <- within(newdata3, {
  PredictedProb <- plogis(fit)
  LL <- plogis(fit - (1.96 * se.fit))
  UL <- plogis(fit + (1.96 * se.fit))
})

## view first few rows of final dataset
head(newdata3)
install.packages("scales")
library(scales)

p<- ggplot(newdata3,  aes(x = RHB_Pmiss_time1, y = PredictedProb)
) + geom_ribbon(aes(ymin = LL, ymax = UL), alpha = 0.2) + geom_line(size = 1)
#p + scale_y_continuous(name="Probability of Drug Uue", breaks=2)
p + theme_classic() + theme(
  axis.line = element_line(size = 1, colour = "black")) + theme(
    axis.ticks = element_line(size = 1, colour = "black")) + theme(
      axis.ticks.length = unit(0.15, "cm")) + theme(
        legend.text = element_text(size=12, colour = 'black')) + theme(
          legend.title = element_text(size=15, colour = 'black', face='bold')) + theme(
            axis.text = element_text(size = 12, colour='black')) + theme(
              axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
                axis.title.x = element_text(size=15, colour = 'black', face='bold')
              ) + labs(x = "R. HB PUN", y = "Probability of Drug Uue"
              ) + scale_x_continuous(breaks = round(seq(min(-8), max(8), by = 4)))


#####################################################################################################
#####################################################################################################
# plotting
#####################################################################################################
#####################################################################################################

mylogit <- glm(later_bi ~ LVS_Rhit_time1 + grade_time1 + first_drug, data = data, family = "binomial")
summary(mylogit)

## get odds ratios
exp(coef(mylogit))

#calculate change in probability per one unit chnage in brain activity
a <- plogis(1)
b <- plogis(1.299)
change_in_probability <- b -a

newdata1 <- with(data, data.frame(LVS_Rhit_time1, first_drug = 0, grade_time1 = factor(6)))
## view data frame
newdata1

newdata1$P <- predict(mylogit, newdata = newdata1, type = "response")
newdata1
newdata2 <- with(data, data.frame(LVS_Rhit_time1 = rep(seq(from = -6, to = 6, length.out = 100),
                                                       4), first_drug = 0, grade_time1 = factor(6)))

newdata3 <- cbind(newdata2, predict(mylogit, newdata = newdata2, type = "link",
                                    se = TRUE))
newdata3 <- within(newdata3, {
  PredictedProb <- plogis(fit)
  LL <- plogis(fit - (1.96 * se.fit))
  UL <- plogis(fit + (1.96 * se.fit))
})

## view first few rows of final dataset
head(newdata3)

p<- ggplot(newdata3,  aes(x = LVS_Rhit_time1, y = PredictedProb)
) + geom_ribbon(aes(ymin = LL, ymax = UL), alpha = 0.2) + geom_line(size = 1, linetype = "dashed")
p + scale_y_continuous(name="Probability of Drug Uue", limits=c(0, 2))
p + theme_classic() + theme(
  axis.line = element_line(size = 1, colour = "black")) + theme(
    axis.ticks = element_line(size = 1, colour = "black")) + theme(
      axis.ticks.length = unit(0.15, "cm")) + theme(
        legend.text = element_text(size=12, colour = 'black')) + theme(
          legend.title = element_text(size=15, colour = 'black', face='bold')) + theme(
            axis.text = element_text(size = 12, colour='black')) + theme(
              axis.title.y = element_text(size=15, colour = 'black', face='bold')) + theme(
                axis.title.x = element_text(size=15, colour = 'black', face='bold')
              ) + labs(x = "L. VS reward", y = "Probability of Drug Uue"
              ) + scale_x_continuous(breaks = round(seq(min(-6), max(6), by = 2)))





