####Market basket Analysis

library(arules)
library(arulesViz)
library(datasets)
data(Groceries) 
Groceries
#myDataFrame = Groceries
transDat= as(myDataFrame, "transactions")

head(Groceries)
inspect(Groceries[1:5])
LIST(Groceries[4:7])   #another view in list

frequentItems = eclat(Groceries, parameter = list(supp= 0.050, minlen = 1 , maxlen= 1.5))  
# inspect(sort(frequentItems , by= "counts", decreasing=TRUE)[1:5])
# if supp will tell lin how many times item is purchased lke here upp= 0.005 total ~ 10000 so if item purchased 50 times above this it will be frequent 

unique(frequentItems)
inspect(frequentItems[1:25])


?eclat

itemFrequencyPlot(Groceries , topN = 15 , type ="absolute")
itemFrequencyPlot(Groceries , topN = 10 , type ="relative")
abline(h=0.2)  #how many eliments are above it

rules= arules:: apriori(Groceries, parameter = list(supp = 0.005 , conf = 0.5))
rules 
inspect(rules[1:5])
quality(rules)

head(quality(rules))
options(digit=2)
rules1= sort(rules , by ="confidence", decreasing = TRUE )
inspect(rules1[1:5])


#To get ‘strong‘ rules, increase the value of ‘conf’ parameter. To get ‘longer‘ rules, increase ‘maxlen’
#How To Remove Redundant Rules ? to remove same dependancies  

sum(is.redundant(rules))

#Use the below code to find out and filter the redundant rules.
redundant <- which (colSums (is.subset (rules, rules)) > 1) # get redundant rules in vector
rules <- rules[-redundant] # remove redundant rules
sum(is.redundant(rules))
#How to Find Rules Related To Given Item/s ? This method is the core of ‘Market basket analysis’ that is useful to make recommendations of new items to your users. 
#This can be achieved by modifying the ‘appearance’ parameter in the apriori() function. For example,
#Find what factors influenced an event ‘X’
#To find out what customers had purchased before buying ‘Whole Milk’. This will help you understand the patterns that led to the purchase of ‘whole milk’.


# which item trigger the sell of milk
rules = apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.15), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F)) # those who bought 'milk' also bought..
inspect(rules[1:15])

reverse 
#Find out what events were influenced by a given event

#In this case: the Customers who bought ‘Whole Milk’ also bought. In the equation, ‘whole milk’ is in LHS (left hand side).  

rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="rhs",lhs="whole milk"), control = list (verbose=F)) # get rules that lead to buying  with 'whole milk'

inspect(rules[1:15])

#Remove redundancies
#Sort the rules, filter the redundant ones and show the Top 7 Rules.

rules <- sort (rules, decreasing=TRUE,by="confidence")

redundant <- which (colSums(is.subset(rules, rules)) > 1) # get redundant rules in vector

rules <- rules[-redundant] # remove redundant rules inspect (rules[1:7])
rules
#Making Rules For Continuous Data
#If you try to make rules on continuous variables, each value will be treated as distinct item, causing undesirable explosion of rules. So, convert the continuous variables to factors, which can be easily done using discretize() function.
#discretize (x, method="cluster", categories=3) # method can make cuts in equal "intervals", "frequency", "cluster", "fixed"

#Visualizing The Rules
plot(rules[1:5],measure = c("support", "lift"), shading="confidence")
plot(rules,measure = c("support", "lift"), shading="confidence")
# Interactive Plot

plot (rules[1:25],method="graph",interactive=TRUE,shading="confidence") # feel free to expand and move around the objects in this plot

plot (rules, measure=c("support", "lift"), shading="confidence")


affinity(transDat) # Calculates affinity - the 'nxn' Jaccard Index affinity matrix
transDat_c <- addComplement(transDat, "Item 1") # Adds "Item 1" to all transactions in transDat
duplicated(rules) # find out if any rule is duplicated


