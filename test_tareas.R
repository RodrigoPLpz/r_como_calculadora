# rm(list = ls())
# Extrae el segundo elemento de la tercera dimensión de TresArray
# y llámalo NuevaMatriz.

matem <- list(array(c(1,2),dim = c(2,2,3)),
              c(3,9,81),
              matrix(c(9,0),nrow = 2,ncol = 2))
matem

dim(matem[[1]])[1]
dim(matem[[1]])[2]
dim(matem[[1]])[3]

matem[[1]][2,1,3]

matem[[1]][,,2]

# Una función que reciba un dataframe con columnas numéricas; calcule la suma de los elementos de cada columna y devuelva
# el valor porcentual de cada dato respecto de la suma de la columna a la que pertenece. los nombres de las nuevas columnas
# deben ser iguales a los de las antiguas con el sufijo "relativo"; el orden de aparición de las columnas debe ser intercalando
# cada columna de valores con su columna relativa y dejar una columna vacía
rm(list = ls())
set.seed(2022)
mi_data  <- data.frame(Absoluto_1 = sample(40:80,8,replace = FALSE),
                       Absoluto_2 = sample(40:80,8,replace = FALSE),
                       Absoluto_3 = sample(40:80,8,replace = FALSE),
                       Absoluto_4 = sample(40:80,8,replace = FALSE))


View(mi_data)

# Una función que reciba un dataframe con columnas numéricas; calcule la suma de los elementos de cada columna 

mi_data_por <- function(df){
  new_data <- rbind(df,colSums(df))
  new_col <- ncol(new_data)
  for(i in 1:new_col){
    # print(i+new_col)
    new_data[,i+new_col] <- (new_data[,i]*100)/sum(df[,i])
  }
  names(new_data) <- c(names(new_data)[1:4],paste("Relativo_",c(1:new_col)))
  # colnames(new_data)[(new_col+1):(2*new_col)] <- paste0("Relativo_",c(1:new_col))
  return(new_data)
}
mi_data_por(mi_data)

# do.call(function(),list())
# aplica la función FUN a todos los elementos de la lista
# al mismo tiempo


