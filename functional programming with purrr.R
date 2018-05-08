## Functional Programming With Purrr
## https://www.r-exercises.com/2018/01/12/functional-programming-with-purrr-exercises-part-1/

library(datasets)
data("mtcars")
View(mtcars)
mtcars %>% map(mean)


mtcars[21,] ## return a vector
mtcars %>% map(21) ## return a list

mtcars %>% map_dbl(mean)

mtcars %>% map(mean,trim=0.1)

## what about trim max 10 and min 20?
trimMaxMin=function(x,maxPercent=0,minPercent=0){
  x=sort(x)
  len=length(x)
  lenMax=len*maxPercent+1
  lenMin=len*(1-minPercent)
  x[lenMax:lenMin]
}

