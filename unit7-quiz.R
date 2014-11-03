## Question 1: We modeled the prices of 93 cars (in $1,000s) using its city MPG
## (miles per gallon) and its manufacturing site (foreign or domestic). The
## regression output is provided below. Note that domestic is the reference
## level for manufacturing site. Data are outdated so the prices may seem low.
## Which of the following is the degrees of freedom associated with the p-value
## for city MPG?
# 92
# -> 90
# WRONG -> 1 # It is n - k - 1 = 93 - 2 - 1 = 90
# 91

## Question 2: A random sample of 200 women who were at least 21 years old, of
## Pima Indian heritage and living near Phoenix, Arizona, were tested for
## diabetes according to World Health Organization criteria. The model below is
## used for predicting their plasma glucose concentration based on their
## diastolic blood pressure (bp, in mmHg), age (age, in years), and whether or
## not they are diabetic (type, Yes and No). What is the predicted blood glucose
## level of a 30 year old woman who has a diastolic blood pressure of 72 mmHg
## and is not diabetic?
76+72*0.35+30*0.43+26.57*0
# 140.67
# -> 114.1
# 117.46
# 38.1

## Question 3: Body fat percentage can be complicated to estimate, while
## variables such as Age, Height, Weight, and measurements of various body parts
## are easy to measure. Based on data1 on body fat percentage and other various
## measurements, a linear regression model was developed to predict body fat
## percentage, based on easy to obtain measurements. The model output is shown
## below.
## Based on this output, what is the correct interpretation of the coefficient
## for wrist?
# For every 1 inch decrease in wrist circumference, we’d expect a decrease in body fat percentage of about (13.57+1.14)%, on average.
# For every 1 inch increase in wrist circumference, we would expect body fat percentage to be lower by 1.14%, on average.
# For every 1 inch decrease in wrist circumference, we’d expect a decrease in body fat percentage of 1.14%, on average.
# WRONG -> For every 1 inch increase in wrist circumference, we’d expect a decrease in body fat percentage of about 1.14% plus or minus 1.96∗0.47%, on average.
## It’s incorrect to involve the standard error in this statement.

## Question 3: We modeled the gas mileage of 398 cars built in the 1970’s and early 1980’s
## using engine displacement (in cubic inches), year of manufacture in relation
## to 1970 (e.g. 4 means the car was built in 1974; 12 means built in 1982,
## etc.), and manufacturing site (domestic to the USA = 0; foreign to the USA =
## 1). The regression output is provided below. Note that domestic is the
## reference level for manufacturing site.
## Which of the following is the best interpretation of the slope of year?
# -> All else held constant, the model predicts that later model cars will get an average of 0.72 additional miles per gallon for each year difference in the date of manufacture.
# When a particular car is manufactured again in the following year, its gas mileage will improve by 0.72 miles per gallon.
# All else held constant, the model predicts that as the date of manufacture increases by 1 year, gas mileage changes 2.21 times as fast for foreign cars as it does for domestic cars.
# All else held constant, the model predicts that later model cars will get an average of 12.48 additional miles per gallon for each year difference in the date of manufacture.

## Question 3: We modeled the prices of 93 cars (in $1,000s) using its city MPG
## (miles per gallon) and its manufacturing site (foreign or domestic). The
## regression output is provided below. Note that domestic is the reference
## level for manufacturing site. Data are outdated so the prices may seem low.
## Which of the following is the best interpretation of the slope of
## manufacturing site?
# All else held constant, the model predicts that foreign made cars cost $1,140 less than domestic cars, on average.
# Manufacturing site can add up to $42,560 to the price of the car.
# All else held constant, the model predicts that domestic cars cost $5,260 more than foreign cars, on average.
# -> All else held constant, the model predicts that foreign made cars cost $5,260 more than domestic cars, on average.
# As a car goes from being domestic to foreign its price increases by $5,260.

## Question 4: We modeled the gas mileage of 398 cars built in the 1970’s and
## early 1980’s using engine displacement (in cubic inches), year of manufacture
## in relation to 1970 (e.g. 4 means the car was built in 1974; 12 means built
## in 1982, etc.), and manufacturing site (domestic to the USA = 0; foreign to
## the USA = 1). The regression output is provided below. Note that domestic is
## the reference level for manufacturing site.
## Which of the following is false?
# -> The 95% confidence interval for the slope of the displacement coefficient can be calculated as −0.04±(1.96∗−16.42).
# Given the engine displacement and manufacturing site, year of manufacture is a significant predictor of gas mileage.
# If we add another variable to the model, for example the price of the car, the p-values associated with year of manufacture, site of manufacture, and engine displacement may change.
# Given information on the manufacturing site of the car and the year of manufacture, engine displacement is a significant predictor of gas mileage.

