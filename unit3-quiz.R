## Question 1: Suppose we are interested in studying how much chocolate is consumed by Coursera students, measured in grams per week. After surveying 500 students, we calculate an average of 175 grams per week with a standard deviation of 195 grams per week. Which of the following is not necessarily true?
# A histogram of the samples will be skewed to the right.
# x¯=175,s=195
# -> μ=175, σ=195
# A point estimate for the population standard deviation is 195.

## Question 2: Which of the following is false?
# Standard error measures the variability in means of samples of the same size taken from the same population.
# -> In order to reduce the standard error by half, sample size should be doubled.
# As the sample size increases, the variability of the sampling distribution decreases.
# Standard error computed based on a sample standard deviation will always be lower than the standard deviation of that sample.

## Question 3: The standard error measures:
# the variability of population parameters
# the variability in the population
# -> the variability of sample statistics
# the variability of the sampled observations

## Question 4: Four plots are presented below. The plot at the top is a distribution for a population. The mean is 60 and the standard deviation is 18. Also shown below is a distribution of
## (1) a single random sample of 500 values from this population,
## (2) a distribution of 500 sample means from random samples of each size 18, 
## (3) a distribution of 500 sample means from random samples of each size 81. 
## Determine which plot (A, B, or C) is which.
# (1) one sample, n = 500 - Plot B 
# (2) 500 samples, n = 18 - Plot C 
# (3) 500 samples, n = 81 - Plot A

## Question 5: A random sample of 100 runners who completed the 2012 Cherry Blossom 10 mile run yielded an average completion time of 95 minutes. A 95% confidence interval calculated based on this sample is 92 minutes to 98 minutes. Which of the following is false based on this confidence interval?
# Based on this 95% confidence interval, we would reject a null hypothesis stating that the true average finishing time of all runners who completed the 2012 Cherry Blossom 10 mile run is 90 minutes.
# -> 95% of the time the true average finishing time of all runners who completed the 2012 Cherry Blossom 10 mile run is between 92 minutes and 98 minutes.
# The margin of error of this confidence interval is 3 minutes.
# We are 95% confident that the true average finishing time of all runners who completed the 2012 Cherry Blossom 10 mile run is between 92 minutes and 98 minutes.

## Question 6: A study suggests that the average college student spends 2 hours per week communicating with others online. You believe that this is an underestimate and decide to collect your own sample for a hypothesis test. You randomly sample 60 students from your dorm and find that on average they spent 3.5 hours a week communicating with others online. Which of the following is the correct set of hypotheses for this scenario?
# H0:μ=2
# HA:μ>2

## Question 7: Which of the following is the correct definition of the p-value?
# P(observed or more extreme sample statistic | H0 true)

## Question 8:Suppose we collected a sample of size n = 100 from some population and used the data to calculate a 95% confidence interval for the population mean. Now suppose we are going to increase the sample size to n = 300. Keeping all else constant, which of the following would we expect to occur as a result of increasing the sample size?
## I The standard error would decrease.
## II Width of the 95% confidence interval would increase.
## III The margin of error would decrease.
# WRONG I and II
# It's also III: Increasing the sample size (while keeping the same confidence level) will decrease the standard error, which decreases the margin of error and hence the width of intervals.

## Question 9: A researcher found a 2006 - 2010 survey showing that the average age of women at first marriage is 23.44. Suppose a researcher believes that this value may have increased more recently, but as a good scientist he also wants to consider the possibility that the average age may have decreased. The researcher has set up his hypothesis test; which of the following states the appropriate HA correctly?
# HA:μ≠23.44 years old.

## Question 10: A Type 1 error occurs when the null hypothesis is
# rejected when it is true

## Question 11: A statistician is studying blood pressure levels of Italians in the age range 75-80. The following is some information about her study:
## I The data were collected by responses to a survey conducted by email, and no measures were taken to get information from those who did not respond to the initial survey email.
## II The sample observations only make up about 4% of the population.
## III The sample size is 2,047.
## IV The distribution of sample observations is skewed - the skew is easy to see, although not very extreme.
## The researcher is ready to use the Central Limit Theorem (CLT) in the main part of her analysis. Which aspect of the her study is most likely to prevent her from using the CLT?
# (IV), because there is some skew in the sample distribution.
# -> (I), because the sample may not be random and hence observations may not be independent.
# (II), because she only has data from a small proportion of the whole population.
# (III), because the sample size is too small compared to all Italians in the age range 75-80.

## Question 12: SAT scores are distributed with a mean of 1,500 and a standard deviation of 300. You are interested in estimating the average SAT score of first year students at your college. If you would like to limit the margin of error of your 98% confidence interval to 40 points, at least how many students should you sample?
SD <- 300
ME <- 40
CI <- 0.98  # Confidence interval
z <- abs(qnorm((1-CI)/2))
n <- (z*SD/ME)^2
ceiling(n)

## Question 13: True / False: Decreasing the significance level (α) will increase the probability of making a Type 1 error.
# False

## Question 14: The nutrition label on a bag of potato chips says that a one ounce (28 gram) serving of potato chips has 130 calories and contains ten grams of fat, with three grams of saturated fat. A random sample of 35 bags yielded a sample mean of 134 calories with a standard deviation of 17 calories. We are evaluating whether these data provide convincing evidence that the nutrition label does not provide an accurate measure of calories in the bags of potato chips at the 10% significance level. Which of the following is correct?
n <- 35
m <- 134 # mean
s <- 17 # standard deviation
SE <- s / sqrt(n)

Z <- (m - 130) / SE

p.level <- 2*(1-pnorm(Z))
round(p.level, 2)  # 16%

# WRONG The p-value is approximately 8%, which means we should fail to reject the null hypothesis and determine that these data do not provide convincing evidence the nutrition label does not provide an accurate measure of calories in the bags of potato chips.
# If the p-value is 8% and we're using a 10% significance level, we should be rejecting the null hypothesis so this cannot be true. (Note also that the p-value isn't actually 8%.)

## Question 15: Researchers investigating characteristics of gifted children collected data from schools in a large city on a random sample of thirty-six children who were identified as gifted children soon after they reached the age of four. The following histogram shows the distribution of the ages (in months) at which these children first counted to 10 successfully. Also provided are some sample statistics. 
## Calculate a 90% confidence interval for the average age at which gifted children first count to 10 successfully. Choose the closest answer.
30.69 + qnorm(0.1/2) * c(1, -1) * 4.31 / sqrt(36)
# (29.50, 31.88)
