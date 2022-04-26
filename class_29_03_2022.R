# rm(list = ls())

# Arrays (arreglos)
#  Para construir un array se deben pasa vectores
#  el parametro dim = c(x,y,z...) donde x(renglones),y(columnas),z(capas) etc son número enteros
mi_vector <-  c(24,31,35,42,49,50,51,58)
mi_array <- array(mi_vector,dim = c(2,4))
View(mi_array)
class(array(data = mi_vector,dim=c(2,4)))

# ciclando el último elelemnto del array ya que se le pasa un vector de 8 elementos y las 
#  dimensiones que se especificaron integran 9 elementos
mi_array <- array(mi_vector,dim = c(3,3))
View(mi_array)

# array de dos filas, 3 columnas y cinco capas
mi_array <- array(data = mi_vector, dim = c(2,3,5))
View(mi_array)
class(mi_array)
# array de dos filas, 3 columnas y cuatro capas
mi_array <- array(data = mi_vector, dim = c(2,3,4))
View(mi_array)
class(mi_array)

# Recuerde que los elementos de un vector deben ser del mismo tipo o esperé un comportameinto
# de coerción de elementos
array(data = c(1,2,"3",4,5,6),dim=c(2,2,3))

# dimensiones de un arreglo
dim(mi_array)
nrow(mi_array)
ncol(mi_array)

# Filas utilizando dim()
dim(mi_array)[1]
# columnas utilizando dim()
dim(mi_array)[2]
# capas utilizando dim()
dim(mi_array)[3]


# mi_array tiene tres dimeniones

# Mandar a llamar toda la segunda capa
mi_array[,,2]
# Mandar a llamar toda la cuarta capa
mi_array[,,4]

mi_array[,2,3]

mi_array[1,2,2]
mi_array[2,3,3]

# Mandar a llamar las columnas 1 y 3 de la cuarta capa
mi_array[,c(1,3),4]

mi_array <- array(data = mi_vector, dim = c(2,3,5))
# Mandar a llamar la segunda fila, tercera columna de la quinta capa
mi_array[2,3,5]
# Mandar a llamar la tercera columna de todas las capas
mi_array[,3,]
# Mandar a llamar las columnas 2 y 3 de las capas 1, 3 y 5
mi_array[,c(2,3),c(1,3,5)]

# Modificacion de elementos
mi_array[1,,]
mi_array[1,,] <- 1

mi_array[,,5]
# Cuando quiero cambiar lso valores de un renglon o columna
# en los arrays, no hay propiedades de ciclado
mi_array[1,,] <- c(1,2)
ncol(mi_array)
dim(mi_array)[2]
mi_array[1,,] <- c(-1,0,1)
mi_array

mi_array[,,5]
mi_array[1:2,1:2,3]  <- array(c(1,2),dim=c(2,2))
mi_array[1:2,1:2,3]
mi_array[,,3]

# Opeaciones con Array

mi_array <- array(data = mi_vector, dim = c(2,3,5))
# Aplicar raíz cuadrada solo a la primera capa

sqrt(mi_array[,,1])

# cambiar la primera capa por las raíces cuadradas de sus elementos
mi_array[,,1] <- sqrt(mi_array[,,1])
mi_array[,,1]
mi_array

# Cambiar la segunda columna de la tercera capa por sus cuadrados
mi_array[,2,3] <- mi_array[,2,3]^2
mi_array[,,3]

# Cambiar el elemento situado en la segunda fila de la tercer columna de la quinta capa por 2022
mi_array[,,5]
mi_array[2,3,5] <- 2022
mi_array[,,5]

# Propiedad de nombres

mi_array <- array(data = mi_vector, dim = c(2,3,5))

# M
# 14:32

mi_array <- array(data = mi_vector,
                  dim = c(2,3,5),
                  dimnames = list(c("hombre","mujer"),
                                  c("edad","peso","altura"),
                                  c("México","Argentina","Perú","Chile","Colombia")))

mi_array
mi_array[,,c("México")]
mi_array[,,1]
# mi_array[,,c("Peru","Chile")]
mi_array[,,c("Argentina","Chile")]
mi_array[,"peso",]

mi_array[,c("edad","altura"),"México"]
 # Una lista con todas las capas
dimnames(mi_array)
dimnames(mi_array)[3]
dimnames(mi_array)[1]
dimnames(mi_array)[2]

dimnames(mi_array)[3]
dimnames(mi_array)[[3]][2]
dimnames(mi_array)[[3]][2] <- "Ecuador"
dimnames(mi_array)[3]

mi_array

# Combinación de arrays
mi_array1  <- array(data=c(1:4), dim = c(2,3))
mi_array2  <- array(data=c(5:9), dim = c(4,3))
mi_array3  <- array(data=c(10:15), dim = c(2,5))

mi_array1
mi_array2
mi_array3

# Uniendo areglos por renglones (se necesita la misma cantidad de columnas)
rbind(mi_array1,mi_array2)
rbind(mi_array1,mi_array3)
# Uniendo arreglos por columnas (se necesita la misma cantidad  de filas)
cbind(mi_array1,mi_array3)
cbind(mi_array1,mi_array2)
