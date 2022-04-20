# rm(list=ls())
# -------------- R1 -------------- #
# a
mi_array <- array(1:20, dim = c(2,3,3,3))
dim(mi_array)
# dim(mi_array) <- elementos del 1 al 20 distribuidos en 2 filas y tres columnas
# con 3 capas que contiene 3 matrices cada una
# Tiene cuatro dimensiones
dim(mi_array)
dim(mi_array)[4]

# b
datos <- array(c(200,200,300,340,230,120,540,400),dim = c(2,2,3),
               dimnames = list(c("France","SP"),
                               c("CPI","GDP"),
                               c("2017","2018","2020")))
datos[1,1,2]
datos['France','CPI','2018']

# c
# dimnames= list(rows,colums,layers)

# d
ejemplo <- array(1:10,c(2,3,3,4,5,3))
ejemplo[,1,,,,]
# columnas

# e
array1 <- array(c(1,5,20,20),dim = c(4,4))
array2 <- array(c(1,5,20,20),dim = c(5,4))

array_merge <- cbind(array1,array2)
# un error porque no tiene el mismo número de filas 
# 4x4 y 5x4 a pesar del mismo nuemro de columans sobra una fila en el segundo array
# rbind() los elementos deben tener el mismo número de columnas
# rbind() los elementos deben tener el mismo número de filas

# f
array1 <- array(c(1,5,20,20),dim = c(4,4))
array2 <- array(c(1,5,20,20),dim = c(5,4))

array_merge <- rbind(array1,array2)
dim(array_merge)
# mismo número de columnas 4, se pueden integrar su filas 5+4
# 9x4

# -------------- R1 -------------- #
# -------------- R2 -------------- #
# a
CuatroDim <- array(1:10,dim = c(2,2,2,2))
CuatroDim

# b
CuatroDim[2,2,2,2]
CuatroDim[2,2,2,2] <- NA
CuatroDim[2,2,2,2]

# C
mean(CuatroDim[!is.na(CuatroDim)])
mean(CuatroDim, na.rm = TRUE)
# d
datos <- array(c(155,261,132000,423.4,321,137000,105,240,118000,157.64,260,139000),dim = c(3,2,2),
               dimnames = list(c("precio","ingreso","empleados"),
                               c("2018","2019"),
                               c("Apple","Microsoft")))
datos
# e
datos['precio',,"Apple"]
datos[1,,2]

dif_precios <- datos[1,2,1]-datos[1,1,1]
dif_precios
dif_precios <- datos['precio',"2019","Apple"] - datos['precio',"2018","Apple"]
dif_precios

# f
datos
apple <- array(datos[,,1],c(3,2,1),
               dimnames = list(c("precio","ingreso","empleados"),
                               c("2018","2019"),
                               c("Apple")))
apple
# g
datos
precios <- array(datos[1,,],c(1,2,2),
                 dimnames = list(c("precio"),
                                 c("2018","2019"),
                                 c("Apple","Microsoft")))
precios
# h
precios <- as.vector(precios)
precios
# -------------- R2 -------------- #
