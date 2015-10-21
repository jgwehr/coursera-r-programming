library(datasets)
data(mtcars)

sapply(split(mtcars$mpg, mtcars$cyl), mean)