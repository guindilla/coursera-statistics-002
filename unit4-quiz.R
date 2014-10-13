## Question 1: People of different ages were asked to stand on a “force
## platform” and maintain a stable upright position. The ``wiggle" of the board
## in the forward-backward direction is recorded; more wiggle corresponds to
## less balance. The participants are divided into two age groups: young and
## elderly. The average wiggle among elderly people was 26.33 mm, and the
## average among young people was 18.125 mm. The bootstrap distribution for the
## difference in means is shown below, based on 100 bootstrap samples. Of the
## following choices, which is the most accurate 90% bootstrap confidence
## interval for the true difference in means?
# (2.5 mm, 18 mm)
# (3 mm, 17 mm)
# -> (3.75 mm, 15 mm)
# (5 mm, 15 mm)

## Question 1: Which of the following is false about bootstrapping?
# Bootstrap distributions that are extremely skewed or have isolated clumps of values may yield unreliable confidence intervals.
# Bootstrap distributions are constructed by sampling with replacement from the original sample, while sampling distributions are constructed by sampling with replacement from the population.
# -> A bootstrap confidence interval constructed based on a biased sample will still yield an unbiased estimate for the population parameter of interest.
# The endpoints of a 95% bootstrap confidence interval are the cutoff values for the top and bottom 2.5% of the bootstrap distribution.

## Question 1: Consider the width of two bootstrap confidence intervals
## constructed based on the same sample. One of the intervals is constructed at
## a 90% confidence level and the other is constructed at a 95% confidence
## level. Which of the following is true?
# -> The 95% interval is wider.
# There is not enough information to determine which interval is wider.
# The intervals are the same size.
# The 90% interval is wider.

## Question 2: Which of the following is false regarding paired data?
# -> Each observation in one data set is subtracted from the average of the other data set's observations.
# In a paired analysis we first subtract the paired observations from each other, and then do inference on the differences.
# Each observation in one data set has a natural correspondence with exactly one observation from the other data set.
# Two data sets of different sizes cannot be analyzed as paired data.

## Question 3: Which of the following is false about bootstrap and sampling
## distributions?
# Both distributions are comprised of sample statistics.
# -> Bootstrap distributions are centered at the population parameter, sampling distributions are centered at the sample statistic.
# WRONG as for both distributions SE = sd / sqrt(n) -> Both distributions get narrower as the standard deviation decreases.
# The bootstrap distribution is created by sampling with replacement from the original sample.
# Bootstrap distributions are centered at the sample statistic, sampling distributions are centered at the population parameter.

## Question 3: The distribution of duration of unemployment for all 18-24
## year-old Americans is nearly normal with mean 12.7 weeks and standard
## deviation 0.3 weeks. Suppose we randomly sample 20 people from this
## population, ask them about the duration of their unemployment (in number of
## weeks), and record the sample mean. We repeat this 5,000 times, and build a a
## distribution of sample means. What is the name of this distribution?
# randomization distribution
# population distribution
# -> sampling distribution
# bootstrap distribution
# sample distribution

## Question 4: You've just read a study that investigated the difference in
## brain sizes between EU and US citizens, based on data from random samples
## from both populations. At the 5% significance level the study failed to
## reject the null hypothesis that EU and US citizens have (on average) brains
## of equal size. Which of the following is true regarding a 99% confidence
## interval for the difference in brain sizes?
# The interval does not contain 0.
# -> The interval contains 0.
# Since the data come from samples and not populations, no conclusions can be made.
# Without more information, it is impossible to know whether the interval contains 0.