## Question 4: A random sample of 200 women who were at least 21 years old, of
## Pima Indian heritage and living near Phoenix, Arizona, were tested for
## diabetes according to World Health Organization criteria. The model below is
## used for predicting their plasma glucose concentration based on their
## diastolic blood pressure (bp, in mmHg), age (age, in years), and whether or
## not they are diabetic (type, Yes and No). Which of the following is false?
# The model as a whole is significant, even though one of the variables (blood pressure) may not be.
# The predicted difference in blood glucose levels of two 25 year old females who don’t have diabetes one of whom has a blood pressure of 70mmHg and the other 75 mmHG is 0.35∗5=1.75.
# -> The model predicts that women without diabetes have blood glucose levels that are on average 26.57 higher than those who have diabetes, given that they are similar in terms of their blood pressure and age.
# The model explains 28% of variability in blood glucose levels of these women.

## Question 5: Researchers investigating academic performance of high school
## students examined data from 2011 from all 50 states and DC (n=51). The data
## included information on
## • SAT math (response variable) - average SAT math score of all students in
## the state who took the exam
## • per_ppl_sp - average number of dollars per pupil spent on education by the
## state
## • perc_take - percentage of high school seniors in the state that took the
## exam
## The output of the model fit by one of theresearchers is shown below: 
## What proportion of the variability in the response variable is explained by
## the model? Choose the closest answer.
(7003 + 57737) / (7003 + 57737 + 22790)
# 66%
# -> 74%
# 31%
# 8%

## Question 5: R2 will never decrease when a predictor is added to a linear
## model.
# False
# -> True

## Question 6: The data in this question come from the Second International
## Mathematics Study on 8th graders from randomly sampled classrooms in the US
## who completed mathematics achievement tests at the beginning and at the end
## of the academic year. Students also answered questions regarding their
## attitudes toward mathematics. The linear model output below is for predicting
## the gain score in this test (posttest - pretest score) using the following
## explanatory variables:
## • pretest: score on the exam taken at the beginning of the semester
## • gender: male or female
## • more_ed: expected number of years for continued education (up to 2 years, 2
## to 5 years, 5 to 6 years, 8 or more years)
## • useful: Math is useful in everyday life (strongly disagree, disagree,
## undecided, agree, strongly agree)
## • ethnic: ethnicity of student (African American, Anglo, Other)
## In model selection using backwards elimination based on p-values, which of
## the following variables would be dropped first?
# ethnic
# pre-test
# more ed
# -> gender
# useful

## Questions 6: Consider the following output from a multiple linear regression
## model with 10 predictors.
## If you were doing backwards selection on this model using p-value as the
## criterion, which of the following would be an acceptable next step?
# Remove one of the variables “re subj” or “attach” because they both have the lowest p-values.
# Remove the variables “password” and “dollar” because their high p-values indicate collinearity with other variables.
# -> Remove the variable “dollar” because it has the highest p-value.
# Remove any one of the variables with a high p-value which as long as removing the variable does not cause the adjusted R2 to decrease in the re-fitted model.

## Question 7: Which of the following is false about conditions for multiple
## linear regression?
# -> With multiple predictors in the model, it’s not necessary for each of the numerical explanatory variables to have a linear relationship with the response variable.
# It is ideal for there to be no strong relationships between any of the explanatory variables.
# The residuals plot should show constant variability of residuals around 0.
# When the residuals are plotted in a histogram, they should appear normally distributed around 0.

## Question 7: Which of the following is false about conditions for multiple
## linear regression?
# Residuals should be normally distributed around 0.
# Explanatory variables should have linear relationship with the response variable.
# Residuals should have constant variance.
# -> Explanatory variables should have strong relationships with each other.

## Question 8: Which of the following is the best definition of a parsimonious
## model?
# The model with the most number of predictors.
# The model with the least number of predictors.
# -> The simplest model with the highest predictive power.
# The model with the highest R2.

## Question 9: A high correlation between two explanatory variables such that
## the two variables contribute redundant information to the model is known as
# -> collinearity
# adjusted R2
# multiple correlation
# multiple interaction
# heteroscedasticity

## Question 10: A model selection method where we start with an empty model and
## add variables one at a time until no other important variables are found is
## called
# -> forward selection
# bootstrapping
# backwards elimination
# randomization
# ANOVA

## Suppose you have performed forward selection using adjusted R2 as the
## criterion and have chosen a model with 6 predictors. Based on your studies of
## model selection, which of the following is most likely to be true?
# The model you’ve arrived at is the most parsimonious model.
# If any of your 6 predictors is not significant in the model, given the other predictors, then your slope coefficients will be biased.
# All 6 predictors will be significant in the model.
# -> Your final model has a higher adjusted R2 than any of the smaller models you tried.