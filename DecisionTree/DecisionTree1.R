#classification modeling  &*** desion tree

#depands of 3 things  gini index 

stud= data.frame(rollno=c('1','2','3'),c("female","male","female"), c("play","Nplay","play"))
?data.frame
rownames(stud)="rollno"


#data
#student
rollno = paste('s',1:30 , sep ='')
rollno

set.seed(1)
gender = sample (x= c('male','female'), size=30 , replace = T , prob=c(.5 , .5))
gender
table(gender)
set.seed(1)
play = sample(x= c('play','notplay'), size=30 , replace = T , prob=c(15/30 , 15/30))
play
table(play)
prop.table(table(play))
student1 = data.frame (gender, play)
rownames(student1)=rollno
student1
table(student1)
table(student1$gender)   #to see frequency
prop.table(table(student1))


#model1

library(rpart)
?rpart
fit1 = rpart (play ~gender , data=student1)
fit1
#decision tree
library(rpart.plot)
rpart.plot(fit1, main="classification tree" , nn=T)



#predict 

predict (fit , newdata = data.frame(gender='female'))
predict (fit , newdata = data.frame(gender=c('female','female','male', 'female')))



#part 2---------------- Add another column

rollno = paste('s',1:30 , sep ='')
rollno

set.seed(101)
gender = sample (x= c('male','female'), size=30 , replace = T , prob=c(.5 , .5))
gender
table(gender)
set.seed(101)
play = sample(x= c('play','notplay'), size=30 , replace = T , prob=c(15/30 , 15/30))
rownames(student1)=rollno
student2
table(student2)
table(student1$gender)   #to see frequency
prop.table(table(student2))


set.seed(101)
married = sample (x= c('married','single'), size=30 , replace = T , prob=c(0.3 , .7))
table(married)

student2= data.frame (rollno,gender,play,married)
rownames(student2)=rollno
student2
head(student2)
prop.table(table(student2))

###### model 2

library(rpart)
?rpart
fit2 = rpart (play ~ gender+ married  , data=student2, minsplit=4 , minbucket=2)
fit2
summary(fit2)
#decision tree
rpart.plot(fit2, type=2 , extra =104, tweak= 1.2 , under =T , shadow = c('brown','green','red'), nn= T)
student2


student2 =data.frame(rollno,gender,play,married)
student2
library(rpart)
fit2=rpart(play~gender+married,data=student2,minsplit=4,minbucket=2)
summary(fit2)

library(rpart.plot)
rpart.plot(fit2,main='classification Tree',type=2,extra=104,tweak=1.2,under=T,shadow=c('brown','green','red'),nn=T)



