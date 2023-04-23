print("Ozon Column:")
print(airquality$Ozon)

mean <- mean(airquality$Ozon)
print("Ozon Column Mean:")
print(mean)

missing_values <- is.na(airquality$Ozon)
print("Ozon Column missing values:")
print(missing_values)