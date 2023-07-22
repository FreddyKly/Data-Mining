y=c(10,11,12,13,14,15,20,18,22,25)
x=c(2,2,3,4,4,5,6,7,8,9)
# plot(x,y) #Scatterplot of the values
myvalues=lm(y~x) # Create a linear model with y - target, x - input; get b0 and b1
# print(myvalues)
# plot(y~x)
abline(myvalues) # print straight line in plot
# print(summary(myvalues)) #Summary of model fitting function
myres=residuals(myvalues) #Residuals for pred values
myfit=fitted(myvalues) #Pred values
plot(myfit,myres) #scatter of fit to residuals

# With outlier/influencial observation
xx =c(2 , 2, 3, 4, 4, 5, 6, 7, 8, 9, 16)
yy =c(10, 11, 12, 13, 14, 15, 20, 18, 22, 25, 39)
plot(xx,yy)
myvalues=lm(yy~xx)
influences=influence.measures(myvalues) #see the influences by different metrics for all the observations
# print(summary(influences))

#### Number 2
baseball = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_4/Data/baseball.txt") # load dataset
baseball_new=baseball[baseball$at_bats>=100,]
print(baseball$at_bats)
myreg=lm(baseball_new$homeruns~baseball_new$bat_ave)
print(summary(myreg))