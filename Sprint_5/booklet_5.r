cereals = read.csv("C:/Users/fredd/Documents/Data-Mining/Sprint_5/Data/cereals.dat", sep="")
library(rgl)
library(olsrr)
attach(cereals)
plot3d(SUGARS,FIBER,RATING) #3d scatterplot
multi = lm(RATING~SUGARS+FIBER) # multilinear regression
print(summary(multi))

shelf1=seq(0,0,length.out=77) # sequence of 77 zeros
shelf2=seq(0,0,length.out=77)
shelf1[SHELF==1]=1 #First dummy variable, to indicate a categorial (nominal) value as predictor
shelf1[SHELF==2]=0
shelf1[SHELF==3]=0
shelf2[SHELF==1]=0 # Second dummy variable
shelf2[SHELF==2]=1
shelf2[SHELF==3]=0
print(shelf1)
multi = lm(RATING~SUGARS+FIBER+shelf1+shelf2) # For Shelf 1 y_hat = b0 + b1*sugars + b2*fiber + b3
multi_sum = summary(multi)
MSE = mean(multi_sum$residuals^2) # calc MSE
print(MSE)
### Number 3
library(MASS)
attach(Cars93)
full_model=lm(Price~ RPM +Horsepower+ Weight+ Passengers+ MPG.city+MPG.highway)
sub_model=lm(Price~ RPM +Horsepower+ Weight+ Passengers+ MPG.city)
full_sum = summary(full_model)
sub_sum = summary(sub_model)
print(extractAIC(full_model, scale=full_sum$sigma^2)) # Compare AIC of models. Lower is better. Adjust scale by standart-deviation^2. Second value is AIC
print(extractAIC(sub_model,  scale=sub_sum$sigma^2))
print(ols_mallows_cp(sub_model,full_model)) # CP values < #p ->smaller model is worse than full model; Cp value > p smaller model is better

myback=step(lm(Price~RPM +EngineSize+MPG.city+MPG.highway+Cylinders+Horsepower+Weight+Passengers)) #Backwards variable selection 
print(myback)

mymatrix=data.frame(RPM,EngineSize,MPG.city,MPG.highway,Cylinders,Horsepower,Weight,Passengers) #Forward
nullmodel =lm(Price ~ 1, data=mymatrix)
myforward=step(nullmodel, scope=formula(mymatrix),direction="both")

mystep=step(lm(Price~RPM +EngineSize+MPG.city+MPG.highway+Cylinders+Horsepower+Weight+Passengers),direction="both") #Stepwise