load(url("http://www.openintro.org/stat/data/evals.RData"))

################################################################################
## The data
################################################################################

## Question 1: Question 1 [TRUE / FALSE] These data come from an experiment.
# TRUE
# -> FALSE

## Question 2: The original research question posed in the paper is whether
## beauty leads directly to the differences in course evaluations. Given the
## study design, should the question be rephrased? If so, how?
# (a) No, the question is worded accurately.
# -> (b) Yes, revise wording to ”Is there an association between beauty and course evaluations?”
# (c) Yes, revise wording to ”Does beauty score increase the professor’s course evaluations?”
# (d) Yes, revise wording to ”Does beauty score decrease the professor’s course evaluations?”

## Question 3: Which of the following statements is false about the distribution
## of score?
summary(evals$score)
# (a) The median of the distribution is 4.3.
# (b) 25% of the students gave their professors a score of over 4.6.
sum(evals$score < 3)
# (c) 11 of students gave a professor a score below 3.
hist(evals$score)
# -> (d) The left skewness of the data suggests that the students are less likely to rate the professors highly.

## Exercise: Excluding score, select two other variables and describe their
## relationship using an appropriate visualization (scatterplot, side-by-side
## boxplots, or mosaic plot).
summary(evals)
plot(evals$age ~ evals$bty_avg)

################################################################################
## Simple linear regression
################################################################################

# Pb with this graph: many results overlap
plot(evals$score ~ evals$bty_avg)

## Exercise: Replot the scatterplot, but this time use the function jitter() on
## the y- or the xcoordinate. (Use ?jitter to learn more.) What was misleading
## about the initial scatterplot?
plot(jitter(evals$score) ~ jitter(evals$bty_avg))
# The initial plot had many results that overlapped

## Exercise Let’s see if the apparent trend in the plot is something more than
## natural variation. Fit a linear model called m bty to predict average
## professor score by average beauty rating and add the line to your plot using
## abline(m bty). Write out the equation for the linear model and interpret the
## slope.
m_bty <- lm(evals$score ~ evals$bty_avg)
plot(jitter(evals$score) ~ jitter(evals$bty_avg))
abline(m_bty)
summary(m_bty)
# The formula of the model is: y = 3.88 + 0.067 * x
# The level of correlation between score and bty_avg is relatively low based on
# a slope close to horizontal

## Question 4: Average beauty score seems to be a statistically and practically
## significant predictor.
# TRUE
# -> FALSE

## Question 5: Use residual plots to evaluate whether the conditions of least
## squares regression are reasonable. Which of the following statements is an
## incorrect analysis of the residual plots and conditions
plot(m_bty$residuals ~ evals$bty_avg)
abline(h = 0)
# (a) Linear association: The residuals plot shows a random scatter.
plot(abs(m_bty$residuals) ~ m_bty$fitted)
# (b) Constant variance of residuals: No fan shape in residuals plot.
hist(m_bty$residuals, n=20)
qqnorm(m_bty$residuals)
qqline(m_bty$residuals)
# -> (c) Nearly normal residuals: Residuals are right skewed, but the sample size is large, so this
# may not be an important violation of conditions.
# (d) Independent observations: Classes sampled randomly, no order effect

################################################################################
## Multiple linear regression
################################################################################

plot(evals$bty_avg ~ evals$bty_f1lower)
cor(evals$bty_avg, evals$bty_f1lower)
plot(evals[,13:19])

m_bty_gen <- lm(score ~ bty_avg + gender, data = evals)
summary(m_bty_gen)

## Question 6: P-values and parameter estimates should only be trusted if the
## conditions for the regression are reasonable. Using diagnostic plots, we can
## conclude that the conditions for this model are reasonable.
# -> TRUE
# WRONG -> FALSE  # Independence of observations can not be proved with a plot here

## Exercise: Is bty_avg still a significant predictor of score? Has the addition
## of gender to the model changed the parameter estimate for bty avg?
# Yes, it is still a good predictor of score, 

multiLines(m_bty_gen)
## Exercise: What is the equation of the line corresponding to males? (Hint: For
## males, the parameter estimate is multiplied by 1.)
summary(m_bty_gen)
# score = 3.75 + 0.074 * bty_avg + 0.17

## Question 7: For two professors (one male and one female) who received the
## same beauty rating, the male professor is predicted to have the higher course
## evaluation score than the female.
# -> TRUE
# FALSE

