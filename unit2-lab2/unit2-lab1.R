load(url("http://www.openintro.org/stat/data/kobe.RData"))

head(kobe)

kobe$basket[1:9]

## Question 1: What does a streak length of 1 mean, i.e. how many hits and misses are in a streak of 1?
# A hit followed by a miss.

## Question 2: What about a streak length of 0? How many hits and misses are in a streak of 0?
# A miss followed by a miss.

kobe_streak <- calc_streak(kobe$basket)

## Question 3: Which of the following is false about the distribution of Kobe’s streak lengths from the 2009 NBA finals. Hint: You might want to also use other visualizations and summaries of kobe streak in order to answer this question.
# The distribution of Kobe’s streaks is unimodal and left skewed.
barplot(table(kobe_streak))
FALSE

# The typical length of a streak, as measured by the median, is 0.
median(kobe_streak)
# The IQR of the distribution is 1.
summary(kobe_streak)
# WRONG: Streak lengths of 3 and 4 are unusually high compared to the rest of the distribution.
FALSE

## Question 4: True or False: If Kobe has a hot hand (not independent shots), then the probability that he makes his second shot would go up given that he made the first shot: P(shot 2 = H | shot 1 = H) > 0.45
# TRUE

## Question 5: If Kobe’s shooting streaks diverge significantly from an independent shooter’s streaks,
# we can conclude that Kobe likely has a hot hand.

outcomes <- c("heads", "tails")
sample(outcomes, size = 1, replace = TRUE)
sim_fair_coin <- sample(outcomes, size = 100, replace = TRUE)
table(sim_fair_coin)

sim_unfair_coin <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.2, 0.8))
table(sim_unfair_coin)

## Question 6: How many heads would expect to come up after flipping this unfair coin 100 times?
# 20

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 133, replace = TRUE, prob = c(0.45, 0.55))
sim_streak <- calc_streak(sim_basket)
barplot(table(sim_streak))
summary(sim_streak)

## Question 7: If you were to run the simulation of the independent shooter a second time, how would you expect its streak distribution to compare to the distribution from the question above?
# A somewhat similar distribution

## Question 8: How does Kobe Bryant’s distribution of streak lengths (kobe streak) compare to the distribution of streak lengths for the simulated shooter?
# They are fairly similar to each other.

## Question 9: True or False: Since Kobe’s streak length distribution looks very similar to the independent shooter’s simulated steak length distrbution, we can conclude that Kobe Bryant likely does not have a ”hot hand”.
# WRONG: FALSE

