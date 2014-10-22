## Question 1: A statistics instructor wants to use the number of hours studied
## to predict exam scores in her class. She wants to use a linear regression
## model. Data from previous years shows that the correlation between these two
## variables is 0.76. Which of the following is the best response for whether or
## not the instructor should use linear regression to predict exam scores for a
## student who studied 10 hours for the final?
# -> Linear regression could be appropriate if the scatterplot shows a clear linear relationship.
# Yes, there is a high correlation, so it is appropriate to use linear regression.
# No, because there is no way to prove that more hours of study causes higher exam scores.
# Yes, because linear regression is the statistical method used to make predictions when you have bivariate quantitative data.

## Question 1: Of the four plots shown below, which one appears to show the
## weakest relationship between two variables?
# -> (IV) # Relationship is weak because it is horizontal line!! and thus there are no direct relationship
# (I)
# WRONG -> (II)
# (III)

## Question 2: The first plot below was created by plotting data collected on
## two variables. Then, the second plot was created using the same data but with
## different units for the dependent variable. In the context of linear
## regression, which of the following best describes the differences between the
## two plots?
# The correlation coefficient for the second plot has a smaller absolute value, but the slopes of the linear relationships in the two plots are the same.
# -> The slope of the linear relationship in the first plot has a larger absolute value, but the correlation coefficients for the two plots are the same.
# The slope of the linear relationship in the first plot has a smaller absolute value, but the correlation coefficients for the two plots are the same.
# Both the slopes and the regression coefficients are the same for the two plots.
# The correlation coefficient for the second plot has a larger absolute value, but the slopes of the linear relationships in the two plots are the same.

## Question 2: Which of the following is false?
# Correlation measures the strength of the linear association between two numerical variables.
# -> If the correlation coefficient is 1, then the slope must be 1 as well.
# Two numerical variables with a correlation of 0.01 have very weak linear association.
# Correlation coefficient and the slope always have the same sign (positive or negative).

## Question 3: Which of the following is false?
# -> The variability of residuals should increase as x increases.
# A data point that has a negative residual is located below the regression line.
# Residuals of linear models should be distributed nearly normally around 0.
# The residuals plot (residuals vs. x) should show a random scatter around 0.

## Question 4: Sixteen student volunteers at Ohio State University drank a
## randomly assigned number beers. Thirty minutes later, a police officer
## measured their blood alcohol content (BAC) in grams of alcohol per deciliter
## of blood. The scatterplot displays the rela- tionship between BAC and number
## of beers consumed. Suppose a mistake was found in the data: the student who
## supposedly drank the highest number of beers (9 beers) actually only drank 6.
## His BAC was recorded correctly. In a new scatterplot, how would the strength
## of the association appear - compared to the strength of the association shown
## here?
# Roughly the same as the strength of the association shown in the above scatterplot.
# -> Weaker than the strength of the association shown in the above scatterplot.
# Stronger than the strength of the association shown in the above scatterplot.
# It’s impossible to tell.

## Question 4: An ambitious young student collected data on household
## electricity usage for a few families. After she plotted the data (shown
## below), the student observed that there did not appear to be a strong,
## positive linear relationship between the two variables as she had expected.
## The student still suspects that such a relationship exists - which of the
## following is the best advice an experienced statistician could give to the
## girl in order to help her investigate whether there is a linear relationship?
# -> Collect electricity usage data for more families of sizes 1 through 5.
# There is actually no practical strategy; whatever the strength of the association between these two variables, we cannot get a better idea of it just by collecting more data.
# Plot the current data again, using a different scale for electricity usage. A poorly-chosen scale for this plot may be hiding a linear trend.
# Collect one data point each for a family of size 6, 7, etc. in order to extend the plot off to the right.

## Question 5: The R2 for the linear regression of two variables x and y is
## 0.60. The variables are negatively associated. Which of the following the
## correct correlation coefficient? Choose the closest answer.
-1 * sqrt(0.60)  # -1 because of the negative association
# -0.36
# 0.77
# 0.40
# 0.36
# -> -0.77

## Question 6: The scatterplot on the right shows the relationship between
## percentage of white residents and percentage of households with a female head
## (where no husband is present) in all 50 US States and the District of
## Columbia (DC). Which of the below best describes the two points marked as DC
## and Hawaii?
# -> Hawaii has higher leverage and is more influential than DC.
# DC is more influential than Hawaii, but it has lower leverage than Hawaii.
# DC and Hawaii should both be excluded from a simple linear regression analysis.
# WRONG -> DC is not an outlier, and Hawaii is a leverage point.
# WRONG -> Hawaii is not an outlier, and DC is not a leverage point.
# Neither DC nor Hawaii appear to be leverage points.

