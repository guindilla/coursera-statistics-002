################################################################################
## Part 1  -- 14/15 points
################################################################################

## Question 1: Answer questions 1 to 4 based on the information below. 
## Reaction distance. In an experiment for measuring the reaction distance, the
## experimenter drops a meter ruler vertically and reads the distance dropped
## when the subject catches the ruler (in centimeters). This is called the
## reaction distance. Note that smaller distances indicate quicker reactions. 
## This experiment was conducted on a random sample of 40 college students. A
## box plot of the distribution of reaction distances from these 40 students as
## well as summary statistics are provided below. 
## A professor claims that college students, on average, have quicker reactions
## than the general population. The overall average reaction distance for the
## general population is 10 centimeters. Then, what are the hypotheses for
## evaluating the professor's claim?
# H0 : μ = 10
# HA : μ > 10

# H0 :μ = 10 
# HA : μ ≠ 10

# H0 : x = 10 
# HA : x > 10

# H0 : x = 10 
# HA : x < 10
 
# -> H0 :μ = 10 
# -> HA :μ < 10

## Question 2: Which of the following is not a condition that needs to be met to
## proceed with this hypothesis test using methods based on the Central Limit
## Theorem?
# Random sampling.
# Independent observations.
# -> At least 10 successes and 10 failures.
# Sample makes up less than 10% of the population.

## Question 3: What is the p-value for this hypothesis test? Choose the closest
## answer.
# Let's supose the distribution is normal
m <- 9.51  # mean
s <- 4.65 # standard deviation
n <- 40
SE <- s / sqrt(n)
Z <- (m - 10) / SE
p.level <- pnorm(Z)
round(p.level, 2)  # 25%

# -> 0.25
# 0.50
# 0.67
# 0.735

## Question 4: Which of the following is the best interpretation of the p-value
## from the previous question?
# -> The probability of obtaining a random sample of 40 college students where the average reaction distance is 9.51 cm or less, if in fact the true average reaction distance of all college students is 10 cm.
# The probability of obtaining a random sample of 40 college students where the average reaction distance is 9.51 cm or greater, if in fact the true average reaction distance of all college students is 10 cm.
# The probability of obtaining a random sample of 40 college students where the average reaction distance is 9.51 cm, if in fact the true average reaction distance of all college students is 10 cm or less.
# The probability that the average reaction distance of all college students is less than 10 cm.
# The probability of obtaining a random sample of 40 college students where the average reaction distance is 9.51 cm or less, if in fact the true average reaction distance of all college students is different than 10 cm.

## Question 5: Answer questions 5 and 6 based on the information below. 
## Spam. It is estimated that roughly 9% of incoming email is spam. A spam
## filter flags 90% of spam emails as spam, and incorrectly flags 2% of non-spam
## emails as spam. 
## What is the probability that a randomly chosen incoming email is flagged as
## spam? Choose the closest answer. 
## Hint: Drawing a probability tree might be helpful.
# Emails can be:
#    - spam -> 9%
#        - flagged -> 90%
#        - non flagged -> 10%
#    - non spam -> 91%
#        - flagged -> 2%
#        - non flagged -> 98%
s.f <- 0.09 * 0.9
s.nf <- 0.09 * 0.1
ns.f <- 0.91 * 0.02
ns.nf <- 0.91 * 0.98
flagged <- s.f + ns.f
# 0.02
# 0.1835
# 0.90
# 0.91
# -> 0.0992

## Question 6: Given that an email is flagged as spam, what is the probability
## that it is indeed a spam email?
# We are looking for p(spam | flagged) =
#                    p(spam & flagged) / p(flagged) =
s.f /flagged
# -> 0.8165
# 0.02
# 0.1835
# 0.0182
# 0.09

