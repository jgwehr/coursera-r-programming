library(datasets)
data(iris)

question1 <- iris[iris$Species == 'virginica',]
mean(question1$Sepal.Length)