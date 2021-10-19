#' ---
#' title: "Class 5 Data Visualization"
#' author: "Tom Quach"
#' ---


# Class 05 Data Visualiation 

#Lets start with a scatterplot

#Before we can use it we need to install it by using install.packages() and load it up!
library(ggplot2)

#Every ggplot has a data + aes + geoms
ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth()

#Change to a linear model
p <- ggplot(data=cars) + aes(x=speed, y=dist) + geom_point() + geom_smooth(method="lm")

p + labs(title = "Class 05 Cars Plot", subtitle = "Tom Quach", x = "Speed (MPH)", y = "Distance (miles)")

#Base graphics is shorter
plot(cars)

#Getting the beginning data set for genes
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#How many genes are in my data?
nrow(genes)

#How to access the State column 
table(genes$State)

#What percent are up/down
prec <- table(genes$State) / nrow(genes) * 100

#Round percentage by 2 significant figures
round(prec, 2)

#Creating unnamed scatter plot. Condition 1 against condition 2 where each point is a gene
ggplot(data = genes) + aes(x=Condition1, y=Condition2) + geom_point()

#Coloring the points so we can tell which one of the genes are down, unchanging, or up
ggplot(data = genes) + aes(x=Condition1, y=Condition2, color=State) + geom_point()

#Storing our plot code so we do not have to type it all out when needed
genesp <- ggplot(data = genes) + aes(x=Condition1, y=Condition2, color=State) + geom_point()

#Printing out genesp to see if it works
genesp

#Changing the color scheme of the points 
genesp + scale_color_manual(values=c("blue", "gray","red"))

#Storing final plot 
genespfinal <- genesp + scale_color_manual(values=c("blue", "gray","red"))

#Print genespfinal to check if it works
genespfinal

#Naming the plot and axis
genespfinal + labs(title = "Gene Expression Changes Upon Drug Treatment", x = "Control (No Drug)", y = "Drug Treatment")
