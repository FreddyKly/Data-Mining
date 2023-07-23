library(nnet)
library(randomForest)

churn = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_8/Data/churn.txt")
n = nrow(churn)
set.seed(42)
train.id = sample(n, size = 0.7*n)
test.id = setdiff(1:n, train.id)
trainingdata=churn[train.id,]
validationdata=churn[test.id,]
churnfactor=factor(train$Churn.)#
train = trainingdata[, -4]
test = validationdata[, -4]

churnfactor= factor(train$Churn.)
churnfactor2=factor(test$Churn.)
test2=data.frame(test, churnfactor2)

rf2 =randomForest(churnfactor ~ .,data=train, method="class") #random forrest

pred3=predict(rf2, test2, type="class")
print(table(pred3, test2[,"churnfactor2"]))
