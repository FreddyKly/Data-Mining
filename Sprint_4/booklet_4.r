y=c(10,11,12,13,14,15,20,18,22,25)
x=c(2,2,3,4,4,5,6,7,8,9)
# plot(x,y) #Scatterplot of the values
myvalues=lm(y~x) # Create a linear model with y - target, x - input; get b0 and b1
# print(myvalues)
# plot(y~x)
# abline(myvalues) # print straight line in plot
# print(summary(myvalues)) #Summary of model fitting function
myres=residuals(myvalues) #Residuals for pred values
myfit=fitted(myvalues) #Pred values
# plot(myfit,myres) #scatter of fit to residuals

# With outlier/influencial observation
xx =c(2 , 2, 3, 4, 4, 5, 6, 7, 8, 9, 16)
yy =c(10, 11, 12, 13, 14, 15, 20, 18, 22, 25, 39)
# plot(xx,yy)
myvalues=lm(yy~xx)
influences=influence.measures(myvalues) #see the influences by different metrics for all the observations
# print(summary(influences))

#### Number 2
baseball = read.csv(file="C:/Users/fredd/Documents/Data-Mining/Sprint_4/Data/baseball.txt", sep="",) # load dataset
baseball_new=baseball[baseball$at_bats>=100,]
myreg=lm(baseball_new$homeruns~baseball_new$bat_ave)
plot(baseball_new$homeruns~baseball_new$bat_ave)
abline(myreg)
print(summary(myreg)) #R-squared value is low so not a lot of  the variance is captured by the linear regression
print(cor(baseball_new$homeruns, baseball_new$bat_ave, method = "pearson")) # correlation
myres=residuals(myreg)
plot(baseball_new$bat_ave,myres)
qqnorm(myres) #if the residuals of a model a more normal distributed and have a more even variance it's better. It picked up some underlying pattern
qqline(myres)

#h)
ln_home_runs=log(baseball_new$homerun)
bat_ave=baseball_new$bat_ave
plot(bat_ave,ln_home_runs)
total=data.frame(ln_home_runs,bat_ave)
# print(total)
totalnew=total[total$ln_home_runs>=-10,]
myr=lm(totalnew$ln_home_runs~totalnew$bat_ave)
abline(myr)
print(summary(myr))