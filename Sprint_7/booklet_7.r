library(rpart)
library(rpart.plot)
data(iris)

n = nrow(iris)
set.seed(42)
train.id = sample(n, size = 2/3*n)
test.id = setdiff(1:n, train.id)
trainingdata=iris[train.id,]
validationdata=iris[test.id,]
tree1 = rpart(Species ~ .,data=iris, method="class", subset=train.id)
rpart.plot(tree1) # Plot descision tree
print(summary(trainingdata))
pred=predict(traintree, iris[-train.id,], type="class") # predict the iris dataset without the training samples (only test-set), with the traintree
print(table(pred, iris[-train.id, "Species"]))
print(rpart.control()) # Hyperparameters

### Number 2
churn=read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_6/Data/churn.txt")
n = nrow(churn)
set.seed(42)
train.id = sample(n, size = 2/3*n)
test.id = setdiff(1:n, train.id)
trainingdata=churn[train.id,]
validationdata=churn[test.id,]
train = trainingdata[, -4]
test = validationdata[, -4]
tree2 = rpart( Churn. ~ .,data=train, method="class", control=rpart.control(maxcompete = 3, maxdepth = 2)) # change hyperparameters

prp(tree2,box.col=c("pink","palegreen3")[tree2$frame$yval])