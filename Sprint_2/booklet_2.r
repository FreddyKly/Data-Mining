# print(airquality)
# print(nrow(airquality)) #How many rows does the dataset have

print("Ozon Column:")
print(airquality$Ozon) #Print the Ozon column of the dataframe

mean <- mean(airquality$Ozon) #claculate mean -> fails because values are missing
print("Ozon Column Mean:")
print(mean)

#b)
missing_values <- is.na(airquality$Ozon) #Ozon column but TRUE if value is missing and FALSE if it isn't
print("Ozon Column missing values:")
print(missing_values)

#c
num_missing_values <- sum(missing_values) #sum all logical 1's. Here it counts how often we have TRUE for missing value
print("How many values are 'NA'")
print(num_missing_values)

#d
mean_no_na <- mean(airquality$Ozon, na.rm = TRUE) #Mean, leave out missing values
print("Ozon Column Mean without 'NA':")
print(mean_no_na)

#e)
airquality_no_na <- na.omit(airquality) #Dataframe but without missing values (rows are deleted)
print("Airquality datafram without 'NA'")
print(airquality_no_na)
print(dim(airquality_no_na))

#f)
print(complete.cases(airquality$Ozone)) #Have FALSE were values are missing

# g)
indecies_of_missing=which(is.na(airquality),arr.ind=TRUE) #An array of indicies where values are missing
print(indecies_of_missing)

#### Number 2

# a)