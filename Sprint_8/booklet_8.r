library(nnet)
churn = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_8/Data/churn.txt")
n = nrow(churn)
set.seed(42)
train.id = sample(n, size = 0.7*n)
test.id = setdiff(1:n, train.id)
trainingdata=churn[train.id,]
validationdata=churn[test.id,]
churnfactor=factor(train$Churn.)
# mynn=nnet(churnfactor~.,data=train, size=2,maxit=200) #two units in hidden layer

Day.Mins=train$Day.Mins
VMail.Plan=train$VMail.Plan
use_data=data.frame(Day.Mins, VMail.Plan, churnfactor)
mynn=nnet(churnfactor~.,data=use_data, size=2, maxit=200)

# print(summary(mynn))

mynn=nnet(churnfactor~.,data=use_data, size=20, maxit=200)

print(summary(mynn))