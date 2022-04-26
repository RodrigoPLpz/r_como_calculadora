# rm(list = ls())
# Matrices. No tienen capas (niveles)
matrix(data = c(1,4,2,7,9,10), nrow = 4, ncol = 5)

#  el parametro byrow acomoda los elementos por renglon de izquierda-derecha.
#  sin el TRUE los acomoda por columna de arriba-abajo.
matrix(data = c(1,4,2,7,9,10), nrow = 4, ncol = 5, byrow = TRUE)
matrix(data = c(1,4,2,7,9,10), nrow = 4, ncol = 5)

# Operaciones de matrices

matriz_1 <- matrix(1:4,nrow = 2,ncol = 3)
matriz_1 <- matrix(1:4,2,3)
matriz_2 <- matrix(200:2003, nrow = 2,ncol = 3)

# Multiplicacion matricial. Se multiplica elemento a elemento (producto puntual o Hadamar)
# Deben tener el mismo tamaño
matriz_1 * matriz_2
matriz_1 - matriz_2
matriz_1 + matriz_2
matriz_1 / matriz_2

# multiplicación escalar
2*matriz_1

matriz_1/2
#  Multiplicacón algebraica
# si A y B son dos matrices, el producto algebraico AB está bien definido, 
# si el número de columnas de A es igual al número de filas de B

# 2x3 * 2x3
matriz_1 %*% matriz_2
matriz_2

matriz_1 <- matrix(1:4,nrow = 2,ncol = 3)
matriz_2 <- matrix(200:2003, nrow = 3,ncol = 2)

matriz_1 %*% matriz_2

matriz_3  <- matrix(c(10:13),nrow = 3, ncol =20)
matriz_3

# 2x3 * 3*20
matriz_1 %*% matriz_3

#  matriz transpuesta renglones por columnas.
matriz_1
t(matriz_1)

matriz_2
t(matriz_2)

#  Fuente de consulta:
# https://r-coder.com/matrix-operations-r/#:~:text=There%20are%20multiple%20matrix%20operations,the%20matrix%20by%20different%20methods

# ---------------------- Dataframes ---------------------- #
# Todas las columnas tienen la misma longitud
mi_dataframe <- data.frame(pais = c("Portugal","Luxemburgo","España"),
                           poblacion = c(1029898,716122,878971),
                           playa = c(TRUE,FALSE,TRUE))
mi_dataframe
View(mi_dataframe)
# Estructura de un dataframe
str(mi_dataframe)
# Resumen estadístico
summary(mi_dataframe)

row.names(mi_dataframe)
row.names(mi_dataframe) <- c("A","B","C")
mi_dataframe
mi_dataframe  <- data.frame(pais = c("Portugal","Luxemburgo","España"),
                            poblacion = c(1029898,716122,878971),
                            playa = c(TRUE,FALSE,TRUE),
                            stringsAsFactors = FALSE)
mi_dataframe

# Muestrame los primeros cinco renglones
head(mi_dataframe)
# Muestrame los últimos cinco renglones
tail(mi_dataframe)

# nombre de variables
names(mi_dataframe)

# nombre de  observaciones
row.names(mi_dataframe)
row.names(mi_dataframe) <- c("U","V","W")
row.names(mi_dataframe)

mi_dataframe_2  <- data.frame(pais = c("Portugal","Luxemburgo","España"),
                            poblacion = c(1029898,716122,878971),
                            playa = c(TRUE,FALSE,TRUE),
                            row.names = c("U","V","W"),
                            stringsAsFactors = FALSE)

row.names(mi_dataframe_2)

names(mi_dataframe_2)[3] <- "Playa" 
names(mi_dataframe_2)

# Indexado similar al de las matrices

mi_dataframe[,c(1,2)]
mi_dataframe[,1:3]

mi_dataframe[1,]
mi_dataframe["U",]

mi_dataframe[,c("poblacion","pais")]

mi_dataframe$pais
mi_dataframe$pais[3]


mi_dataframe$pais

# Cambiar la población de Portugal a 100000
mi_dataframe$poblacion[1] <- 100000
mi_dataframe[1,2]  <- 100001
mi_dataframe[c('U'),c('poblacion')] <- 100002
mi_dataframe

mi_dataframe$playa <- as.numeric(mi_dataframe$playa)
mi_dataframe

mi_dataframe$poblacion <- mi_dataframe$poblacion / 2
mi_dataframe$poblacion

# Expansión de dataframes

otro_dataframe <- data.frame(c("Francia","Alemania"),c(231213,87623),c(TRUE,TRUE))
otro_dataframe

# Para aplicar rbind() las variabels deben tener el mismo nombre
rbind(mi_dataframe,otro_dataframe)

names(mi_dataframe)
names(otro_dataframe)

colnames(otro_dataframe)

colnames(otro_dataframe) <- names(mi_dataframe)

names(otro_dataframe) <- names(mi_dataframe)
colnames(otro_dataframe) <- colnames(mi_dataframe)

colnames(otro_dataframe)
rbind(mi_dataframe,otro_dataframe)

mi_dataframe  <- data.frame(pais = c("Portugal","Luxemburgo","España"),
                            poblacion = c(1029898,716122,878971),
                            playa = c(TRUE,FALSE,TRUE),
                            stringsAsFactors = FALSE)


extra  <- data.frame(capital = c("Lisboa","Luxemburgo","Madrid"),mundial = c(TRUE,FALSE,NA))
extra
cbind(mi_dataframe,extra)

# Agreganod variables a udata.frame
mi_dataframe
mi_dataframe$capital  <- c("Lisboa","Luxemburgo","Madrid")
mi_dataframe

mi_dataframe$mundial <- c(FALSE,FALSE,TRUE)
mi_dataframe

mi_dataframe_2 <- cbind(mi_dataframe,extra)

# Agregando un renglon (observación) mediante un vector a un dataframe
mi_renglon <- data.frame(pais = c("México"),
                        poblacion = 128000000,
                        playa = 1,
                        capital = "CDMX",
                        mundial = TRUE)

mi_dataframe
mi_dataframe <- rbind(mi_dataframe,mi_renglon)
mi_dataframe

# Eliminando variables
mi_dataframe
# Eliminar toda una columna
mi_dataframe$playa <- NULL
# Eliminacón de columnas o renglones
mi_dataframe[-3,]
mi_dataframe[c(-2,-4),]
mi_dataframe[c(-1,-3),]

# mi_dataframe_2[-2,]
# mi_dataframe_2[,c(-2,-4)]
# mi_dataframe_2[2,2] <- NA
# mi_dataframe_2[2,2] <- 125487
# mi_dataframe_2