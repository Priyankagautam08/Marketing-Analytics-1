# Regression : Areas vs Sales
#X -is area sqft Y-sales in 1000s units; Find relationship betn X & Y
X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )
#import from ggsheet
library(gsheet)
area1 = "https://docs.google.com/spreadsheets/d/1qLHa5qFTyWacta8F-IGo6J3Zpf-BVR9OrlqONuJDqYc/edit#gid=2023826519"
df2 = as.data.frame(gsheet::gsheet2tbl(area1))
str(df2)
head(df2)
df3 = read.csv('./LM/slr1.csv')
str(df3)
df3 = read.csv(file.choose())
str(df3)

# Use Vector Data for this example
df=df3
mean(df$X); mean(df$Y)
sum(df$X); sum(df$Y)
cov(df$X,df$Y); cov(df$Y,df$X)   #doesnot tell the lenght of the relationship it tells the direction 
cor(df$X,df$Y) ; cor(df$Y,df$X)   #tells the strength of relation - is negative 0 is positive 
cor.test(df$X,df$Y) #no relationship cr=0 but here isstrong relationship
?cor.test
?plot
df1 = data.frame(X, Y)
df1 = data.frame(X,Y)
head(df1)

plot(y=df$Y, x=df$X,xlab='Area in sqft', ylab='Sales Amount', col='red',type='p', main='Plot of Area Vs Sales',xlim=c(0,max(df$X)), ylim=c(0,max(df$Y)),pch= 15)
#pch plotiing symbol 
abline(lm(df$Y ~ df$X), lty= 4 , lwd= 4 , col='blue')   #lm function for linear regression 
abline(v=c(3,5),h=c(6,10), col=c('red','blue'))

coef(fit1)[2]
#Model
fit1 = lm(Y ~ X, data=df)
fit1
coef(fit1)
?lm
summary(fit1)
# r s error is ,9065 means 90.65 values eplained by x
#f stastics is grater than 0.5 then it means one of values is significant

names(fit1)
#call(fit1)
terms(fit1)
coef(fit1)

cbind(df, fitted(fit1), fitted(fit1)- df$Y , residuals(fit1))
range(df$X)
coef(fit1)[2]
# Predictions
(Y = 0.9645 + 1.6699 * 4)  # for X=4
(Y = coef(fit1)[1] + coef(fit1)[2] * 4)  # for X=4

fitted(fit1)
cbind(df1, fitted(fit1))
range(df1$X)


#to predict values by creating new data frame 
new1 = data.frame(X=c(1.5,2,3,4,5))
new1
predict(fit1, newdata= new1)  # for new values of x predict the vales of x , we uses to predict the values of sales 

#df1$predict = predict(fit1, newdata= new2)
df1$predict = fitted(fit1)

predict(fit1, newdata=data.frame(X=df$X))
head(df)

#Variation
(SSE = sum((df1$Y - df1$predict)^2))
(SSR = sum((df1$predict - mean(df1$Y))^2))
#11.2 + 105.74
(SST = sum((df1$Y - mean(df1$Y))^2))

anova(fit1)
(r2 = SSR/SST)
summary(fit1)$r.squared


summary(fit1)$sigma
summary(fit1)
anova(fit1)
qt(0.95+.025, 14-2)


#Assumption : Graphical Analysis
plot(x=df$X, y=residuals(fit1)) # Linearity
abline(h=0)
plot(residuals(fit1))
car::durbinWatsonTest(fit1)    #rho =0 this shows there is no relationship shows independence of errors we reject the null hypothessies there is no autocorrletion IF THERE IS AC THEN WE cont perform linear regression , p values is more than 0.05 than we cant reject null hypothesis 

#IN TIME SERIES THERE IS ALWAYS A AUTOCORRLATION 

#Normality
hist(residuals(fit1),freq=F)
lines(density(residuals(fit1)))

(h=hist(residuals(fit1)))
names(h)
cbind(h$breaks, h$counts)

qqnorm(residuals(fit1))   #normality plot 
qqline(residuals(fit1))

residuals(fit1)
rstandard(fit1)
sales.stdres = rstandard(fit1)
qqnorm(sales.stdres, ylab="Standardized Residuals", xlab="Normal Scores", main="Checking normality of Residuals") 
qqline(sales.stdres)

stem(residuals(fit1))

#Equal Variance
plot(y=residuals(fit1), x=df$X)


#Outlier Analysis
df
df[14,]
df$Y
residuals(fit1)
boxplot( df$Y)
boxplot( fitted(fit1))  #plot summary inculding min , 1q ,3q, median and max 
boxplot( df$Y, fitted(fit1), residuals(fit1), names=c('Y','predictY', 'Residuals'))
abline(h=c(4.1, 5.97, -1.87))


boxplot(residuals(fit1), names=c('Residuals'))
identify(rep(1, length(residuals(fit1))), residuals(fit1), labels = seq_along(residuals(fit1)))

car::outlierTest(fit1)
df[14,]

car::outlierTest(lm(Y ~ X, data=df[-14,]))
