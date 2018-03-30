#datastructures in R

#vectors only one datatypes
(v1 = c('A','B','C'))
v1
class(v1)
(v1 = c('1','2','3'))
(v1 = c(T,F,T))
# creating values from 100 to 200 -large vector
v4=100:200
v5=seq(1,10,2)
v4; v5
v4[c(1,3,4)]
v4[v4==150]
v7=c('A','C')
v1[v1 %in% v7]
v1['A']
v1[1]

(v8=10:15)  #data

names(v8)=c('an','piya','nisa','tiya','nita')  #assign names to data
v8['piya']
v8['2']   #return values wrt index 
v8[c('piya','tiya')]

v8[3:5]

#dataframes # combinates of data types 

df= data.frame(rollno=c(1,2,3), name=c('rohit','lalit','harish'),course= c('MBA', 'BBA','MCA'), dept=c('dept1', 'dept2','dept3'),marks=floor(runif(3,50,100)))
df
#?runif #to get help 
#?data.frame

df=fix(df)
df
str(df)
class(df)
summary(df)
 
#?ls()  #differnt types of datastructures  or mixtures of objects
ls()
#rm(list=ls())
 ls()
 v4
 (mylist1 = list(1,df, v4))
#matrix all values have datatypes

(mymatrix = matrix (1:24 , ncol=4))
(mymatrix = matrix (1:24 , ncol=4, byrow=FALSE))
?matrix
mymatrix[,1] 
mymatrix[,1:3] 
mymatrix[2,] 
mymatrix[2:4,3] 
mymatrix[2:4,3:4] 
mymatrix[3,3] 
(mymatrix = matrix (1:24 , ncol=4))
dimnames(mymatrix)=list(c('r1','r2','r3','r4','r5','r6'), c(paste('c',1:4,sep='')))
mymatrix
dimnames(mymatrix)=list(c(paste('R',1:6,sep='')), c(paste('c',1:4,sep='')))
mymatrix
paste('c','d',sep='-')
paste('c',1:4,sep='')

#arrays  #multidimensional data
myarray=array(101:124 , dim = c(4, 3, 2 ))  # 4- rows , 3 colums , 2 matrix 
myarray
myarray=array(101:124 , dim = c(2, 3, 4 ))
myarray

#myarray=array(101:124 , dim = list(c('s1','s2','s3' ))
#myarray

df=fix(df)
df
df[,1:2]
df$gender = c('M','F','M','F','M') 
str(df)
df$gender = factor(df$gender)
str(df)
df$grades = c('A','B','A','A','C')
df$grades= factor(df$grades, ordered=T, levels = c('C','B','A'))
df
str(df)


table(df$course,df$gender)
mymatrix
apply(mymatrix , 1, sum)
apply(mymatrix, 2,sum)
apply(mymatrix, 2,sd)

myarray
apply(myarray, 2, sum)
apply(myarray, 3, sum)
apply(myarray, 1, sum)
df
tapply(df$marks, df$course , sum)
tapply(df$marks, df$gender , sum)
df$gender =NULL   #delete the row 

df[df$course =='mtech',] #  list rows with course mtech 
df[df$marks >='60',] 
 