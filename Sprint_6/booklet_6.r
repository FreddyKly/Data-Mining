ff = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_3/Data/disease.txt")
# plot(ff)
mymodel = glm(Disease ~ Age, data = ff, family = binomial()) # logistic Regression model
print(summary(mymodel)) #Null deviance is only intercept, and residual is with predictor. Lower is better

## Number 2
churn=read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_6/Data/churn.txt")
print(names(churn))
churn_true_to_one = factor(churn$Churn.) # Turn TRUE = 1 and FALSE = 0
logModel = glm(churn_true_to_one ~ VMail.Plan, data = churn, family = binomial()) # logit(p) = -1.605 + -0.747*x
print(summary(logModel))
p_chrun_0 = (exp(-1.605 + -0.747*0)/1+exp(-1.605 + -0.747*0)) # Probability of churn if no VMail.Plan (x=0)
p_chrun_1 = (exp(-1.605 + -0.747*1)/1+exp(-1.605 + -0.747*1)) # Probability of churn if VMail.Plan (x=1)
print(p_chrun_0/p_chrun_1) # Odds-Ratio


attach(churn)
mymodel = glm(churn_true_to_one ~ Day.Mins+Eve.Mins+Night.Mins+Intl.Mins+Int.l.Plan+VMail.Plan+CustServ.Calls, family = binomial()) #multiple logistic regression
print(summary(mymodel))
