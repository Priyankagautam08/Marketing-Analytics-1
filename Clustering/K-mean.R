##### clutering --- kmean


A= (c(1,1.5,3.0,5.0,3.5,4.5,3.5))
B= (c(1.0,2.0,4.0,7.0,5.0,5.0,4.5))
marks=data.frame(A,B)
?kmeans
(c1= kmeans(marks,4))

cbind(marks,  c1$cluster)
plot(marks , pch=10, col = c1$cluster)
c1$clusters
points (c1$clusters , col =1:2 , pch=8 , cex= 3)  # amplify clusters symbol

c1$iter

mcenters = marks[c(1,5),]
mcenters


#Specify Coordinates for Centers
mcenters = marks[c(1,5),]
mcenters
(c2a <- kmeans(marks, centers=mcenters))
c2a
cbind(marks, c2a$cluster)
matrix(c(1,1,5,7), ncol=2)
?matrix
(c2b <- kmeans(marks, centers=matrix(c(1,1,5,7), ncol=2)))

c2a
cbind(marks,c2a$cluster)
c2a$centers
aggregate(marks,by=list(c2a$cluster),FUN=mean)
c2a
c2a$iter

library(dplyr)
marks
marks %>% group_by(c2a$cluster) %>% summarise_all(funs(sum, mean, median, n()))


# Distances
x1=marks[1,]; x2=marks[2,]
x1;x2
sqrt(sum((x1-x2)^2))
sqrt(1.25)
dist(rbind(x1,x2))
euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
for (i in 1:7)
  print(paste(i, round(euc.dist(marks[i,], marks[1,]),2),sep='-'))

ref1 = marks[1,]; ref1
ref2 = marks[4,]; ref2

(d1= apply(marks,1,function(x)sqrt(sum((x-ref1)^2))))
(d2= apply(marks,1,function(x)sqrt(sum((x-ref2)^2))))
df=cbind(marks, d1,d2)
df

apply(df, 1, function(x) max(which(x == min(x, na.rm = TRUE))))
df
apply(df[,c(3,4)],1, min)
df3 <-transform(df, mind1d2=apply(df[,c(3,4)],1, min, na.rm = TRUE))
df3

