library(rpart)
library(rpart.plot)
library(ROCR)
iristree = rpart(Species ~ .,data=iris, method="class") #decisioin tree, predict Species from all other variables, dataset is iris, classification problem
n = nrow(iris)
set.seed(42)
train.id = sample(n, size = 2/3*n)
test.id = setdiff(1:n, train.id)
traintree = rpart(Species ~ .,data=iris, method="class",subset=train.id)
pred=predict(traintree, iris[-train.id,], type="class") # predict the iris dataset without the training samples (only test-set), with the traintree

print(table(pred, iris[-train.id, "Species"])) #Confusion matrix of pred and iris dataset without the training samples, for the species col


### Number 2
ff = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_3/Data/disease.txt")

diseasetree = rpart(Disease ~ .,data=ff, method="class")
pred=predict(diseasetree, ff, type="class")
conf_matr = table(pred, ff[, "Disease"])
print(conf_matr)
pred=predict(diseasetree, ff, type="prob") #get probabilities for the predictions
print(pred)
pr = prediction(pred[,2], ff$Disease) # access attributes with @ not $
perf = performance(pr,"tpr","fpr") #ROC curve
print(pr@predictions)
plot(perf)
auc = performance(pr, "auc")
print(auc@y.values)

