# Well-Behaved Functions – Exercises
# https://www.r-exercises.com/2018/04/27/well-behaved-functions-exercises/
#         

a_to_b_power1=function(a,b=2){
        a^b
}


a_to_b_power2=function(a=b+1,b=2){
        a^b
}


## check if x[i+1]%%x[i]==0
zero_if=function(x){
        ifelse(x==0, TRUE, FALSE)
}


first_div_sec=function(x){
        lenx=length(x)
        y=x[2:lenx]
        z=x[1:(lenx-1)]
        y%%z %>% every(zero_if)
}
        