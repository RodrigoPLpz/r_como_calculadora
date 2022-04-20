# rm(list = ls())
# -------------- R1 -------------- #
# a
# Las listas pueden estar formadas por objetos de diferente tipo

# b
# Las listas pueden contener otras listas

# c
multi_object <- list(c(1,2,3),matrix(c(1:4),ncol = 2,nrow = 2),list(TRUE,0,"C"))
str(multi_object)
# Es una lista que contiene tres elementos: un vector númerico, una matrix y una lista
# con tres elementos: logico,numerico y caracter

# d
names(multi_object)
names(multi_object) <- c('vec_num','matriz','lista')
names(multi_object)
multi_object
names(multi_object[[3]]) <- c("Logico","Numerico","Caracter")
names(multi_object[3][[1]]) <- c("Logico","Numerico","Caracter")
multi_object
# e
multi_object <- list(c(1,2,3),matrix(c(1:4),ncol = 2,nrow = 2),list(TRUE,0,"C"))
multi_object[[1]]
# -------------- R2 -------------- #
# a
matem <- list(array(c(1,2),dim = c(2,2,3)),
              c(3,9,81),
              matrix(c(9,0),nrow = 2,ncol = 2))
matem

# b
names(matem) <- c("TresArray","Vector","Matriz")
names(matem)

# c
matem[[4]] <- c("Lo estás logrando")
matem

# d
names(matem)[4] <- c("String")
matem

# matem$String <- c("Lo estás logrando")
# matem

# e
length(matem)
str(matem)

# f
matem$String <- NULL
matem

# g
# matem[2]
matem$Vector <- as.character(matem[[2]])
class(matem[[2]])
matem

# h
NuevaMatriz <- matem[[1]][,,2]
NuevaMatriz















