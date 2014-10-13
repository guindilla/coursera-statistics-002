################################################################################
## Part A
################################################################################

load(url("http://bit.ly/dasi_nc"))

## Question 1: There are 1,000 cases in this data set, what do the cases represent?
head(nc)
# -> The births
# The fathers of the children
# The hospitals where the births took place
# The days of the births


## Question 2: How many mothers are we missing weight gain data from?
summary(nc)
# 0
# 13
# -> 27
# 31

gained_clean <- na.omit(nc$gained)
n <- length(gained_clean)
## Exercise: Quick check: Double check that n is what it’s expected to be based
## on the number of NAs present in the original weight gain variable.
n == (1000-27)

boot_means <- rep(NA, 100)
for(i in 1:100){
    boot_sample <- sample(gained_clean, n, replace = TRUE)
    boot_means[i] <- mean(boot_sample)
}

## Question 3: The sampling distribution is calculated by resampling from the population, the bootstrap distribution is calculated by resampling from the sample.
# -> True
# False

## Exercise: Make a histogram of the bootstrap distribution (boot means).
hist(boot_means, breaks = 100)

## Question 4: The sampling distribution is calculated by resampling from the population, the bootstrap distribution is calculated by resampling from the sample.
# True
# -> False

## Exercise: Estimate a 90% confidence interval using the percentile method for
## the average weight gained by mothers during pregnancy, explain briefly how
## you estimated the interval, and interpret this interval in context of the
## data.
s <- sd(gained_clean)
m <- mean(gained_clean)
n <- length(gained_clean)
SE <- s / sqrt(n)
Z <- abs(qnorm(0.05))
m + c(-1, 1) * Z * SE
# The mean appears to be included in the confidence interval.

## Exercise: Next, calculate the bootstrap standard error. Note that this is 
## basically the standard deviation of the bootstrap means stored in boot means.
## Using this value, calculate a 90% confidence interval for the same parameter
## of intertest. Are the two intervals approximately equal?
s <- sd(boot_means)
m <- mean(boot_means)
m + c(-1, 1) * Z * s
# They are approximatelly equal indeed.

# Inference function
source("http://bit.ly/dasi_inference")

# By default the function takes 10,000 bootstrap samples (instead of the 100
# you’ve taken above), creates a bootstrap distribution, and calculates the
# confidence interval, using the percentile method.
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.9,
          est = "mean", boot_method = "perc")
# We can easily change the confidence level to 95% by changing the conflevel:
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95,
          est = "mean", boot_method = "perc")
# We can easily use the standard error method by changing the boot method:
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95,
          est = "mean", boot_method = "se")

## Question 5: The bootstrap distribution of the median weight gain is a smooth,
##unimodal, symmetric distribution that yields a reliable confidence interval
##estimate.
inference(nc$gained, type = "ci", method = "simulation", conflevel = 0.95,
          est = "median", boot_method = "se")
# True
# -> False

# Exercise: Create a 95% bootstrap confidence interval for the mean age of
# fathers at the birth of their child (nc$fage) using the standard error method.
# Interpret the interval within the context of the data.
inference(nc$fage, type = "ci", method = "simulation", conflevel = 0.95,
          est = "mean", boot_method = "se")
# 95% of means calculated from bootstrapping samples will lie
# between ( 29.8008 , 30.7158 )

# Exercise: What type of variables are habit and weight (numerical/categorical)?
# Make an appropriate plot that visualizes the relationship between these
# variables.
plot(nc$habit)  # Categorical
hist(nc$weight)  # Numerical
plot(nc$habit, nc$weight)

## Question 6: Based on the plot from the previous exercise, which of the
## following is false about the relationship between habit and weight?
# Median birth weight of babies born to non-smoker mothers is slightly higher than that of babies born to smoker mothers.
# Range of birth weights of babies born to non-smoker mothers is greater than that of babies born to smoker mothers.
# -> Both distributions are slightly right skewed.
# The IQRs of the distributions are roughly equal.

by(nc$weight, nc$habit, mean)

# Exercise: Check if the conditions necessary for inference are satisfied. Note
# that you will need to obtain sample sizes to check the conditions. You can
# compute the group size using the same by command above but replacing mean with
# length.
by(nc$weight, nc$habit, length)
# The observations are independent among them, and the size of both groups are very likely <10% of population
# The two groups are independent of each other - are non paired.
# Each sample has more than 30 observations and the sample is not very skewed, so it is enough.

