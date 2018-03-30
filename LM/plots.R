
attach(women) # make variable acces alone 
women
barplot(height) #discreate values
library(vcd)
Arthritis
counts=table(Arthritis$Improved, Arthritis$Treatment)
counts
barplot(counts,horiz= T)
plot(Arthritis$Improved)
barplot(counts, main ="stacked Bar plot" , xlab="Treatment", ylab="frequency", col= c("red","green","blue"), lagend = rownames(counts))

par(mfrow = c(2,2))
slices = c (10, 12 ,4, 16,8 )
lbls= c("a","b","c","d","f")
pie(slices , labels= lbls , main ="simple pie charts")
pct = round (slices/sum(slices)*100)
pct


pie(slices, labels = lbls,
    main="Simple Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct, "%", sep="")
pie(slices, labels=lbls2, col=rainbow(length(lbls2)),
    main="Pie Chart with Percentages")
library(plotrix)
pie3D(slices, labels=lbls,explode=0.1,
      main="3D Pie Chart ")

mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls3,main="Pie Chart from a Table\n (with sample sizes)")

