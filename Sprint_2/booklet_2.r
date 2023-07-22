# print(airquality)
# print(nrow(airquality)) #How many rows does the dataset have

# print("Ozon Column:")
# print(airquality$Ozon) #Print the Ozon column of the dataframe

mean <- mean(airquality$Ozon) #claculate mean -> fails because values are missing
# print("Ozon Column Mean:")
# print(mean)

#b)
missing_values <- is.na(airquality$Ozon) #Ozon column but TRUE if value is missing and FALSE if it isn't
# print("Ozon Column missing values:")
# print(missing_values)

#c
num_missing_values <- sum(missing_values) #sum all logical 1's. Here it counts how often we have TRUE for missing value
# print("How many values are 'NA'")
# print(num_missing_values)

#d
mean_no_na <- mean(airquality$Ozon, na.rm = TRUE) #Mean, leave out missing values
# print("Ozon Column Mean without 'NA':")
# print(mean_no_na)

#e)
airquality_no_na <- na.omit(airquality) #Dataframe but without missing values (rows are deleted)
# print("Airquality datafram without 'NA'")
# print(airquality_no_na)
# print(dim(airquality_no_na))

#f)
# print(complete.cases(airquality$Ozone)) #Have FALSE were values are missing

# g)
indecies_of_missing=which(is.na(airquality),arr.ind=TRUE) #An array of indicies where values are missing
# print(indecies_of_missing)

#### Number 2
library(datasets)
library(DataExplorer)
library(mlr)
# a)
# plot_missing(airquality)

#d)
imputed = impute(airquality, cols = list(Ozone = 100)) # Impute all missing values with 100
imp_ozone=imputed$data[,1]
# print(imp_ozone)

#e)
imputed2 = impute(airquality, cols = list(Ozone = imputeMedian()))
# print(imputed2$data[,1])

#g)
imputed4 = impute(airquality, cols = list(Ozone = imputeNormal())) #Imputed with values taken from an appropriate normal distribution

#i)
# print(class(imp_ozone))
# hist(imp_ozone,breaks=25,ylim=(c(0,45)),main="Imputation with 100")

#### Number 3
#a)
clothing = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_2/Data/clothing_store.txt") # load dataset
names(clothing) # Get column names

#d)
set.seed(42)
clothing_nobs = nrow(clothing)
print(clothing_nobs)
clothing_train_no = sample(nrow(clothing), 0.7*clothing_nobs) #get random numbers range(1, nrow(clothing)) and get 0.7*clothing_nobs of them
clothing_validate_no = sample(setdiff(seq_len(nrow(clothing)),clothing_train_no), 0.30*clothing_nobs) #From same dataset get 0.3*clothing_nobs number in the range(1, nrow(clothing)) -> no duplications from clothing_train_no
training_data=clothing[clothing_train_no,] # Return the rows with the indecies from clothing_train_no
validation_data=clothing[clothing_validate_no,]

#e)
attach(training_data) #Add this to R (?) so we can call its column names as variables
length(unique(HHKEY)) #Get how many unique values are in HHKEY

#g)
data_one=training_data[RESP==1,] #Return the rows where RESP==1
tr=training_data[,-1:-2] #Get dataframe but without the first to second column
tr=tr[,-1]
val=validation_data[,-1]
val=val[,-1]

#h)
hi_trans=log(HI) #take the log of every entry in HI
tr=tr[,-45] #get dataframe without column HI (45)
tr=data.frame(tr,hi_trans) #create a dataframe with tr and then append hi_trans
hist(hi_trans) 

write.table(tr,"tr_clothing_prepared.txt",row.names=FALSE) #safe as table