## Question 4: Your friend, who took statistics a few years ago, recently read a
## study which examined whether there is any difference between the average
## birth weights of babies born to smoking mothers vs. non-smoking mothers. Your
## friend asked you to remind him what it means when the study says ``a 95%
## confidence interval for the difference between the average birth weight from
## non-smoking mothers and smoking mothers (μnon−μsmoke) is 0.2 to 0.9 pounds."
## Of the following possible responses to your friend's question, which is true
## according to the study?
# -> The study's authors are 95% confident that babies born to non-smoking mothers are on average 0.2 to 0.9 pounds heavier than babies born to smoking mothers.
# The study's authors are 95% confident that babies born to non-smoking mothers are on average 0.2 to 0.9 pounds lighter than babies born to smoking mothers.
# The study data does not provide convincing evidence (at 5% significance level) of a difference between the average birth weight from smoking mothers and non-smoking mothers.
# The study data does not provide convincing evidence (at 10% significance level) of a difference between the average birth weight from smoking mothers and non-smoking mothers.

## Question 4: Researchers studying IQ scores of mothers and fathers of
## ``gifted" children collected data from 36 gifted children and their parents.
## First, differences in IQ scores of the father and the mother were calculated
## for each child (calculated as father's IQ score - mother's IQ score). The dot
## plot below shows the bootstrap distribution of means of 200 bootstrap samples
## taken from this original sample of differences in IQ scores. The mean of the
## bootstrap distribution is approximately -3.48 points and the bootstrap
## standard error is 1.3 points. Assume the usual conditions for constructing a
## bootstrap confidence interval are satisfied. Which of the following
## statements is false?
n <- 200
m <- -3.48
s <- 1.3

# -> Since 0 is apparently an unusual value for the statistic, then at the 5% significance level we would fail to reject a null hypothesis of that claims that the fathers' and mothers' average IQs are equal.
T.value <- (-3.48- 0)/s
2*pnorm(T.value) < 0.05
# A 90% bootstrap confidence interval for the difference in IQ scores would is approximately (-5.6, -1.3).
Z90 <- abs(qnorm(0.05))
m + c(-1, 1) * Z90 * s
# A 95% bootstrap confidence interval for the difference in IQ scores is approximately (-6, -0.9).
Z95 <- abs(qnorm(0.025))
m + c(-1, 1) * Z95 * s
# It's likely that in the original sample, most mothers had higher IQ scores than the fathers.

## Question 5: When doing inference on a single mean with a small sample size,
## which of the following is the correct justification for using the
## t-distribution rather than the normal distribution?
# -> Because the standard error estimate may not be accurate.
# Because data from small samples aren't normally distributed.
# Because the t-distribution is not symmetric.
# All of the above.
# None of the above.

## Question 5: An insurance company wants to estimate (using a confidence
## interval) its average claim amount using data from 20 randomly selected
## claims. Which of the following is false?
# The critical t-score, t⋆, has 19 degrees of freedom.
# A confidence interval based on this sample is not accurate since the sample size is less than 30.
# If the distribution of the sampled claim amounts is not extremely skewed, a T interval is appropriate.
# The confidence interval can also be calculated using bootstrapping.

## Question 6: The figure below shows three unimodal and symmetric curves, which
## assignment is most plausible?

# solid: tdf=5
# dashed: tdf=1
# dotted: normal

# WRONG -> solid: normal
# WRONG -> dashed: tdf=1
# WRONG -> dotted: tdf=5

# solid: tdf=1
# dashed: tdf=5
# dotted: normal

# solid: normal
# dashed: tdf=5
# dotted: tdf=1

## Question 6: The figure below shows three t-distribution curves. Which curve
## has the highest degree of freedom? 
# -> solid
# dashed
# dotted

## Question 6: How does the shape of the t-distribution change as the sample
## size increases?
# It becomes flatter
# -> It becomes more normal looking
# It becomes skewed
# It becomes wider

## Question 7: My friend, Tom, believes that his supermarket s prices are lower
## than mine, and sets an alternative hypothesis test reflecting this. We
## construct a list of 10 identical items and purchase them at our respective
## stores. Tom wants to know if these data support his hypothesis. Which of the
## following is the correct description of Tom's situation?
# Tom has a two-sided alternative hypothesis and should do a paired t-test.
# Tom has a two-sided alternative hypothesis and should do an independent samples t-test.
# -> Tom has a one-sided alternative hypothesis and should do a paired t-test.
# Tom has a one-sided alternative hypothesis and should do an independent samples t-test.

