################################################################################
## Lab 3A
################################################################################

load(url("http://www.openintro.org/stat/data/ames.RData"))
area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
hist(area)
## Question 1: Which of the following is false?
# The distribution of areas of houses in Ames is unimodal and right-skewed.
# -> 50% of houses in Ames are smaller than 1,500 square feet.
# The middle 50% of the houses range between approximately 1,130 square feet and 1,740 square feet.
# The IQR is approximately 610 square feet.
# The smallest house is 334 square feet and the largest is 5,642 square feet.

samp0 <- sample(area, 50)
samp1 <- sample(area, 50)

summary(samp0)
hist(samp0, breaks = 10)
mean(samp0)

summary(samp1)
hist(samp1, breaks = 10)
mean(samp1)

## Question 2:Suppose we took two more samples, one of size 100 and one of size 1000. Which would you think would provide a more accurate estimate of the population mean?
# Sample size of 50
# Sample size of 100
# -> Sample size of 1000

# Sampling distribution
sample_means50 <- rep(NA, 5000)
for (i in 1:5000) {
    samp <- sample(area, 50)
    sample_means50[i] <- mean(samp)
}
# This results in a distribution similar to Normal centered around 1500
hist(sample_means50, breaks = 25)

sample_means_small <- rep(NA, 100)
for (i in 1:100) {
    samp <- sample(area, 50)
    sample_means_small[i] <- mean(samp)
}
sample_means_small

## Question 3: How many elements are there in this object called sample_means_small?
# 0
# 30
# 50
# -> 100
# 5,000

## Question 4:Which of the following is true about the elements in the sampling distributions you created?
# -> Each element represents a mean square footage from a simple random sample of 50 houses.
# Each element represents the square footage of a house.
# Each element represents the true population mean of square footage of houses.

hist(sample_means50)

sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)
for (i in 1:5000) {
    samp <- sample(area, 10)
    sample_means10[i] <- mean(samp)
    samp <- sample(area, 100)
    sample_means100[i] <- mean(samp)
}

par(mfrow = c(3, 1))
xlimits = range(sample_means10)
hist(sample_means10, breaks = 20, xlim = xlimits)
hist(sample_means50, breaks = 20, xlim = xlimits)
hist(sample_means100, breaks = 20, xlim = xlimits)

## Question 5:It makes intuitive sense that as the sample size increases, the center of the sampling distribution becomes a more reliable estimate for the true population mean. Also as the sample size increases, the variability of the sampling distribution ___________.
# -> decreases
# increases
# stays the same

# Same exercise for price
sample_means50 <- rep(NA, 5000)
sample_means150 <- rep(NA, 5000)
for (i in 1:5000) {
    samp <- sample(price, 50)
    sample_means50[i] <- mean(samp)
    samp <- sample(price, 150)
    sample_means150[i] <- mean(samp)
}

par(mfrow = c(2, 1))
xlimits = range(sample_means50)
hist(sample_means50, breaks = 20, xlim = xlimits)
hist(sample_means150, breaks = 20, xlim = xlimits)

## Question 6:Which of the following is false?
# -> The variability of the sampling distribution with the smaller sample size (sample_means50) is smaller than the variability of the sampling distribution with the larger sample size (sample_means150).
# The means for the two sampling distributions are roughly similar.
# Both sampling distributions are symmetric.

################################################################################
## Lab 3B
################################################################################

load(url("http://www.openintro.org/stat/data/ames.RData"))

population <- ames$Gr.Liv.Area
samp <- sample(population, 60)

par(mfrow = c(1, 1))
hist(samp, breaks = 25)

## Question 1: My distribution should be similar to others’ distributions who also collect random samples from this population, but it is likely not exactly the same since it’s a random sample.
# -> True
# False

sample_mean <- mean(samp)  # Point estimate of the mean

se <- sd(samp)/sqrt(60)
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)

## Question 2: For the confidence interval to be valid, the sample mean must be normally distributed and have standard error sn√. Which of the following is not a condition needed for this to be true?
# The sample is random.
# The sample size, 60, is less than 10% of all houses.
# -> The sample distribution must be nearly normal.

## Question 3: What does “95% confidence” mean?
# WRONG -> 95% of the time the true average area of houses in Ames, Iowa, will be in this interval.
# -> 95% of random samples of size 60 will yield confidence intervals that contain the true average area of houses in Ames, Iowa.
# 95% of the houses in Ames have an area in this interval.
# WRONG -> 95% confident that the sample mean is in this interval.

mean(population)

## Question 4: What proportion of 95% confidence intervals would you expect to capture the true population mean?
# 1%
# 5%
# 90%
# -> 95%

samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60

for(i in 1:50){
    samp <- sample(population, n) # obtain a sample of size n = 60 from the population
    samp_mean[i] <- mean(samp) # save sample mean in ith element of samp_mean
    samp_sd[i] <- sd(samp) # save sample sd in ith element of samp_sd
}

lower <- samp_mean - 1.96 * samp_sd/sqrt(n)
upper <- samp_mean + 1.96 * samp_sd/sqrt(n)

c(lower[1], upper[1])

plot_ci(lower, upper, mean(population))

## Question 5: What is the appropriate critical value for a 99% confidence level?
# 0.01
# 0.99
# 1.96
# 2.33
# -> 2.58
qnorm((1-0.99)/2)  # The space considered is within the two extremes of N dist.

## Question 6: We would expect 99% of the intervals to contain the true population mean.
# -> True
# False
