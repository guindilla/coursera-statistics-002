source("http://bit.ly/dasi_inference")

################################################################################
## The survey
################################################################################

## Question 1: How many people were interviewed for this survey?
# http://www.wingia.com/web/files/richeditor/filemanager/Global_INDEX_of_Religiosity_and_Atheism_PR__6.pdf
# A poll conducted by WIN-Gallup International surveyed 51,917 people from 57 countries
# A poll conducted by WIN-Gallup International surveyed 51,000 people from 57 countries
# A poll conducted by WIN-Gallup International surveyed 52,000 people from 57 countries
# -> A poll conducted by WIN-Gallup International surveyed 51,927 people from 57 countries

## Question 2: Which of the following methods were used to gather information?
# Face to face
# Telephone
# Internet
# -> All of the above

## Question 3: In the first paragraph, several key findings are reported. These
## percentages appear to be sample statistics.
# -> True
# False

## Question 4: The title of the report is “Global Index of Religiosity and
## Atheism”. To generalize the report’s findings to the global human population,
## We must assume that the sample was a random sample from the entire population
## in order to be able to generalize the results to the global human population.
## This does seem to be a reasonable assumption.
# -> False
# WRONG -> True

load(url("http://www.openintro.org/stat/data/atheism.RData"))

## Question 5: What does each row of Table 6 correspond to?
# -> Countries
# Religions
# Individual Persons

## Question 6: What does each row of 'atheism' correspond to?
head(atheism)
summary(atheism)
dim(atheism)
dim(atheism[atheism$year == 2005, ])
dim(atheism[atheism$year == 2012, ])
# -> Individual Persons
# Countries
# Religions

## Question 7: Using the command below, create a new dataframe called us12 that
## contains only the rows in atheism associated with respondents to the 2012
## survey from the United States. Next, calculate the proportion of atheist
## responses. [TRUE / FALSE] This percentage agrees with the percentage in Table
## 6.
us12 <- subset(atheism, atheism$nationality == "United States" &
                   atheism$year == "2012")
sum(us12$response == "atheist") / length(us12$response)
# -> True
# False

## Exercise: Write out the conditions for inference to construct a 95%
## confidence interval for the proportion of atheists in the United States in
## 2012. Are you confident all conditions are met?
# Within groups: random sample/assignement and n < 10% of population
# Sample size/skew: 1002*5% = 50.1 > 10, 1002*95% = 951.9 > 10, 
# Yes, all conditions are met

inference(us12$response, est = "proportion", type = "ci",
          method = "theoretical", success = "atheist")

## Exercise: Imagine that, after reading a front page story about the latest
## public opinion poll, a family member asks you, “What is a margin of error?”
## In one sentence, and ignoring the mechanics behind the calculation, how would
## you respond in a way that conveys the general concept?
# It is an interval in which the value will fall with n% probability

################################################################################
## Inference on proportions
################################################################################

## Question 8: Based on the R output, what is the margin of error for the
## estimate of the proportion of the proportion of atheists in US in 2012?
# From the inference() function, we know that p_hat = 0.0499 and the
# 95 % Confidence interval = ( 0.0364 , 0.0634 )
0.0499 - 0.0364
# The margin of error for the estimate of the proportion of atheists in the US in 2012 is 0.025.
# The margin of error for the estimate of the proportion of atheists in the US in 2012 is 0.05.
# -> The margin of error for the estimate of the proportion of atheists in the US in 2012 is 0.0135.

## Exercise: Using the inference function, calculate confidence intervals for
## the proportion of atheists in 2012 in two other countries of your choice, and
## report the associated margins of error. Be sure to note whether the
## conditions for inference are met. It may be helpful to create new data sets
## for each of the two countries first, and then use these data sets in the
## inference function to construct the confidence intervals.
es12 <- subset(atheism, atheism$nationality == "Spain" &
                   atheism$year == "2012")
inference(es12$response, est = "proportion", type = "ci",
          method = "theoretical", success = "atheist")