## Question 7: Air quality measurements were collected in a random sample of 25
## country capitals in 2013, and then again in the same cities in 2014. We would
## like to use these data to compare average air quality between the two years.
## Which of the following tests is the most appropriate?
# paired t-test with one-sided alternative hypothesis
# -> paired t-test with two-sided alternative hypothesis
## We're looking for a difference between the two years' averages, and the data
## are collected in the same cities in both years.
## This question refers to the following learning objective(s): Define
## observations as paired if each observation in one dataset has a special
## correspondence or connection with exactly one observation in the other data
## set.
# WRONG-> independent samples t-test with two-sided alternative hypothesis
# independent samples t-test with one-sided alternative hypothesis

## Question 8:We are testing the following hypotheses: 
## H0 : μ1 = μ2
## H0 : μ1 ≠ μ2
## The sample sizes are n1 = 20 and n2 = 40. Your friend who is working on this
## hypothesis test calculates a Z statistic, Z = 2.5. Which of the following is
## true?
# p-value is approximately 0.006.
# p-value is approximately 0.012.
# -> She should be using a T statistic instead of a Z statistic.
# She should be using an F statistic instead of a Z statistic.

## Question 8: We are testing the following hypotheses: 
## H0 : μ = 3
## HA : μ < 3
## The sample size is 18. The test statistic is calculated as T = 0.5. What is
## the p-value?
n <- 18
df <- n - 1
pt(0.5, df = df, lower.tail = FALSE)
# -> greater than 0.2
# less than 0.1
# greater than 0.1
# between 0.05 and 0.1

## Question 8: We are testing the following hypotheses: 
## H0 : μ = 0.5
## HA : μ ≠ 0.5
## The sample size is 26. The test statistic is calculated as T = 2.485. What is
## the p-value?
n <- 26
df <- n - 1
pt(2.485, df = df, lower.tail = FALSE)
# between 0.005 and 0.01
# -> between 0.01 and 0.025
# between 0.02 and 0.05
# between 0.01 and 0.02

## Question 9: When doing an ANOVA, you observe large differences in means
## between groups. Within the ANOVA framework this would most likely be
## interpreted as:
# -> Evidence strongly favoring the alternative hypothesis.
# Evidence strongly favoring the null hypothesis.
# Evidence revealing which group mean is different from the others.
# WRONG This question refers to the following learning objective(s): Define analysis of variance (ANOVA) as a statistical inference method that is used to determine - by simultaneously considering many groups at once - if the variability in the sample means is so large that it seems unlikely to be from chance alone.
# -> None of the above

## Question 9: What does ANOVA mean?
# An outlier variance analysis
# Analysis of non-varying means
# -> Analysis of variance
# Aardvarks not over vanilla ants

## Question 10: Which of the following is most useful for checking the equal
## variance across groups condition for ANOVA?
# Histograms suggesting nearly normal distributions of data in each group.
# Summary statistics suggesting that the means of each group are roughly equal.
# Summary statistics suggesting roughly equal ranges for each group.
# -> Side-by-side box plots showing roughly equally sized boxes for each group.

## Question 10: Which of the following is not a condition required for comparing
## means across multiple groups using ANOVA?
# The data within each group should be nearly normal.
# -> The means of each group should be roughly equal.
# The observations should be independent within and across groups.
# The variability across the groups should be about equal.

## Question 11: Which of the following looks most like an F distribution?

## Question 11: A study compared five different methods for teaching descriptive
## statistics. The five methods were traditional lecture and discussion,
## programmed textbook instruction, programmed text with lectures, computer
## instruction, and computer instruction with lectures. 45 students were
## randomly assigned, 9 to each method. After completing the course, students
## took a 1-hour exam.
## Which of the following is the correct degrees of freedom for an F-test for
## evaluating if the average test scores are different for the different
## teaching methods?
# dfG=40,dfE=4
# -> dfG=4,dfE=40
# dfG=45,dfE=4
# dfG=4,dfE=44
# dfG=5,dfE=45

