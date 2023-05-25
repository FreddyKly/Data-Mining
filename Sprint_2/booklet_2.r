print(airquality)
print(nrow(airquality))

print("Ozon Column:")
print(airquality$Ozon)

mean <- mean(airquality$Ozon)
print("Ozon Column Mean:")
print(mean)

#b)
missing_values <- is.na(airquality$Ozon)
print("Ozon Column missing values:")
print(missing_values)

#c
num_missing_values <- sum(missing_values)
print("How many values are 'NA'")
print(num_missing_values)

#d
mean_no_na <- mean(airquality$Ozon, na.rm = TRUE)
print("Ozon Column Mean without 'NA':")
print(mean_no_na)

#e)
airquality_no_na <- na.omit(airquality)
print("Airquality datafram without 'NA'")
print(airquality_no_na)
print(nrow(airquality_no_na))

#f)
print(complete.cases(airquality$Ozone))