#multiple linear usin more than two variables 

mtcars
dim(mtcars)
names(mtcars)
(M1= lm(mpg ~ disp + cyl+ hp+ drat + wt+ qsec+ carb , data = mtcars ))
?lm
summary(model1)
(M2 = lm (mpg~ disp + cyl + wt , data= mtcars))
str(model2)
anova(M1, M2)  #but less permeter model should be part of other model but this will have negative dof , first model has less variable
anova(model2, model1)   #m2 is preferred as its has less variable 
?anova
(M3 = lm (mpg~ cyl+ wt, data = mtcars))
summary(M3)  
anova(M3, M1) 
library(MASS)
#ACI values must be less , its penalise for using more variable , we trying to exlain variation in y in respect of various deptent variable 

(model1a = lm(mpg~ disp +cyl +hp +drat +wt + qsec +carb , data = mtcars))
step = stepAIC (model1a , direction ='both') 
 ?stepAIC
library(olsrr)
model = lm(mpg ~ disp + hp +wt + qsec , data = mtcars)
k = ols_step_all_possible(model)
plot(k)
k



install.packages("CHAID",repos ="http://R-Forge.R-project.org")

install package is other repos above cammond 