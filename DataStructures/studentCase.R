# Case Study - student  

#sales1 = read.csv("./data/denco.csv")
#sales1 = read.csv(file.choose())

#using gsheet
library(gsheet)
library(dplyr)
url = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2051155174'
student2 = as.data.frame(gsheet2tbl(url))
str(student2)

ss =student2 #keeping a backup
class(s)
summary(ss)
head(ss,n=5)
dim(ss)
length(unique(ss$city))  # print unique custmer name
#aggregate(ss$student , by=list(ss$city), FUN= min)


df1= ss %>% dplyr::filter( city == 'Noida')
df1
df2= ss %>% dplyr::filter(city == 'Delhi')
df2
g_ss=group_by(df2,br)
df3= ss %>% dplyr::filter( city == '')

library(data.table)
dt1 = as.data.table(ss)
head(sort(xtabs(~sname, grades), decreasing=T))