# Use the inference for evaluating whether there is a difference between the
# average birth weights of babies born to smoker and non-smoker mothers.
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0,
          alternative = "twosided", method = "theoretical")

# By default the function sets the parameter of interest to be (µnonsmoker −
# µsmoker). We can easily change this order by using the order argument:
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0,
          alternative = "twosided", method = "theoretical",
          order = c("smoker","nonsmoker"))

## Question 7: Change the type argument to "ci" to construct and record a
## confidence interval for the difference between the weights of babies born to
## smoking and non- smoking mothers. Which of the following is the best
## interpretation of the interval?
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", null = 0,
          alternative = "twosided", method = "theoretical",
          order = c("smoker","nonsmoker"))
# -> We are 95% confident that babies born to nonsmoker mothers are on average 0.05 to 0.58 pounds heavier at birth than babies born to smoker mothers.
# We are 95% confident that the difference in average weights of babies in this sample whose moms are smokers and nonsmokers is between 0.05 to 0.58 pounds.
# WRONG -> We are 95% confident that the difference in average weights of babies whose moms are smokers and nonsmokers is between 0.05 to 0.58 pounds.
# We are 95% confident that babies born to nonsmoker mothers are on average 0.05 to 0.58 pounds lighter at birth than babies born to smoker mothers.

## Question 8: Now, a non-inference task: Determine the age cutoff for younger and mature mothers. Use a method of your choice. What is the maximum age of a younger mom and the minimum age of a mature mom, according to the data?
range(nc[nc$mature == unique(nc$mature)[1], ]$mage)
range(nc[nc$mature == unique(nc$mature)[2], ]$mage)
# The maximum age of younger moms is 33 and minimum age of mature moms is 34.
# The maximum age of younger moms is 35 and minimum age of mature moms is 36.
# The maximum age of younger moms is 32 and minimum age of mature moms is 33.
# -> The maximum age of younger moms is 34 and minimum age of mature moms is 35.

# Exercise: Pick a pair of numerical and categorical variables and come up with
# a research question evaluating the relationship between these variables.
# Formulate the question in a way that it can be answered using a hypothesis
# test and/or a confidence interval. Answer your question using the inference
# function, report the statistical results, and also provide an explanation in
# plain language.

# Do mature moms have a different pregnancy length than younger moms?
# H0: mu_younger - mu_mature = 0
# HA: mu_younger - mu_mature != 0
inference(y = nc$weeks, x = nc$mature, est = "mean", type = "ht", null = 0,
          alternative = "twosided", method = "theoretical",
          order = c("younger mom", "mature mom"))
# p-value is 0.2258, so we can not reject our H0

################################################################################
## Part B
################################################################################

load(url("http://bit.ly/dasi_gss_ws_cl"))

# Exercise: Create numerical and visual summaries of the two variables
# individually to better understand their distribution. Also compute summary
# statistics and visualizations that display the relationship between the two
# variables.
summary(gss$wordsum)
hist(gss$wordsum)
summary(gss$class)
plot(gss$class)

table(gss$class, gss$wordsum)
plot(gss$class, gss$wordsum)

## Question 9: Which of the following methods is appropriate for testing for a
##difference between the average vocabulary test scores among the various social
##classes? Hint: Consider the number of levels of the class variable.
# χ2 test 
# -> ANOVA
# T test
# Z test

# Now let’s run the test:
inference(y = gss$wordsum, x = gss$class, est = "mean", type = "ht",
          alternative = "greater", method = "theoretical")

## Question 10: Calculate the modified α (α∗) to be used for these tests.
# α∗ =α/4=0.0125
# α∗ =α/2=0.025
# -> α∗ =α/6=0.0083  # α∗ = α/ K; K = k*(k-1)/2
# α∗ =α=0.05

## Question 11: View the p-values of the pairwise tests from the ANOVA output.
## Which of the following pairs of means are concluded to be different at the
## modified significance level?
# WRONG -> Working and upper
# Middle and upper
# Working and lower
# Upper and lower
# -> Middle and lower