## Question 7: Answer questions 7 to 12 based on the information below.
## Calcium for treating blood pressure. A group of researchers conducted an
## experiment to study the effect of a calcium supplement on the blood pressure 
## of African American males. A group of 10 men received a calcium supplement, 
## andanother group of 11 men received a placebo. The experiment lasted 12
## weeks.
## Both before and after the 12-week period, each man had his blood pressure
## measured while at rest. The changes in blood pressure are given in table below,
## i.e. each observation listed is a change in blood pressure between the before
## and after blood pressure measurements. Note that the values are listed in
## increasing order. 
## The median change for the placebo group is -1. What is the median change for
## the calcium group?
calcium <- c(-5, -4, -3, -2, 1, 7, 10, 11, 17, 18)
placebo <- c(-11, -5, -3, -3, -1, -1, -1, 2, 3, 5, 12)
total <- c(calcium, placebo)
median(calcium)
# Mediancalcium = 1
# -> Mediancalcium = 4
# Mediancalcium = 7
# Mediancalcium = −1
# Mediancalcium = 8

## Question 8: We would like to test if the median change in blood pressure is
## different for the calcium and placebo groups. Which of the following are the
## correct set of hypotheses for this test. 
## Hint: This is different than many of the questions you've seen so far, since
## it's about testing for the median (not the mean), but the set up of the
## hypothesis test follows the same structure. To answer this question just
## think about what it means for the two groups to have different medians, and
## accordingly how the null and the alternative hypotheses should be set up.

# H0 : Mediancalcium - Medianplacebo > 0 
# HA : Mediancalcium - Medianplacebo ≠ 0

# -> H0 : Mediancalcium - Medianplacebo = 0 
# -> HA : Mediancalcium - Medianplacebo ≠ 0

# H0 : Mediancalcium - Medianplacebo = 0 
# HA : Mediancalcium - Medianplacebo > 0

# H0 : Mediancalcium - Medianplacebo < 0 
# HA : Mediancalcium - Medianplacebo ≠ 0

# H0 : Mediancalcium - Medianplacebo = 0 
# HA : Mediancalcium - Medianplacebo < 0

## Question 9: What is the point estimate associated with these hypotheses? 
## Hint: The point estimate follows the same structure as the parameter of
## interest stated in the hypotheses, but it is calculated based on the observed
## data.
point.estimate <- median(calcium) - median(placebo)
point.estimate
# 2.5
# 4
# -1
# 0
# -> 5

## Question 10: Since the Central Limit Theorem does not apply to the sampling
distribution of medians, we use a randomization test to evaluate these
hypotheses. 
## To do so, we write the change in blood pressure on 21 index cards. Then,
## we shuffle these cards and split them into two groups: one group of size 10
## representing those receive a calcium supplement, and another group of size 11
## representing those on the placebo. We calculate the difference between the
## medians in the simulated calcium and placebo distributions (as calcium -
## placebo), and record this value. 
## Fill in the blank: We repeat this 100 times to build a randomization
## distribution. This distribution should be centered at ________.
# -1
# 4
# 0
# 2.5
# -> 5  # I believe the random simulation should look like the data

## Question 11: Based on the randomization distribution below, what is the
## p-value? 
## Note that the randomization test used 100 simulations, and the simulated
## differences were calculated as calcium - placebo. Also remember that the we
## are testing for a difference in median change in the calcium and placebo
## groups. 
## Hint: Think about the definition of the p-value. 
# 0.06
# 0
# 0.05
# 0.11
# -> 0.17  # There are 17 points of (median_calcium - median_placebo) that are 5< or -5>, 5 being our point estimate

## Question 12: Refer back to the research question: “Is there a difference in
## median change in blood pressure for the calcium and placebo groups?” What does
## the p-value you calculated in the previous question suggest? Choose one of
## the following, using a 5% significance level.
# Accept H0, there is evidence that the median in the two groups is the same.
# -> Fail to reject H0, there isn’t sufficient evidence of a difference between the two groups.
# Reject H0, there is evidence of a difference between the two groups.

