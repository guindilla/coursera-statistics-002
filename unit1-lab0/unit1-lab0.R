source("http://www.openintro.org/stat/data/present.R")

## Question 1: How many variables are included in this data set?
dim(present)

## Question 2: What command would you use to view just the counts of girls born?
present$girls

## Question 3: Is there an apparent trend in the number of girls born over the
## years? How would you describe it?
plot(present$year, present$girls)
# There is initially an increase in the number of girls born, which peaks around
# 1960. After 1960 there is a decrease in the number of girls born, but the
# number begins to increase again in the early 1970s. Overall the trend is an
# increase in the number of girls born in the US since the 1940s.

## Question 4: In what year did we see the most total number of births in the
## U.S.? Hint: You can refer to the help files or the R reference card
## (http://cran.r-project.org/doc/contrib/ Short-refcard.pdf) to find helpful
## commands.
present$births <- present$girls+present$boys
present[present$births == max(present$births), ]$year
# 1961

## Question 5: Now, make a plot of the proportion of boys over time, and based on the plot
## determine if the following statement is true or false: The proportion of boys
## born in the US has decreased over time.
plot(present$year, present$boys/present$births)
# True

## Question 6: Which of the following is true?
plot(present$year, present$boys/present$births-0.5)
# Alternative answer
present$boys > present$girls
# Every year there are more boys born than girls.

## Question 7: Make a plot that displays the boy-to-girl ratio for every year in the data
## set. What do you see?
plot(present$year, present$boys/present$girls)
# There is initially a decrease in the boy-to-girl ratio, and then an increase
# between 1960 and 1970, followed by a decrease.

# Question 8: Calculate absolute differences between number of boys and girls
# born in each year, and determine which year out of the present data had the
# biggest absolute difference in the number of girls and number of boys born?
present$abs <- abs(present$girls-present$boys)
present[present$abs == max(present$abs), ]$year
# 1963