## Question 7: A colleague needs some help with a statistics problem: He brings
## you the plot shown below, along with a correlation coefficient of 0.03 which
## he calculated himself. The plot shows two numerical variables which are
## obviously strongly related, and as a result your colleague is afraid he made
## a mistake calculating the correlation coefficient: that is, he was surprised
## to get an answer so close to 0. Given only this information, which of the
## following responses is the best to give your colleague?
# -> The correlation coefficient measures the strength of the linear relationship, therefore two variables that have a strong non-linear association might still have a low correlation coefficient.
# Your colleague must have made a mistake in his calculations. A much higher correlation coefficient is expected for variables that show a clear association.

## Question 8: Based on an observational study, a clinical psychologist finds
## that the relationship between the number of weeks spent in a therapy hospital
## and number of seizures per week is described by the following equation:
## Which of the following is the best interpretation of the slope estimate?
# For each additional seizure per week, we would expect the average number of additional weeks spent in the therapy hospital to be higher by 0.91 seizures.
# -> For each additional week spent in the therapy hospital, we would expect the average number of seizures per week to lower by 0.91 seizures.
# Each additional week spent in a therapy hospital decreases the number of seizures per week by 0.91.
# All patients start their treatment with at least 14.09 seizures per week.

## Question 9: The model below is for predicting the heart weight (in g) of cats
## from their body weight (in kg). The coefficients are estimated using a
## dataset of 144 domestic cats. The correlation between the heart and body
## weight is 0.8. Which of the following is false?
# -> The slope estimate would not change if body weights were measured in pounds.
# The intercept is meaningless in context of the data and only serves to adjust the height of the regression line.
# The correlation coefficient would not change if body weights were measured in pounds.
# The explanatory variable is body weight, and the response variable is heart weight.

## Question 10: The model below is for predicting the heart weight (in g) of
## cats from their gender (female and male). The coefficients are estimated
## using a dataset of 144 domestic cats. Which of the following is false?
# -> The intercept is meaningless.
# Gender is a significant predictor of heart weight in cats.
# On average, male cats are expected to have hearts that weigh 2.12 grams more than female cats.
# The expected heart weight for male cats is, on average, 11.32 grams.
# If the regression equation is written y^=b0+b1x, then plugging in x=0 would give you the predicted heart weight for a female cat.

## Question 10: The model below is for predicting the heart weight (in g) of
## cats from their gender (female and male). The coefficients are estimated
## using a dataset of 144 domestic cats. Which of the following is false?
# -> Because Pr(>|t|)=0 for the gender variable, we can say that gender is not a significant predictor of heart weight in cats.
# Gender is a significant predictor of heart weight in cats.
# The expected heart weight for female cats is 9.2 grams, on average.
# On average, male cats are expected to have hearts that weigh 2.12 grams more than female cats.
# The expected heart weight for male cats is, on average, 11.32 grams.

## Question 11: The linear model below is used for predicting poverty rate from
## high school graduation rate in the 51 states in the US (including DC).
## povertyˆ=64.68−0.62 HS grad rate
## High school graduation rate for North Carolina is 81.4% and the poverty rate
## is 13.1%. What is the residual for this observation? Choose the closest
## answer.
## A snippet of the data matrix is provided below, pay attention to the scale of
## the data in solving this question:
HSgr <- 81.4
model.result <- 64.68 - 0.62 * HSgr
13.1 - model.result
# -24.8
# 0
# 24.8
# 1.1
# -> -1.1

## Question 11: Fill in the blanks: A data point that has a negative residual is
## located ________ the regression line.
# above
# -> below
# on

## Question 12: We fit a linear regression model for predicting the best used
## price of 23 GMC pickup trucks from their list price, both measured in
## thousands. Which of the following is false based on this model output?
# -> The 95% confidence interval for the slope can be calculated as 0.85±84.7×0.01.
# TRUE For each additional $1,000 in the list price of a GMC pickup truck we would expect the best used price to be higher on average by $850.
# TRUE The linear model is best_used_priceˆ=0.43+0.85 list_price.
# TRUE List price is a significant predictor of the best used price.
# TRUE The intercept is meaningless in this context.

## Question 12: Determine if I or II is higher, or if they are equal:
## The uncertainty associated with the slope estimate when 
##      I. there is a lot of scatter around the regression line 
##      II. there is very little scatter around the regression line
# I and II are equal
## b1 +/- Tdf * SEb1
## Standard error is higher the higher the scatterness of the data
# II is higher
# -> I is higher

## Question 13: Which of the following best describes SST (sum of squares total)
## in a regression?
# Explained variability in the response variable.
# Total variability in the explanatory variable.
# Unexplained variability in the response variable.
# -> Total variability in the response variable.
# Strength of the model fit.

## Question 13: The following ANOVA output is for the linear model predicting
## nicotine content (in mg) from tar content (in mg). Which of the following is
## R2? Choose the closest answer.
# R2 = explained variability / total variability
2869 / 3008
# 5%
# 0.2%
# -> 95%
# 20%
# 4%