## Question 13: Answer questions 13 and 14 based on the information below. 
## Box plots. The two box plots below display distributions of midterm scores
## for all students in two different sections of a public policy course. Assume
## that both classes have an even number of students, and that none of the
## students within each section had identical scores.
## Which section has a greater percentage of students with scores below 55?
# -> It is impossible to tell. # 55% is between the 75% and 95% lines, but no information is given on how points are distributed within
# Both sections have equal percentages of students with scores below 55.
# Section 2 has a greater percentage of students with scores below 55.
# Section 1 has a greater percentage of students with scores below 55.

## Question 14: Which section has a greater percentage of students with
## scores above 70?
# Section 2 greater percentage of students with scores above 70.
# Section 1 greater percentage of students with scores above 70.
# It is impossible to tell.
# -> Both sections have equal percentage of students with scores above 70. # They have the same median

## Question 15: True / False: You are going to collect income data from a
## right-skewed distribution of incomes of high paid executives. If you take a
## large enough sample, the sample distribution will be nearly normal.
# False, that would be means of samples

################################################################################
## Part 2  -- 12/15 points
################################################################################


## Question 1: A class of introductory statistics students took a 15 item quiz,
## with each item worth 1 point. The standard deviation for the resulting score
## distribution is 0. You know that:
# -> everyone correctly answered the same number of items
# the mean, median, and mode must all be 0
# about half of the scores were above the mean
# an arithmetic error must have been made

## Question 2: A group of researchers want to test the possible effect of an
## epilepsy medication taken by pregnant mothers on the cognitive development of
## their children. As evidence, they want to estimate the IQ scores of
## three-year-old children born to mothers who were on this particular
## medication during pregnancy. Previous studies suggest that the standard
## deviation of IQ scores of three-year-old children is 18 points. At least how
## many such children should the researchers sample at a minimum in order to
## obtain an 80% confidence interval with a margin of error of at most 4 points?
s <- 18  # Standard deviation
ME <- 4  # Margin of error
conf <- 0.80  # Confidence interval
z.star <- qnorm((1-conf)/2)
(z.star * s / ME)^2

# 33
# -> 34
# 78
# 55
# 56

## Question 3: The Washington Post and the New York Times conducted separate
## national polls on the same issue.
## The Washington Post surveyed 500 people and reported a 95% confidence
## interval.
## The New York Times surveyed 150 people and also reported a 95% confidence
## interval.
## Which paper reported a larger margin of error? 
## Assume that all else are equal between the two polls, they are sampling the
## same population on the same issue.
# The Washington Post
# -> The New York Times
# The margin of errors are the same.

## Question 4: In a recent Gallup poll on a random sample of 1,028 US adults,
## 11% said they approve of the way the Congress is handling its job, with a 95%
## confidence interval of 7% to 15% (7%, 15%). 
## Which of the following statements is false based on this confidence interval?
# The sample proportion is 0.11.
# -> 95% of random samples of 1,028 US adults will have sample proportions between 0.07 and 0.15.
# The margin of error is 0.04.
# It is unlikely, but possible, that the population proportion is 0.18.

## Question 5: Fill in the blank: The spread of the sampling distribution for
## the sample mean is mainly determined by the magnitude of the ________. 
## Choose the best option among the provided choices.
# sample mean
# population mean
# confidence level
# population size
# -> sample size

## Question 6: Imagine we were to construct a number of sampling distributions
## of a sample mean, where the only difference between each distribution is the
## sample size used. For each distribution constructed in this way we record the
## standard error and sample size. 
## Fill in the blank: The correlation between these two variables will be ________. 
## Choose the best option among the provided choices.
# zero
# -> negative
# positive
# one

## Question 7: Which of the following is most likely to be true?
# The median of a left skewed distribution has a negative Z score.
# An observation with a Z score of Z = -1.2 is more unusual than an observation with a Z score of Z = +0.5 coming from the same distribution.
# -> Majority of the values in a right skewed distribution have positive Z scores.
# Half the observations in a distribution of any shape have positive Z scores.
# The Z score for the median of a distribution of any shape is 0.