## Question 12: A study compared five different methods for teaching descriptive
## statistics. The five methods were traditional lecture and discussion,
## programmed textbook instruction, programmed text with lectures, computer
## instruction, and computer instruction with lectures. 45 students were
## randomly assigned, 9 to each method. After completing the course, students
## took a 1-hour exam. We are interested in finding out if the average test
## scores are different for the different teaching methods. Which of the
## following is the appropriate set of hypotheses?

# H0:σbetween≠σwithin 
# HA:μbetween≠μwithin

# -> H0:μ1=μ2=μ3=μ4=μ5 
# -> HA: at least one μi is different

# H0:sbetween=swithin 
# HA:sbetween≠swithin

# H0:μ1=μ2=μ3=μ4=μ5 
# HA:μ1≠μ1≠μ2≠μ3≠μ4≠μ5

# H0:μbetween≠μwithin 
# HA:σbetween≠σwithin

## Question 12: A study compared five different methods for teaching descriptive
## statistics. The five methods were traditional lecture and discussion,
## programmed textbook instruction, programmed text with lectures computer
## instruction, and computer instruction with lectures. 45 students were
## randomly assigned, 9 to each method. After completing the course, students
## took a 1-hour exam. We are interested in finding out if the average test
## scores are different for the different teaching methods.
## The p-value of the test is 0.0168. What is the conclusion of the test?
# At most two group means are significantly different from each other.
# -> At least two group means are significantly different from each other.
# All five group means are equal to each other.
# Only two group means are significantly different from each other.
# All five group means are significantly different from each other.

## Question 13: For given values of the sample mean and the sample standard
## deviation when n = 25, you conduct a hypothesis test and obtain a p-value of
## 0.0667, which leads to non-rejection of the null hypothesis. What will happen
## to the p-value if the sample size increases (and all else stays the same)?
# Stay the same
# May either increase or decrease
# Increase
# -> Decrease

## Question 13: Researchers studying people’s sense of smell devised a measure
## of smelling ability. A higher score on this scale means the subject can smell
## better. A random sample of 36 people (18 male and 18 female) were involved in
## the study. The average score for the males was 10 with a standard deviation
## of 3.4 and the average score for the females was 11 with a standard deviation
## of 2.7. Which of the following is the correct standard error for the test
## evaluating whether the males and females have differing smelling abilities,
## on average? Choose the closest answer.
n <- 18
s_male <- 3.4
s_female <- 2.7
SE <- sqrt(s_male^2/n +s_female^2/n)
SE
# -> 1.023
# 0.801
# 0.724
# 1.047
# 3.504

## Question 14: A study compared five different methods for teaching descriptive
## statistics. The five methods were traditional lecture and discussion,
## programmed textbook instruction, programmed text with lectures, computer
## instruction, and computer instruction with lectures. 45 students were
## randomly assigned, 9 to each method. After completing the course, students
## took a 1-hour exam. We are interested in finding out if the average test
## scores are different for the different teaching methods.
## If the original significance level for the ANOVA was 0.05, what should be the
## adjusted significance level for the pairwise tests to compare all pairs of
## means to each other?
#  α∗ = α/ K; K = k*(k-1)/2
K <- 5*(5-1)/2
alpha <- 0.05/K
alpha
# -> 0.005
# 0.5
# 0.01
# 0.25
# 0.05

## Question 14: A study compared five different methods for teaching descriptive
## statistics. The five methods were traditional lecture and discussion,
## programmed textbook instruction, programmed text with lectures computer
## instruction, and computer instruction with lectures. 45 students were
## randomly assigned, 9 to each method. After completing the course, students
## took a 1-hour exam. We are interested in finding out if the average test
## scores are different for the different teaching methods.
## How many pairwise tests would we need to do in order to compare all pairs of
## means to each other?
# 3
# -> 10
# 20
# 4
# 5