## Working Directory
## setwd("~/GitHub/coursera-r-programming/Week 1/rprog-data-quiz1_data")

##Load the File
week1data <- read.csv('hw1_data.csv')


##Question 11
##Get Column Names
names(week1data)


##Question 12
## Extract the first 2 rows of the data frame and print them to the console.
week1data[1:2,]


##Question 13
## How many observations (i.e. rows) are in this data frame?
nrow(week1data)



##Question 14
## Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
week1data[(nrow(week1data)-1):nrow(week1data),] ## Or,
tail(week1data,2)


##Question 15
## What is the value of Ozone in the 47th row?
week1data[47,"Ozone"]


##Question 16
## How many missing values are in the Ozone column of this data frame?
length(which(is.na(week1data["Ozone"])))


##Question 17
## What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
OzoneData <- week1data["Ozone"]
tOzoneData <- subset(OzoneData, !(is.na(OzoneData))) 
mean(tOzoneData)

##Question 18
## Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
ques18 <- subset(subset(week1data, Ozone > 31), Temp > 90)
mean(ques18$Solar.R, rm.na=TRUE)


##Question 19
## What is the mean of "Temp" when "Month" is equal to 6?
mean(week1data$Temp[week1data$Month==6])


##Question 19
##What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(week1data$Ozone[week1data$Month==5 & !is.na(week1data$Ozone)])