## Exercise: Create a new model called m_bty_rank with gender removed and rank
## added in. How does R appear to handle categorical variables that have more
## than two levels? Note that the rank variable has three levels: teaching,
## tenure track, tenured
m_bty_rank <- lm(score ~ bty_avg + rank, data = evals)
summary(m_bty_rank)
# There is still a reference level kept and the others appear as different
# coefficients.

## Question 8: Which of the following is the correct order of the three levels
## of rank if we were to order them from lowest predicted course evaluation
## score to highest predicted course evaluation score?
# (a) Teaching, Tenure Track, Tenured
# (b) Tenure track, Tenured
# -> (c) Tenure Track, Tenured, Teaching
# (d) Teaching, Tenured, Tenure Track

################################################################################
## The search for the best model
################################################################################

## We will start with a full model that predicts professor score based on rank,
## ethnicity, gender, language of the university where they got their degree,
## age, proportion of students that filled out evaluations, class size, course
## level, number of professors, number of credits, average beauty rating,
## outfit, and picture color.
## Exercise: Which variable would you expect to have the highest p-value in this
## model? Why?
## Hint: Think about which variable would you expect to not have any association
## with the professor score.
# language of the university where they got their degree appears to be the
# variable with less connection with profesor score
m_full <- lm(score ~ rank + ethnicity + gender + language + age +
                 cls_perc_eval + cls_students + cls_level + cls_profs +
                 cls_credits + bty_avg, data = evals)
summary(m_full)

## Exercise Check your suspicions from the previous exercise. Include the model
## output in your response.
# My suspicious were wrong, cls_profssingle appears to be the variable with the
# lowest p-score.

## Question 9: Which of the following is the correct intrepetation of the
## coefficient associated with the ethnicity variable. Non-minority professors
## are expected on average to score ...
# (a) 0.19 points lower than minority professors, all else held constant.
# -> (b) 0.19 points higher than minority professors, all else held constant.
# (c) 0.02 points lower than minority professors, all else held constant.
# (d) 0.02 points higher than minority professors, all else held constant.

## Exercise: Drop the variable with the highest p-value and re-fit the model.
## Did the coefficients and significance of the other explanatory variables
## change? (One of the things that makes multiple regression interesting is that
## coefficient estimates depend on the other variables that are included in the
## model.) If not, what does this say about whether or not the dropped variable
## was collinear with the other explanatory variables?
m_full_2 <- lm(score ~ rank + ethnicity + gender + language + age +
                 cls_perc_eval + cls_students + cls_level +
                 cls_credits + bty_avg, data = evals)
summary(m_full_2)$coefficients
summary(m_full)$coefficients
# They almost did not change, which tends to indicate that the variable was
# indeed collinear

summary(m_full)$adj.r.squared
m1 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval +
             cls_students + cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m1)$adj.r.squared

m2 <- lm(score ~ rank + gender + language + age + cls_perc_eval +
             cls_students + cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m2)$adj.r.squared

## Exercise: Repeat this process until you have tried removing each variable
## from the full model at a time, and determine removal of which variable yields
## the highest improvement in the adjusted R2.
m3 <- lm(score ~ rank + ethnicity + language + age + cls_perc_eval +
             cls_students + cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m3)$adj.r.squared
m4 <- lm(score ~ rank + ethnicity + gender + age + cls_perc_eval +
             cls_students + cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m4)$adj.r.squared
m5 <- lm(score ~ rank +  ethnicity + gender + language + cls_perc_eval +
             cls_students + cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m5)$adj.r.squared
m6 <- lm(score ~ rank +  ethnicity + gender + language + age +
             cls_students + cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m6)$adj.r.squared
m7 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
             cls_level + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m7)$adj.r.squared
m8 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
             cls_students + cls_profs + cls_credits + bty_avg,
         data = evals)
summary(m8)$adj.r.squared
m9 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
             cls_students + cls_level + cls_credits + bty_avg,
         data = evals)
summary(m9)$adj.r.squared
m10 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
             cls_students + cls_level + cls_profs +  bty_avg,
         data = evals)
summary(m10)$adj.r.squared
m11 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
             cls_students + cls_level + cls_profs + cls_credits,
         data = evals)
summary(m11)$adj.r.squared
# m9 or cls_prof appears to be the variable with the higher increase in total R2

## Question 10: Elimination of which variable from the full model yielded the
## highest adjusted R-squared?
# (a) bty_avg
# -> (b) cls_profs
# (c) cls_students
# (d) rank

