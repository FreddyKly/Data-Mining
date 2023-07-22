library(rpart)
library(rpart.plot)
iristree = rpart(Species ~ .,data=iris, method="class") #decisioin tree, predict Species from all other variables, dataset is iris, classification problem
n = nrow(iris)
set.seed(42)
train.id = sample(n, size = 2/3*n)
test.id = setdiff(1:n, train.id)
traintree = rpart(Species ~ .,data=iris, method="class",subset=train.id)
pred=predict(traintree, iris[-train.id,], type="class") # predict the iris dataset without the training samples (only test-set), with the traintree

print(table(pred, iris[-train.id, "Species"])) #Confusion matrix of pred and iris dataset without the training samples, for the species col