## Question 8: A behavioral economist designing an experiment to evaluate
## people’s decision making patterns wants to make sure that sampled males and
## females are equally represented in the treatment and control groups. Which of
## the following approaches will be most useful?
# -> clustering
# random assignment
# blocking
# blinding
# random sampling

## Question 9: True or False: In a normal distribution, Q1 and Q3 are more than
## one standard deviation away from the mean. 
## Hint: Think about what percentiles Q1 and Q3 correspond to.
# -> True
# False

## Question 10: Suppose half of all newborns are girls and half are boys.
## Hospital A, a large city hospital, records an average of 50 births a day.
## Hospital B, a small, rural hospital, records an average of 10 births a day.
## On a particular day, which hospital is less likely to record 80% or more
## female births?
# Hospital B (with 10 births a day), because with fewer births there will be less variability.
# The two hospitals are equally likely to record such an event, because the probability of a boy does not depend on the number of births.
# -> Hospital A (with 50 births a day), because the more births you see, the closer the proportions will be to 0.5.
# This outcome is not possible at either hospital.

## Question 11: Each of the 120 students in a statistics class selects a
## different random sample of 40 quiz scores from a population of 5000 scores
## they are given. Using their data, each student constructs a 90% confidence
## interval for μ, the average quiz score of the 5000 students. Which of the
## following conclusions is correct?
# About 10% of the individual quiz scores in the samples will not be found in these confidence intervals.
# -> About 90% of the confidence intervals will contain μ.
# About 10% of the sample means will not be included in the confidence intervals.
# 90% of the confidence intervals will be identical.

## Question 12: Colin, a first-year college student, is enrolled in a college
## algebra course and earned a score of 260 on a math achievement test that was
## given out to all first-year students prior to enrollment. The instructor
## looked at two distributions of scores:
## the distribution for all first-year students
## the distribution for the first-year students enrolled in this algebra course
## Both are approximately normally distributed and have the same mean, but the
## distribution for the algebra course has a smaller standard deviation. A Z
## score is calculated for Colin’s test score in both distributions (all
## first-years and the first-years taking this algebra course). Given that
## Colin’s score is well above the mean, which of the following is true about
## these two Z scores?
# SE = sd / sqrt(n)
# SE higher for normal students
# Z = bla bla / SE
# Z lower for normal students
# Z higher for algebra students

# -> The Z score based on the distribution for the first-year students taking algebra would be higher.
# The Z score based on the distribution for all first-year students would be higher.
# The two Z scores would be the same.
# The two Z scores would be different, but we don’t have enough information to tell which Z score would be higher.

## Question 13: Two polling agencies, Gallup and Public Policy Polling, want to
## estimate the proportion of American college students who are in favor of
## same-sex marriage. They both want to have about the same margin of error to
## estimate this proportion. However, Gallup wants to estimate with 99%
## confidence and Public Policy Polling wants to estimate with 95% confidence.
## Which agency would need more students for their survey in order to obtain the
## desired margin of error?
# Both agencies would need the same number of subjects.
# Public Policy Polling.
# It is impossible to obtain the same margin of error with the two different confidence levels.
# -> Gallup.

## Question 14: Answer questions 14 and 15 based on the information below. 
## A June Gallup poll asked US residents about their opinion on sales taxes on
## internet purchases. The results of the poll are summarized in the table
## below. The text of the survey question is also provided above the table. One
## of the values on the table is 73% (marked). Which of the following best
## describes this probability? 
# P(18 to 29 years)
# P(Against and 18 to 29 years)
# -> P(Against | 18 to 29 years)
# P(18 to 29 years | Against)
# P(Against)

## Question 15: Fill in the blank: Based on these results, opinion on sales
## taxes on internet purchases and age appear to be ________.
# complementary
# disjoint
# -> dependent
# independent
# mutually exclusive
