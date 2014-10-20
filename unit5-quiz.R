## Question 1: Which of the following is not required for the distribution of
## the sample proportion to be nearly normal?
# -> Sample size should be at least 30 and the population distribution should not be extremely skewed.
# Observations should be independent.
# There should be at least 10 successes.
# There should be at least 10 failures.

## Question 2: When performing a hypothesis test on proportions (either where
## H0:p=p0 or where H0:p1=p2) you should use the observed number of successes
## and failures when checking conditions.
# WRONG -> True
## Use the observed number of successes and failures when calculating a
## confidence interval for a proportion, but not when doing a hypothesis test.
## In a hypothesis test for a proportion, you should use np0 and n(1−p0)
## successes and failures; that is, the expected number based on the null
## proportion.
## For confidence intervals use p^ (observed sample proportion) when calculating
## the standard error and checking the success/failure condition. For hypothesis
## tests use p0 (null value) when calculating the standard error and checking
## the success/failure condition.
# False
# Depends on the context
# Observed proportion for one sample, expected proportion for two samples.

## Question 3: In 2013, Edward Snowden leaked details of top-secret NSA spying
## activities to the media. A poll conducted by USA TODAY / Pew Research Center
## asked 1,504 people in U.S. whether Snowden’s leaks have helped or harmed the
## public interest. 53% of respondents answered “helped the public interest”.
## You want to test whether a majority of people in the U.S. believe he helped
## the public interest. Which of the following is the correct set of hypotheses?
# H0 :p < 0.5; HA :p > 0.5
# H0 :p = 0.53; HA :p < 0.53
# -> H0 :p = 0.5; HA :p > 0.5
# H0 :p = 0.53; HA :p > 0.53

## Question 4: You and a friend are about to visit the aviary at the local zoo
## for the first time. A trustworthy zookeeper says the aviary holds about 3,000
## birds. Your friend read somewhere that 10% of those birds are cardinals, but
## he thinks there are really more cardinals than that. You’re both great at
## identifying cardinals so you decide to test this claim with a hypothesis test
## on the true proportion p of cardinals in the aviary. You walk around the
## aviary together and get a simple random sample by spotting 250 birds. Of
## these, 35 were cardinals and 215 were not cardinals. The p-value is 0.0175.
## Which of the following is false?

# H0 :p = 0.10
# -> If in fact 10% of the birds in the aviary are cardinals, the probability of obtaining a random sample of 250 birds where exactly 14% are cardinals is 0.027.
birds <- 250
p <- 0.1
cardinals <- n * p
dbinom(cardinals, size = birds, prob = p)
# p^ = 0.14
# The success-failure condition is met.
250/3000 < 0.1
p <- 0.1
250 * (p) > 10
250 * (1-p) > 10

## Question 5: When do we use the pooled proportion in calculation of the
## standard error of the difference of two proportions (SE(p^1 − p^2))?
# -> when comparing p1 and p2 using a theoretical approach, and the null hypothesis is H0 : p1 − p2 = 0
# when using a randomization test to compare p1 − p2
# when comparing p1 and p2 using a theoretical approach, and the null hypothesis is H0 : p1 − p2 = (some value other than 0)
# when constructing a confidence interval for p1 − p2

## Question 6: “In statistical inference for proportions, standard error (SE) is
## calculated differently for hypothesis tests and confidence intervals.” Which
## of the following is the best justification for this statement?
# Because in hypothesis testing we’re interested in the variability of the true population distribution, and in confidence intervals we’re interested in the variability of the sampling distribution.
# Because in hypothesis testing we’re interested in the variability of the population dis- tribution, and in confidence intervals we’re interested in the variability of the sampling distribution.
# There isn’t a good justification for this statement, because it is not true; calculation of SE does not depend on the type of inference.
# -> Because in hypothesis testing, we assume the null hypothesis is true, hence we calculate SE using the null value of the parameter. In confidence intervals, there is no null value, hence we use the sample proportion(s).

## Question 7: At the beginning of a semester an anonymous survey was conducted
## on students in a statistics class. Two of the questions on the survey were
## about gender and whether or not students have equal, more, or less energy in
## the afternoon compared to the morning. Below are the results.
## What test should we perform to see if gender and energy level are associated?
# -> Chi-square test of independence
# Comparing two proportions
# F test
# ANOVA

## Question 8: When doing a hypothesis test on a single proportion (i.e. for one
## categorical variable), we have studied how to calculate the p-value for the
## hypothesis test, beginning with generating simulated samples. Which of the
## following is the best description for how you should generate the simulated
## samples, and why?
# Generate simulated samples based on the alternative hypothesis because that is the hypothesis we’re trying to prove when doing the hypothesis test.
# -> Generate simulated samples based on the null hypothesis because we need to see how extreme our observed data looks if the null hypothesis were really true.
# Generate simulated samples based on the null hypothesis because that is the hypothesis we’re trying to prove when doing the hypothesis test.
# Generate simulated samples based on the alternative hypothesis because we need to see how extreme our observed data looks if the alternative hypothesis were really true.

## Question 9: One of the early studies linking smoking and lung cancer compared
## patients hospitalized with lung cancer to similar patients without lung
## cancer (hospitalized for other reasons), and recorded whether each patient
## smoked. For a hypothesis test testing whether the proportion of smokers is
## higher for the patients with lung cancer than for patients without lung
## cancer, the p-value is less than 0.000001. Does this provide significant
## evidence that smoking causes lung cancer?
## Study reference: Doll, R. & Hill, A.B. (1950) “Smoking and carcinoma of the
## lung: preliminary report”, British Medical Journal.
# -> Based on this study we cannot conclude that smoking causes lung cancer, regardless of the p-value.
# No, with the given p-value we would fail to reject H0 in favor of HA.
# Yes, with the given p-value we would reject H0 in favor of HA, and conclude that smoking causes lung cancer.
# Whether or not we can conclude that smoking causes lung cancer depends on the statistical method the researchers used to obtain the p-value.

## Question 10: 80% of Americans start the day with a cereal breakfast. Based on
## this information, determine if the following statement is true or false. “The
## sampling distribution of the proportions of Americans who start the day with
## a cereal breakfast in random samples of size 40 is right skewed.”
# True
# -> False

## Question 11: At a stop sign, some drivers come to a full stop, some come to a
## ‘rolling stop’ (not a full stop, but slow down), and some do not stop at all.
## We would like to test if there is an association between gender and type of
## stop (full, rolling, or no stop). We collect data by standing a few feet from
## a stop sign and taking note of type of stop and the gender of the driver.
## Below is a contingency table summarizing the data we collected. If gender is
## not associated with type of stop, how many males would we expect to not stop
## at all? Choose the closest answer.
no.stop <- (4 + 3)
females <- 6 + 16 + 4
males <- 6 + 15 + 3
sample <-  males + females
p <- no.stop / sample
males * p

# 3.64
# -> 3.36
# 5.76
# 6.24

## Question 12: True/False: When the success-failure condition is not met, we
## should use a T test to compare two proportions.
# -> False
# True