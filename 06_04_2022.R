# rm(list=ls())

mi_funcion1 <- function(x){
  suma_total <- sum(x)
  maximo <- max(x)
  minimo <- min(x)
  return(suma_total+maximo+minimo)
}
# mi_funcion1(x)
mi_funcion1(c(1,2,3,4,5))

mi_funcion1 <- function(x){
  suma_total <- sum(x)
  maximo <- max(x)
  minimo <- min(x)
  return(suma_total-maximo-minimo)
}
# mi_funcion1(x)
mi_vec1 <- c(1,5,27,5,187,34) 
mi_funcion1(mi_vec1)

mi_funcion1_ext <- function(x){
  suma_total <- sum(x)
  maximo <- max(x)
  minimo <- min(x)
  return(c(SumaTotal=suma_total,Suma_total_maximo_minimo=suma_total-maximo-minimo))
}
# mi_funcion1(x)
mi_vec1 <- c(1,5,27,5,187,34) 
totales <- as.data.frame(mi_funcion1_ext(mi_vec1))


## Una función que toma cualquier dataframe X con datos numéricos y nos devuelve el mismo dataframe con un renglón formado 
## por el promedio de cada una de las columnas

mi_funcion2 <- function(X){
  promedios  <- colMeans(X)
  nvo_data  <- rbind(X,promedios)
  row.names(nvo_data) = c(row.names(X),"PROMEDIO")
  colnames(nvo_data) = colnames(X)
  return(nvo_data)    
}


mi_data <- data.frame(val1 = c(1,4,2,5),
                      val2 = c(2,1,1,6),
                      val3 = c(12,4,28,2))
View(mi_data)
mi_funcion2(mi_data)

# collapse <- Cuando quieres pegar los elementos de un vector en otro sólo vector
paste(c("1","2"),collapse = " ")
paste(c("hola","qué","hace","saludos"),collapse = ",")
paste(c("hola","qué","hace","saludos"),collapse = " ")
paste(c("hola","qué","hace","saludos"),collapse = "-")

# Versión vectorizada de la concatenación c()
paste(c(1,2,3),c("uno","dos","tres"),c(TRUE,TRUE,FALSE),sep = "---")



# Crear una función que acepte un vector de characteres y forme una palabra con la primer letra de cada entrada
mi_funcion3 <- function(palabras){
  primera <- substr(palabras,1,1)
  palabra <- paste(primera, collapse = "")
  return(palabra)
}
# substr("hola a todos",1,4)
# substr(c("hola a todos","Ya me voy"),3,8)
mi_funcion3(c("Hola","cuanto","adiós","SciData"))
mi_funcion3(c("Héctor","Garduño","Perez","Goméz"))
mi_funcion3(c("Hola a todos","Ya me voy","Nos vemos"))


# Una función que resuelve cualquier ecuación de segundo grado
mi_funcion4 <- function(a,b,c){
  discriminante  <- b^2-4*a*c+0i
  resp1 <- (-b + sqrt(discriminante))/(2*a)
  resp2 <- (-b - sqrt(discriminante))/(2*a)
  return(c(resp1,resp2))
}

# Resolver x^2+(4-2i)x-8i=0
mi_funcion4(1,4-2i,-8i)

# Resolver x^2+1=0
mi_funcion4(1,0,1)

# Una función que, dado un vector de strings, te devuelve los elementos que tienen una cantidad par de letras
# y, en dado caso, te diga cuántas letras tiene. Además también el total de palabras que cumplen la condición

mi_funcion5 <- function(palabras){
  cantidades = nchar(palabras)
  pares = cantidades %% 2 == 0
  palabras_pares = palabras[pares]
  lista = list(palabras_pares,
               cantidades[pares],
               length(palabras_pares))
  names(lista) = c("Palabras","Cantidades","Total")
  return(lista)
}
# palabras = c("123","hola","1","ab","cd")
# cantidades = c(3,4,1,2,2)
# pares = c(FALSE,TRUE,FALSE,TRUE,TRUE) cantidades %%2 == 0
# palabras[pares] = c("hola","ab","cd")
# cantidades[pares]=c(4,2,2)
# length(palabras[pares]) = 3
mi_vector  <- c("123","hola","1","ab","cd")
mi_funcion5(mi_vector)
mi_funcion5(c("Hola a todos","adios","ab"))

nchar((mi_vector))
nchar("hola a todos")
nchar(c("hola","a","todos"))

# Sin contar espacio vacios en una cadena
nchar("hola a todos")
strsplit("hola a todos",split = " ")[1]
paste(strsplit("hola a todos",split = " ")[[1]],collapse = "")
nchar(paste(strsplit("hola a todos",split = " ")[[1]],collapse = ""))


# Una función que nos diga si un número entero tiene raíz cuadrada entera

mi_funcion6 <- function(x){
  raiz = sqrt(x)
  salida = as.logical(as.integer(raiz)-raiz)
  # as.logical(-0.7894546464)
  return(!salida)
}

mi_funcion6(5)
mi_funcion6(c(1,4,3))

# Una función que nos dice qué palabras de un vector de strings comienzan o no con una vocal.

mi_funcion7 <- function(mis_palabras){
  vocal_si <- mis_palabras[substr(mis_palabras,1,1) %in% c("A","E","I","O","U","a","e","i","o","u")]
  vocal_no <- mis_palabras[! substr(mis_palabras,1,1) %in% c("A","E","I","O","U","a","e","i","o","u")]
  return(list(con_vocal=vocal_si, sin_vocal = vocal_no))
}


mi_funcion7(c("Esta","ha","sido","una","gran","clase"))
mi_funcion7(c("Esta","ha","sido","una","gran","clase","2022"))


mi_funcion8 <- function(){
  print("hola a todos")
}

mi_funcion9 <- function(x){
  x <- x[,c(2,1)]
  colnames(x) = c("Hola","ADIOS")
  # x, si colcas x, la función te va a regresar el último renglon de la función
  # pero siempre colocar return
  # return()
}
mi_data <- data.frame(col1=c(1:4),col2=c("a","b","c","d"))
mi_funcion9(mi_data)


