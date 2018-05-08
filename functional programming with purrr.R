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
  lenMax=floor(len*maxPercent)+1
  lenMin=len-floor(len*minPercent)
  x[lenMax:lenMin]
}

mtcars %>% map(~trimMaxMin(.x,maxPercent = 0.1,minPercent = 0.1)) %>% map_dbl(mean)





## group by using map()
mtcars %>% split(.$cyl) %>% map_int(nrow)
mtcars %>% split(.$cyl) %>% map_dfr(~map(.,mean))
mtcars %>% split(.$cyl) %>% map_df(colMeans) %>% t

## group by using ddply
library(plyr)
mtcars %>% ddply(.(cyl),nrow)
mtcars %>% ddply(.(cyl),.fun = colMeans)
 
