#Logostic Regression when we are trying to predict binary outcome as 
#sometimes in linear model it might predict negative values

library(ISLR)

str(Default)   # Default is dataset
summary(Default)   # the dataframe

logit = glm (default ~ income +balance + student , family ='binomial', data =Default)
summary(logit)

# formula y= 0.0057 *balance + - .0667 *studentYES dummies vvariable when there is categorial  student yes = 0 or 1 values 
library(dplyr)
(ndata = (slice (Default , seq (0, n(), 500))))  # pic evry 500 th element 
n
table(Default$default, Default $student) # default sumarry how many std delfault or non std default 
prop.table(table(Default$default, Default $student))
addmargins(prop.table(table(Default$default, Default $student)))
 
(fitted.results = predict(logit,newdata=ndata, type='response'))
cbind(ndata,fitted.results)
ndata %>% mutate(predict=ifelse(fitted.results<.5,'n','y'))  #finally prediction 