# p_hat = 0.09
# 95 % Confidence interval = ( 0.0734 , 0.1065 )
af12 <- subset(atheism, atheism$nationality == "Afghanistan" &
                   atheism$year == "2012")
inference(af12$response, est = "proportion", type = "ci",
          method = "theoretical", success = "atheist")
# p_hat = 0
# Error: There aren't at least 10 successes and 10 failures, use simulation
# methods instead.
inference(af12$response, est = "proportion", type = "ci",
          method = "simulation", success = "atheist")
# p_hat = 0
# 95 % Bootstrap interval = ( 0 , 0 )

################################################################################
## How does the proportion affect the margin of error?
################################################################################
n <- 1000
p <- seq(0, 1, 0.01)
# SE = sqrt(p*(1 − p)/n)
se <- sqrt(p * (1 - p)/n)
# ME = 1.96 x SE for 95% confidence margin
me <- 1.96 * se
plot(me ~ p)

## Question 9: Which of the following is false about the relationship between p
## and me.
# -> The most conservative estimate for calculating a confidence interval occurs when p is set to 1
# The me reaches a minimum at p = 0
# The me reaches a minimum at p = 1
# The me is maximized when p = 0.5

## Question 10: There is convincing evidence that Spain has seen a
## change in its atheism index between 2005 and 2012.
## Hint: Create a new data set for respondents from Spain. Then use their
## responses as the first input on the inference, and use year as the grouping
## variable.
es <- subset(atheism, atheism$nationality == "Spain")
inference(es$response, as.factor(es$year),
          est = "proportion", type = "ht", method = "theoretical",
          null = 0, alternative = "twosided", success = "atheist")
# H0: p_2005 - p_2012 = 0 
# HA: p_2005 - p_2012 != 0 
# Pooled proportion = 0.0952 
# Check conditions:
#     2005 : number of expected successes = 109 ; number of expected failures = 1037 
#     2012 : number of expected successes = 109 ; number of expected failures = 1036 
# Standard error = 0.012 
# Test statistic: Z =  0.848 
# p-value =  0.3966 

# True
# -> False

## Question 11: There is convincing evidence that the United States has seen a
## change in its atheism index between 2005 and 2012.
us <- subset(atheism, atheism$nationality == "United States")
inference(us$response, as.factor(us$year),
          est = "proportion", type = "ht", method = "theoretical",
          null = 0, alternative = "twosided", success = "atheist")
# H0: p_2005 - p_2012 = 0 
# HA: p_2005 - p_2012 != 0 
# Pooled proportion = 0.0299 
# Check conditions:
#     2005 : number of expected successes = 30 ; number of expected failures = 972 
#     2012 : number of expected successes = 30 ; number of expected failures = 972 
# Standard error = 0.008 
# Test statistic: Z =  -5.243 
# p-value =  0 

# False
# -> True


## Question 12: If in fact there has been no change in the atheism index in the
## countries listed in Table 4, in how many of those countries would you expect
## to detect a change (at a significance level of 0.05) simply by chance?
## Hint: Type 1 error.
# 95% confidence interval -> 5% error over a population of 39 countries surveyed
39*0.05
# 0
# -> 1.95
# 1
# 5

## Question 13: Suppose you’re hired by the local government to estimate the
## proportion of residents that attend a religious service on a weekly basis.
## According to the guidelines, the estimate must have a margin of error no
## greater than 1% with 95% confidence. You have no idea what to expect for p.
## How many people would you have to sample to ensure that you are within the
## guidelines?
## Hint: Refer to your plot of the relationship between p and margin of error.
## Do not use the data set to answer this question.
ME <- 0.01
# The most conservative ME happens with p = 50%
p <- 0.5
# ME = 1.96 * SE for 95% confidence margin
# SE = sqrt(p*(1 − p)/n)
# ME = 1.96 * sqrt(p*(1 − p)/n)
# ME^2 = 1.96^2 * p*(1 − p)/n
# n = 1.96^2 * p*(1 − p)/ME^2
1.96^2 * 0.5*(1 − 0.5)/ME^2

# 9604 people
# 2401 people
# -> At least 9604 people
# At least 2401 people