m12 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval +
             cls_students + cls_level + cls_credits + bty_avg,
         data = evals)
summary(m12)$adj.r.squared
m13 <- lm(score ~ rank + gender + language + age + cls_perc_eval +
              cls_students + cls_level + cls_credits + bty_avg,
          data = evals)
summary(m13)$adj.r.squared
m14 <- lm(score ~ rank +  ethnicity + language + age + cls_perc_eval +
              cls_students + cls_level + cls_credits + bty_avg,
          data = evals)
summary(m14)$adj.r.squared
m15 <- lm(score ~ rank +  ethnicity + gender + age + cls_perc_eval +
              cls_students + cls_level + cls_credits + bty_avg,
          data = evals)
summary(m15)$adj.r.squared
m16 <- lm(score ~ rank +  ethnicity + gender + language + cls_perc_eval +
              cls_students + cls_level + cls_credits + bty_avg,
          data = evals)
summary(m16)$adj.r.squared
m17 <- lm(score ~ rank +  ethnicity + gender + language + age +
              cls_students + cls_level + cls_credits + bty_avg,
          data = evals)
summary(m17)$adj.r.squared
m18 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_level + cls_credits + bty_avg,
          data = evals)
summary(m18)$adj.r.squared
m19 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m19)$adj.r.squared
m20 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_students + cls_level + bty_avg,
          data = evals)
summary(m20)$adj.r.squared
m21 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_students + cls_level + cls_credits,
          data = evals)
summary(m21)$adj.r.squared
# m19 increases the R2 values

m22 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m22)$adj.r.squared
m23 <- lm(score ~ rank +  gender + language + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m23)$adj.r.squared
m24 <- lm(score ~ rank +  ethnicity + language + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m24)$adj.r.squared
m25 <- lm(score ~ rank +  ethnicity + gender + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m25)$adj.r.squared
m26 <- lm(score ~ rank +  ethnicity + gender + language + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m26)$adj.r.squared
m27 <- lm(score ~ rank +  ethnicity + gender + language + age +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m27)$adj.r.squared
m28 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_credits + bty_avg,
          data = evals)
summary(m28)$adj.r.squared
m29 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_students + bty_avg,
          data = evals)
summary(m29)$adj.r.squared
m30 <- lm(score ~ rank +  ethnicity + gender + language + age + cls_perc_eval +
              cls_students + cls_credits,
          data = evals)
summary(m30)$adj.r.squared
# m22 increases the R2 value

m31 <- lm(score ~ gender + language + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m31)$adj.r.squared
m32 <- lm(score ~ ethnicity + language + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m32)$adj.r.squared
m33 <- lm(score ~ ethnicity + gender + age + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m33)$adj.r.squared
m34 <- lm(score ~ ethnicity + gender + language + cls_perc_eval +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m34)$adj.r.squared
m35 <- lm(score ~ ethnicity + gender + language + age +
              cls_students + cls_credits + bty_avg,
          data = evals)
summary(m35)$adj.r.squared
m36 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval +
              cls_credits + bty_avg,
          data = evals)
summary(m36)$adj.r.squared
m37 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval +
              cls_students + bty_avg,
          data = evals)
summary(m37)$adj.r.squared
m38 <- lm(score ~ ethnicity + gender + language + age + cls_perc_eval +
              cls_students + cls_credits,
          data = evals)
summary(m38)$adj.r.squared
# None of the options increase R2, and thus we keep m22 as the best model.

## Exercise The original paper describes how these data were gathered by taking
## a sample of professors from the University of Texas at Austin and including
## all courses that they have taught. Considering that each row represents a
## course, could this new information have an impact on any of the conditions of
## linear regression?

## Exercise Based on your final model, describe the characteristics of a
## professor and course at University of Texas at Austin that would be
## associated with a high evaluation score.
# score ~ ethnicity + gender + language + age + cls_perc_eval + cls_students +
#         cls_credits + bty_avg
summary(m22)
# The highest score will be assigned to a teacher not from a minority, male,
# that speaks english natively, young, whose students have filled the survey in
# highly populated classes, teaching classes of one credit only and with a high
# beauty average score.

## Exercise Would you be comfortable generalizing your conclusions to apply to
## professors generally (at any university)? Why or why not?
# No, because the teachers have been chosen within a single specific university,
# it is not clear that other variables (e.g. local culture) has not influenced
# survey results.