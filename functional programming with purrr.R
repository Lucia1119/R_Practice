## Functional Programming With Purrr
## https://www.r-exercises.com/2018/01/12/functional-programming-with-purrr-exercises-part-1/

library(datasets)
data("mtcars")
View(mtcars)

mtcars[21,] ## return a vector
mtcars %>% map(21) ## return a list


## calculate column mean of a df
mtcars %>% map(mean) ## return a list
mtcars %>% map_dbl(mean) ## return a vector


## trim original data before calculating mean
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


## group by exercises using map()
mtcars %>% split(.$cyl) %>% map_int(nrow)

## calcualte column means by each group
mtcars %>% split(.$cyl) %>% map_dfr(function(x) { return(map(x, mean)) }) # function
mtcars %>% split(.$cyl) %>% map_dfr(~map(.,mean)) ## formula, same as function, but cleaner
mtcars %>% split(.$cyl) %>% map_df(colMeans) %>% t

## create a linear regression model
model_mtcars=mtcars %>% split(.$cyl) %>% map(function(x){lm(formula=qsec~hp,data=x)}) ## function
model_mtcars=mtcars %>% split(.$cyl) %>% map(~lm(formula=qsec~hp,data=.)) ## formula is better
model_mtcars=mtcars %>% split(.$cyl) %>% map(~lm(formula=.$qsec~.$hp,data=.))

model_mtcars %>% map(summary) ## call, residuals, coefficients...
model_mtcars %>% map(summary) %>% map("coefficients") ## map() can subset by list name

## usage of map2() with two arguments
## fit: predict the value using regression model
prediction_mtcars=model_mtcars %>% map2(.y=list(mtcars), ~predict(.x,newdata=.y))


## Exercise 9 plotting
## usage of indexed map imap(), iwalk()
library(ggplot2)

prediction_histogram=function(x,groupIndex){
  x_df=as.data.frame(x) ## ggplot requires for df as input
  names(x_df)="prediction"
  ggplot(x_df,aes(prediction))+
    geom_histogram()+
    labs(x="Predicted qsec",
         y="Frequency",
         title=paste("histogram for",groupIndex,"cylinders"))
}
## in imap(), .y is the index of .x
## in this case, .y is the name of the list .x
prediction_mtcars %>% imap(~prediction_histogram(.x,groupIndex =.y))

## how to use iwalk
prediction_mtcars %>%
  iwalk(~hist(.x, main = paste('Histogram for',.y, 'cylinders'), xlab = 'Predicted qsec'))





## group by exercise using ddply
library(plyr)
mtcars %>% ddply(.(cyl), .fun= print) ## return 3 df
## mtcars %>% ddply(.(cyl),.fun = function(x) {print(1)})

mtcars %>% ddply(.(cyl),nrow)

mtcars %>% ddply(.(cyl),.fun = colMeans)
mtcars %>% ddply(.(cyl), .fun=function(x){ x %>% map(mean) %>% unlist })

## why it's not work????
mtcars %>% ddply(.(cyl), .fun = function(x){x %>% map(~lm(formula=qsec~hp,data=.))})
##_____________________________________________________

## https://www.r-exercises.com/2018/01/19/functional-programming-with-purrr-exercises-part-2/

vector10=1:10
vector10 %>% map()
