#datastructures in R

#vectors
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
