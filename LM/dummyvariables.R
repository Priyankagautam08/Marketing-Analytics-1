# dummy variables  

df= mtcars
summary(df)
df$cyl = factor(df$cyl)
df$am= factor (df$am)

m1= lm(mpg ~ wt + cyl +am , data = df)
summary (df$cyl)


 y4 = 33.99 + -3.2 * wt + 0
 y6 = 33.99 + -3.2 * wt + -4.2* cyl(=1)  # for checkig such manipulation we have to manually enter the value
 
 y6 = 33.99 + -3.2 * wt + -4.2* cy18 (=1)
 
 
 M1= lm(mpg ~ wt + cyl , data = df)
 summary (M1)
 
 
 summary (df$cyl)
 
 data.frame(wt= c(2,3) , cyl = factor(c(4,6)))
 predict(M1,newdata = data.frame (wt= c(2,3), cyl = factor(c(4,6))))
 