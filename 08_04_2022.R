# rm(list = ls())

# CICLOS WHILE

# Dado un vector numérico, sustituir cada uno de sus elementos por su duplicado hasta que encuentre un múltiplo de 5.
# No debe duplicar a este múltiplo de 5 ni a todos los demás elementos
# set.seed() permita que sin importar quien ejecute, se elija los mismos números aleatorios

set.seed(2021)
mi_vector  <- sample(1:100,20)

i = 1
while (mi_vector[i]%%5 != 0) {
  mi_vector[i] <- mi_vector[i]*2
  i = i+1
}
mi_vector

# Que pasa si ninguno de los elementos es multiplo de cinco
mi_vector  <- c(1,2,3,4,6,7,8)

i = 1
while (mi_vector[i]%%5 != 0 & i<=length(mi_vector)) {
  mi_vector[i] <- mi_vector[i]*2
  i = i+1
}
mi_vector

# Dado un string, guardar en una lista el recorrido que se hace desde el inicio hasta cada letra junto con el número de 
#caracteres recorridos.
# Por ejemplo: "hola" debe dar como salida una lista con los elementos "h", "ho","hol", "hola"

mi_frase = "Hola a todos"
n = 1
mi_lista <- list()

while(n<nchar(mi_frase)){
  letra = substr(mi_frase,1,n)
  mi_lista[[n]]= list(extraccion = letra,
                      conteo= nchar(letra))
  n=n+1 
}
mi_lista 
mi_lista[[4]]
mi_lista[[4]][[2]]
mi_lista[[5]]
mi_lista[[5]][[2]]

# Con For
# mi_frase = "Hola a todos"
# # substr(mi_frase,1,2)
# 
# vacio = c()
# i = 1
# for(i in  i:nchar(mi_frase)){
#   # print(substr(mi_frase,1,i))
#   vacio <- append(vacio,substr(mi_frase,1,i))
#   i=i+1
# }
# vacio


# Dada una frase y un símbolo, imprimir letra por letra hasta que se llegue al símbolo. Si el símbolo no está, debe imprimir
# también "No se encontró el símbolo"
mi_frase = "Hola a todos. ¿Cómo están?"
mi_simbolo = "-"
n=1

while(n<=nchar(mi_frase)&substr(mi_frase,n,n)!=mi_simbolo){
  print(substr(mi_frase,n,n))
  n=n+1
}
# N se actualizo a 27
if(n-1 == nchar(mi_frase)){
  print(paste(c("No se encontró el símbolo",mi_simbolo),collapse=" "))
}

# 
# while (n<nchar(mi_frase)) {
#   # print(substr(mi_frase,n,n))
#   letra = substr(mi_frase,n,n)
#   if(letra!=mi_simbolo){
#     print(substr(mi_frase,n,n))
#   }else{
#     break
#   }
#   if(n==nchar(mi_frase)-1){
#     print("No se encontró el símbolo")
#   }
#   n=n+1
# }


# Dados un vector numérico X y un número fijo N, obtener la suma de los elementos de X mientras sea menor que N
X  <- c(1,2,23,16,76,16)
# sum(X[1:2])
N  = 30
m = 1

# while(N>sum(X[1:m]) & m<= length(X)){
#   print(sum(X[1:m]))
#   m=m+1
# }

while(TRUE){
  print(sum(X[1:m]))
  if(sum(X[1:m])>N){
    break
  }
  m=m+1
}


# CICLOS FOR

# Se define el factorial de n como 1 si n=0 y 1*2*3*...*n si n>=1.
# Programar el factorial de n

# factorial de 5 es 1*2*3*4*5=120
# factorial de 3 es 1*2*3=6

mi_num = 8
mi_fac = 1
# for(i in c(1,2,3,4,5)){
#   mi_fac = mi_fac*i
# }

for(i in 1:mi_num){
  mi_fac=mi_fac*i
}
mi_fac  # en R está la función factorial

factorial(8)

palabra=""
for(x in c("a","b","c")){
  palabra = paste(c(palabra,x),collapse = " ")
  print(x)
}

palabra


# Un entero positivo es primo si tiene exactamente 2 divisores positivos.
# Hacer una función que reciba un entero positivo y diga cuáles son sus divisores y si es primo o no.

es_primo <- function(n){
  divisores = c()
  for(x in 1:n){
    if(n %% x == 0){
      divisores = c(divisores, x)
    }
  }
  cantidad_divisores = length(divisores)
  if(cantidad_divisores == 2){
    primo = TRUE
  } else{
    primo = FALSE
  }
  return(list(Divisores = divisores,primalidad = primo))
}

es_primo(5)
es_primo(11)
es_primo(2879)
es_primo(28)

# Una función que reciba un dataframe con columnas numéricas; calcule la suma de los elementos de cada columna y devuelva
# el valor porcentual de cada dato respecto de la suma de la columna a la que pertenece. los nombres de las nuevas columnas
# deben ser iguales a los de las antiguas con el sufijo "relativo"; el orden de aparición de las columnas debe ser intercalando
# cada columna de valores con su columna relativa y dejar una columna vacía

set.seed(2022)

mi_data  <- data.frame(Absoluto_1 = sample(40:80,8,replace = FALSE),
                       Absoluto_2 = sample(40:80,8,replace = FALSE),
                       Absoluto_3 = sample(40:80,8,replace = FALSE),
                       Absoluto_4 = sample(40:80,8,replace = FALSE))


View(mi_data)

nuevo_data <- function(df){
  nvo_data <- rbind(df,colSums(df))
  n_col <- ncol(nvo_data)
  for(i in 1:n_col){
    nvo_data[,i+n_col] <- nvo_data[,i]*100/nvo_data[nrow(nvo_data),i]
  }
  colnames(nvo_data)[(n_col+1):(2*n_col)] <- paste0("Relativo_",c(1:n_col))
  return(nvo_data)
}


mi_data <- nuevo_data(mi_data)
mi_data
mis_columnas <- list()

for(i in 1:n_col){
  mis_columnas[[i]] <- cbind(mi_data[,c(i,n_col+i)],NA)        
}
# do.call(function(),list())
# aplica la función FUN a todos los elementos de la lista
# al mismo tiempo
resultado  <- do.call(cbind,mis_columnas)
View(resultado)

# exoprtar
write.csv(resultado,"mis_resultados.csv",na="")

# x <- rbind(mi_data,colSums(mi_data))
# n_col <- ncol(x)
# for(i in c(1:n_col)){
#   x[,i+n_col] <- x[,i]*100/x[nrow(x),i]
# }

View(nuevo_data(mi_data))


