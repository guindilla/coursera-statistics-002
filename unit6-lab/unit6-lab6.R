################################################################################
## The data
################################################################################

load(url("http://www.openintro.org/stat/data/mlb11.RData"))

## Question 1: What type of plot would you use to display the relationship
## between runs and one of the other numerical variables?
# histogram
# box plot
# -> scatterplot
# bar plot

## Question 2: Plot the relationship between runs andat bats, using at bats as
## the explanatory variable. The relationship appears to be ______.
plot(mlb11$at_bats, mlb11$runs)
# u-shaped (∪)
# -> linear
# negative
# horseshoe-shaped (∩)

## Exercise: If you knew a team’s at bats, would you be comfortable using a
## linear model to predict their number of runs?
# Yes, although I would not expect a lot of precision.

cor(mlb11$runs, mlb11$at_bats)

################################################################################
## Sum of squared residuals
################################################################################

## Question 3: Looking at your plot from the previous exercise, which of the
## following best describe the relationship between these two variables?
# The relationship is negative, linear, and moderately strong. One of the potential outliers is a team with approximately 5520 at bats.
# -> The relationship is positive, linear, and moderately strong. One of the potential outliers is a team with approximately 5520 at bats.
# The relationship is positive, linear, and very weak. There are no outliers.
# The relationship is positive, linear, and very weak. One of the potential outliers is a team with approximately 5520 at bats.

plot_ss(x = mlb11$at_bats, y = mlb11$runs)
plot_ss(x = mlb11$at_bats, y = mlb11$runs, showSquares = TRUE)

################################################################################
## The linear fit model
################################################################################

# y ~ x
m1 <- lm(runs ~ at_bats, data = mlb11)
summary(m1)
# yˆ = −2789.2429 + 0.6305 atbats

## Question 4: Fit a new model that uses homeruns to predict runs. Using the
## estimates from the R output, write the equation of the regression line. What
## does the slope tell us in the context of the relationship between success of
## a team and its home runs?
m2 <- lm(runs ~ homeruns, data = mlb11)
summary(m2)
# -> For each additional home run, the model predicts 1.83 more runs, on average.
# Each additional home run increases runs by 1.83.
# For each additional home run, the model predicts 1.83 fewer runs, on average.
# For each additional home run, the model predicts 415.24 more runs, on average.
# For each additional home run, the model predicts 415.24 fewer runs, on average.

################################################################################
## Prediction and prediction errors
################################################################################
plot(mlb11$runs ~ mlb11$at_bats)
abline(m1)

## Exercise: If a team manager saw the least squares regression line and not the
## actual data, how many runs would he or she predict for a team with 5,579
## at-bats? Is this an overestimate or an underestimate, and by how much?
new.at_bats <- data.frame(at_bats=c(5579))
predict(m1, new.at_bats)

## Question 5: What is the residual for the prediction of runs for a team with
## 5,579 at-bats? Choose the closest answer.
mlb11[mlb11$at_bats == 5579, "runs"]
predict(m1, new.at_bats)
m1$residuals
mlb11[mlb11$at_bats == 5579, "runs"] - predict(m1, new.at_bats)
# -> -15.32
# 15.32
# 713
# 5,579

################################################################################
## Model diagnostics
################################################################################

### Check for linearity
plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0

## Question 6: Which of the following statements about the residual plot is
## false?
# The residuals appear to be randomly distributed around 0.
# -> The residuals show a curved pattern.
# The plot is indicative of a linear relationship between runs and at-bats.
# The team with a very high residual compared to the others appears to be an outlier.

### Check for nearly normal residuals
hist(m1$residuals)
# Another option
qqnorm(m1$residuals)
qqline(m1$residuals) # adds diagonal line to the normal prob plot

## Question 7: Which of the following is true?
# The residuals are extremely right skewed, hence the normal distribution of residuals condition is not met.
# The residuals are extremely left skewed, hence the normal distribution of residuals condition is not met.
# -> The residuals are failry symmetric, with only a slightly longer tail on the right, hence it would be appropriate to deem the the normal distribution of residuals condition met.
# The residuals are perfectly symmetric, hence the normal distribution of residuals condition is met.

### Check for constant variability
# Based on plot above:
plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0


## Question 8: [TRUE / FALSE] Based on the plot in (1), the constant variability
## condition appears to be met.
# -> True
# False

# Exercise Choose another traditional variable from mlb11 that you think might
# be a good predictor of runs. Produce a scatterplot of the two variables and
# fit a linear model. At a glance, does there seem to be a linear relationship?
m3 <- lm(runs ~ hits, data = mlb11)
plot(mlb11$runs ~ mlb11$hits)
abline(m3)

plot(m3$residuals ~ mlb11$hits)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0

hist(m3$residuals)
# Another option
qqnorm(m3$residuals)
qqline(m3$residuals) # adds diagonal line to the normal prob plot

# yes, there seems to be a linear relationship

# Exercise: How does this relationship compare to the relationship between runs
# and at bats? Use the R2 values from the two model summaries to compare. Does
# your variable seem to predict runs better than at bats? How can you tell?
summary(m1)$r.squared
summary(m3)$r.squared
# Our new model is far better. as it has a higher R2 value

## Question 9: Now that you can summarize the linear relationship between two
## variables, investigate the relationships between runs and each of the other
## five traditional variables. Which variable best predicts runs?
summary(lm(runs ~ at_bats, data = mlb11))$r.squared
summary(lm(runs ~ hits, data = mlb11))$r.squared
summary(lm(runs ~ wins, data = mlb11))$r.squared
summary(lm(runs ~ bat_avg, data = mlb11))$r.squared
# at bats
# hits
# wins
# -> batting average

## Question 10: Now examine the three newer variables. These are the statistics
## used by the author of Moneyball to predict a teams success. In general, are
## they more or less effective at predicting runs that the old variables?
## Explain using appropriate graphical and numerical evidence. Of all ten
## variables we’ve analyzed, which seems to be the best predictor of runs?

m4 <- lm(runs ~ new_obs, data = mlb11)
plot(mlb11$runs ~ mlb11$new_obs)
abline(m4)
summary(m4)$r.squared
plot(m4$residuals ~ mlb11$hits)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0

m5 <- lm(runs ~ new_slug, data = mlb11)
plot(mlb11$runs ~ mlb11$new_slug)
abline(m5)
summary(m5)$r.squared
plot(m5$residuals ~ mlb11$hits)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0

m6 <- lm(runs ~ new_onbase, data = mlb11)
plot(mlb11$runs~ mlb11$new_onbase)
abline(m6)
summary(m6)$r.squared
plot(m6$residuals ~ mlb11$hits)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0
# -> on-base plus slugging (new obs)
# slugging percentage (new slug)
# on-base percentage (new onbase)
