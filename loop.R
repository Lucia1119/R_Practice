wayans <- list( 
  "Dwayne Kim" = list(), 
  "Keenen Ivory" = list( 
    "Jolie Ivory Imani", 
    "Nala", 
    "Keenen Ivory Jr",
    "Bella", 
    "Daphne Ivory" 
  ), 
  Damon = list( 
    "Damon Jr", 
    "Michael", 
    "Cara Mia", 
    "Kyla" 
  ), 
  Kim = list(), 
  Shawn = list( 
    "Laila", 
    "Illia", 
    "Marlon" 
  ), 
  Marlon = list( 
    "Shawn Howell", 
    "Arnai Zachary" 
  ), 
  Nadia = list(), 
  Elvira = list( 
    "Damien", 
    "Chaunté" 
  ), 
  Diedre = list( 
    "Craig", 
    "Gregg", 
    "Summer", 
    "Justin", 
    Jamel=list("aa","bb") 
  ), 
  Vonnie = list() 
)

xx=rapply(wayans,length,how = "unlist")
mm=unname(xx)
yy=data.frame(mm,namesxx=sub("[0-9]",x=names(xx),replacement = ""),stringsAsFactors = FALSE)
zz=sub("[0-9]",x=names(xx),replacement = "")
table(zz)

ddply(yy,~namesxx,summarise)


sub("[0-9]",x=names(xx),replacement = "")


vapply(wayans,length,integer(1))
unlist(lapply(wayans,length))
wayans %>% map(length) %>% unlist