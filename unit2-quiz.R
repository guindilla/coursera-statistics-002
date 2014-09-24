## Question 1: Which of the following explains the phenomenon that while in 10 flips of a fair coin it may not be very surprising to get 8 Heads, it would be very surprising to get 8,000 Heads in 10,000 flips of the coin.
# Law of large numbers

## Question 2: Shown below are four Venn diagrams. In which of the diagrams does the shaded area represent A and B and C?
# 

## Question 3: Each choice below shows a suggested probability distribution for letter grades in a class (Possible grades are A, B, C, or D or lower). Determine which is a proper probability distribution.
# A: 0.30, B: 0.30, C: 0.40, D or lower: 0
# Because they add up to 1 and there is no negative probability

## Question 3: Which of the following is false about probability distributions?
# The outcomes listed must be independent.

## Question 4: Assortative mating is a nonrandom mating pattern where individuals with similar genotypes and/or phenotypes mate with one another more frequently than what would be expected under a random mating pattern. Researchers studying this topic collected data on eye colors of 204 Scandinavian men and their female partners. The table below summarizes the results. For simplicity, assume heterosexual relationships. What is the probability that a randomly chosen couple is comprised of a male and female with blue eyes?
# WRONG: (108+114−78)/204
# Which is couples with male with blue eyes, plus couples with female with blue eyes, minus couples with both having blue eyes (because they are accounted for twice before) 

## Question 4: Assortative mating is a nonrandom mating pattern where individuals with similar genotypes and/or phenotypes mate with one another more frequently than what would be expected under a random mating pattern. Researchers studying this topic collected data on eye colors of 204 Scandinavian men and their female partners. The table below summarizes the results. For simplicity, assume heterosexual relationships. What is the probability that a randomly chosen male respondent with blue eyes has a partner with blue eyes?
# 78/114

## Question 4: Last semester, out of 170 students taking a particular statistics class, 71 students were “majoring” in social sciences and 53 students were majoring in pre-medical studies. There were 6 students who were majoring in both pre-medical studies and social sciences. What is the probability that a randomly chosen student is majoring in social sciences, given that s/he is majoring in pre-medical studies?
# Students can be:
#    - social science -> 71
#        - only -> 65
#        - and pre-medical -> 6
#    - pre-medical -> 53
#        - only -> 47
#        - and social science -> 6
# We are looking for p(both | pre-medical) =
#                    p(both & pre-medical) / p(pre-medical) =
#                    6 / (6+47) = 6/53
# 6/53

## Question 5: Which of the following is false?
# If two events (both with probability greater than 0) are mutually exclusive, they could be independent.
# 2nd round FALSE: Two mutually exclusive outcomes (of the same event) cannot occur at the same time.
# 3rd round: FALSE: Two complementary outcomes (of the same event) cannot occur at the same time.

## Question 6: Heights of 10 year-olds, regardless of gender, closely follow a normal distribution with mean 55 inches and standard deviation 6 inches. Which of the following is true?
# A normal probability plot of heights of a random sample of 500 10 year- olds people should show a fairly straight line.

## Question 6: Suppose IQ scores are normally distributed with mean 100 and standard deviation 10. Which of the following is false?
# FALSE: An IQ score greater than 130 is highly unlikely, but not impossible.

## Question 6: Suppose that scores on a national entrance exam are normally distributed with mean 1000 and standard deviation 100. Which of the following is false?
# We would expect the number of people scoring above 1200 to be more than the number of people scoring below 900.

## Question 7: The National Vaccine Information Center estimates that 90% of Americans have had the disease chickenpox by the time they reach adulthood. What is the probability that exactly 92 out of 100 randomly sampled American adults had chickenpox during childhood?
dbinom(x = 92, size = 100, prob = 0.9)
# 0.114823

## Question 8: About 24% of flights departing from New York’s John F. Kennedy International Airport were delayed in 2009. Assuming that the chance of a flight being delayed has stayed constant at 24%, we are interested in finding the probability of 10 out of the next 100 departing flights being delayed. Noting that if one flight is delayed, the next flight is more likely to be delayed, which of the following statements is correct?
# We cannot calculate this probability using the binomial distribution since whether or not one flight is delayed is not independent of another.

## Question 8: You are about to take a multi-day tour through a national park which is famous for its wildlife. The tour guide tells you that on any given day there’s a 61% chance that a visitor will see at least one “big game” animal, and a 39% chance they’ll see no big game animals; when the tour guide says “big game”, he refers to either a moose or a bear. The guide assures you that big game sightings on a single day are independent of any other day’s sightings. Given the information from the tour guide, which of the following calculations cannot be performed using a binomial distribution?
# Calculate the probability that you see at least 4 big game animals on the first day of a 5-day trip.

