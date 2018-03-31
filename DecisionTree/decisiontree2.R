
(rollno = paste('s',1:30,sep=''))
set.seed(10)
gender=sample(x=c('M','F'),size=30,replace=T,prob=c(0.5,0.5))
gender
play=(sample(x=c('play','notplay'),size=30,replace=T,prob=c(0.5,0.5)))
play
table(play)
prop.table(table(play))

student1 =data.frame(rollno,gender,play)

library(rpart)
?rpart
fit1=rpart(gender~play,data=student1,minsplit=4,minbucket=2)
fit1

library(rpart.plot)
rpart.plot(fit1,main='classification Tree')
table(student1$gender)



predict(fit1,newdata = data.frame(gender='F'))
predict(fit1,newdata = data.frame(gender=c('M','F','M')))

married = sample(x=c('Married','Single'),size=30,replace=T,prob=c(0.3,0.7))
table(married)

student1 =data.frame(rollno,gender,play,married)
student1
library(rpart)
?rpart
fit2=rpart(play~gender+married,data=student2,minsplit=4,minbucket=2)
summary(fit2)

library(rpart.plot)
rpart.plot(fit2,main='classification Tree',type=2,extra=104,tweak=1.2,under=T,shadow=c('brown','green','red'),nn=T)
table(student1$gender)

