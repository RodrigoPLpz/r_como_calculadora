# rm(list = ls())
# -------------- R1 -------------- #
# a
matrix(c(1:14),nrow = 2,ncol = 14)

# b
?matrix

# c
matrix(c(0,1,1,1,0,2,1,1),nrow = 2,ncol = 4,byrow = TRUE)

# d
m1 <- matrix(1:24,nrow = 2,ncol = 12)
m2 <- matrix(1:46,nrow = 12,ncol = 23)
dim(m1)
dim(m2)
# Las operaciones aritmeticas con matrices sólo se puede hacer cuando tienen el mismo número de dimensiones
# porque porducen otra matriz de la misma dimensión
# m1*m2
# m1+m2
# La multiplicación matricial se puede realiar cuando el número de columnas de la primera es igual al
# número de renglones de la segunda
m1%*%m2
# -------------- R2 -------------- #
# a
ejemplo <- matrix(c(100,23,42,23,34,342,203),nrow = 3,ncol = 2)
ejemplo

# b
unos <- ejemplo/ejemplo

# c
log(ejemplo[,1],10)
unos[,1] <- log(ejemplo[,1],10)
unos

# d
ejemplo[2,]*0.33
# en el inciso se especifica columna pero esta tiene 3 elementos y el renglon con que
# se opera 0.33 es de dos
unos[,2] <- c(ejemplo[2,]*0.33,NA)
unos

# e
unosT <- t(unos)

# f
# dim(ejemplo)
# dim(unosT)
ncol(ejemplo) == nrow(unosT)
# coincide el número de columnas del primer elemento y las filas el segundo elemento
ejemplo%*%unosT