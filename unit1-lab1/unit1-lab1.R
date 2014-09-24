source("http://www.openintro.org/stat/data/cdc.R")

## Question 1: How many cases and how many variables are there in this data set?
dim(cdc)
# 20,000 cases; 9 variables

## Question 2: What type of variable is genhlth?
str(cdc$genhlth)
summary(cdc$genhlth)
# categorical, ordinal

## Question 3: What type of variable is weight?
str(cdc$weight)
summary(cdc$weight)
# numerical, continuous

## Question 4: What type of variable is smoke100?
str(cdc$smoke100)
summary(cdc$smoke100)
# categorical (not ordinal)

## Question 5: Create a numerical summary for gender. How many males are in the
## sample?
summary(cdc$gender)
# 9569

## Question 6: Compute the relative frequency distribution of genhlth. What
## proportion of the sample reports being in excellent health? Choose the
## closest answer.
table(cdc$genhlth)["excellent"] / sum(table(cdc$genhlth))
# 0.23

## Question 7: What does the mosaic plot reveal about smoking habits and gender?
mosaicplot(table(cdc$smoke100, cdc$gender))
# The mosaic plot shows that males are more likely to smoke than females.

## Question 8: How many observations are in the subset under23 and smoke that
## you created in the previous exercise, i.e. how many people in the sample are
## under the age of 23 and have smoked at least 100 cigarettes in their
## lifetime?
under23_and_smoke <- cdc[cdc$age < 23 & cdc$smoke100 == 1, ]
dim(under23_and_smoke)
# 620

## Question 9: Which of the following is false based on the box plot of BMI vs.
## general health?
cdc$BMI <- cdc$weight / cdc$height^2 * 703
boxplot(cdc$BMI ~ cdc$genhlth)
# The distributions of BMIs within each health status group is left skewed.

## Question 10: Based on the plot you made in the previous exercise, which of
## the following is true about the relationship between weight and desired
## weight?
plot(cdc$weight, cdc$wtdesire)
# WRONG: moderately weak positive linear association
# moderately strong positive linear association