## Question 9: Which of the following, on its own, is the least useful method for assessing if the data follow a normal distribution?
# Check if the mean and median are equal.

## Question 10: Which of the following is false? Hint: It might be useful to sketch the distributions.
# The Z score for the median of a left skewed distribution is most likely negative.

## Question 10: Which of the following is true? Hint: It might be useful to sketch the distributions.
# The Z score for the median is approximately 0 if the distribution is bimodal and symmetric.

## Question 11: About 30% of human twins are identical, and the rest are fraternal. Identical twins are necessarily the same sex, half are males and the other half are females. One-quarter of fraternal twins are both male, one-quarter both female, and one-half are mixes: one male, one female. You have just become a parent of twins and are told they are both girls. Given this information, what is the probability that they are identical?
# Twins can be:
#    - identical -> 30%
#        - boys -> 50%
#        - girls -> 50%
#    - different -> 70%
#        - boys -> 25%
#        - girls -> 25%
#        - both -> 50%
# We are looking for p(identical | two girls) =
#                    p(identical & two girls) / p(two girls) =
#                    30%*50% / (30%*50% + 70%*25%)
0.30*0.50 / (0.30*0.50 + 0.70*0.25)
# 0.4615385

## Question 11: More than three-quarters of the nation’s colleges and universities now offer online classes, and about 23% of college graduates have taken a course online. 39% of those who have taken a course online believe that online courses provide the same educational value as one taken in person, a view shared by only 27% of those who have not taken an online course. At a coffee shop you overhear a recent college graduate discussing that she doesn’t believe that online courses provide the same educational value as one taken in person. What’s the probability that she has taken an online course before?
# A college graduate can:
#    - take a course online -> 23%
#        - same value -> 39%
#        - less value -> 61%
#    - not take a course online -> 77%
#        - same value -> 27%
#        - less value -> 73%
# We are looking for p(course online | same value) =
#                    p(course online & same value)) / p(same value) =
#                    23%*39% / (23%*39% + 77%*27%)
0.23*0.39 / (0.23*0.39 + 0.77*0.27)
# FALSE: 0.3014113
# I should have calculated p(course online | NOT same value), which is what was asked
# p(course online | not same value) =
# p(course online & not same value)) / p(not same value) =
# 23%*61% / (23%*61% + 77%*73%)
0.23*0.61 / (0.23*0.61 + 0.77*0.73)
# 0.1997437

## Question 12: One strange phenomenon that sometimes occurs at U.S. airport security gates is that an otherwise law-abiding passenger is caught with a gun in his/her carry-on bag. Usually the passenger claims he/she forgot to remove the handgun from a rarely-used bag before packing it for airline travel. It’s estimated that every day 3,000,000 gun owners fly on domestic U.S. flights. Suppose the probability a gun owner will mistakenly take a gun to the airport is 0.00001. What is the probability that tomorrow more than 35 domestic passengers will accidentally get caught with a gun at the airport? Choose the closest answer.
sum(dbinom(36:3000000, size =3000000, prob = 0.00001))
# 0.1573823
# Alternative method using normal approximation
n <- 3000000
p <- 0.00001
# Let's check we can use normal approximation
n * p >= 10
n * (1-p) >= 10
# Both are true, here we go!
m <- n * p
sd <- sqrt(n * p * (1-p))
# We look for "more", not "at least" 35 passengers! 
1-pnorm(q = 36 - 0.5, mean = m, sd = sd)
# 0.15765
# Result: 0.18

## Question 12: Which of the following probabilities can be calculated using the normal approximation to the binomial distribution?
# A September 2011 Gallup poll suggests that 56% of Americans do not have a great deal of confidence in the mass media to report the news fully, accurately, and fairly. What is the probability that in a random sample of 20 people, 10 or more of them have confidence in the mass media?
n <- 20
p <- 0.56
n * p >= 10
n * (1-p) >= 10

# Roughly 20% of Americans smoke. What is the probability that in a random sample of 40 people at least 5 are smokers?
n <- 40
p <- 0.2
n * p >= 10
n * (1-p) >= 10

# A 2013 Gallup poll reports that 8% of Americans say the situation in Syria is the most important issue affecting the U.S. In a randomly selected group of 75 Americans, what is the probability that more than 10 of them believe the situation in Syria is the most important issue facing the U.S.?
n <- 75
p <- 0.08
n * p >= 10
n * (1-p) >= 10

# A clothing store offers store credit cards and only about 17% of the credit card holders are males. If we were to randomly sample 100 store credit card holders to conduct a survey, what is the probability that at most 20 of the sampled individuals would be males?
n <- 100
p <- 0.17
n * p >= 10
n * (1-p) >= 10
# Answer: This one