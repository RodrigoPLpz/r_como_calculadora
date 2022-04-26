# rm(list = ls())
mi_lista <- list(1,2,"rodrigo")

mi_lista <- list(nombre="rodrigo",
                 edad=32,
                 empleado = TRUE,
                 ocupación = "consultor")

mi_lista <- list(1,2,"hola",list(TRUE,FALSE,TRUE))

View(mi_lista)

class(mi_lista)
typeof(mi_lista)

mi_lista  <- list(c(1,2,3),
                  array(data = 1:4, dim = c(2,2)),
                  TRUE)
mi_lista

mi_lista <- list(mi_vector = c(1,2,3),
                 mi_array = array(data = 1:4, dim = c(2,2)),
                 mi_booleano = TRUE)

names(mi_lista) <- c("es_vector","es_array","es_booleano")
mi_lista

names(mi_lista)[3] <- "mi_logico"
mi_lista


lista_nombres <- list(c(1,2,3), letra_a = "a", TRUE )
# lista_nombres <- list(c(1,2,3), "a", TRUE )
lista_nombres
names(lista_nombres)

# dim se aplica a  matrices, arrays u dataframe y length() sólo unidimensionales como las listas
length(mi_lista)
dim(mi_lista)

str(mi_lista)

# indexado en listas
# dos niveles: subyacente(entra al objeto que hace referencia[[]]) 
# y nivel de lista (saber que hay en la posición [])

mi_lista
mi_lista[[2]]
mi_lista[[1]]
mi_lista$mi_vector
# con la el indexado anterior se espera una matrix
class(mi_lista[[2]])
# devuelve el tipo "lista" en que vive el elemento array
class(mi_lista[2])

# Fuera de la casa
mi_lista[c(2,3)]
# Dentro de la casa
mi_lista[[1]]
mi_lista[[2]]
mi_lista[['es_vector']]
mi_lista[[2]][2,]
mi_lista[[2]][2,2]
mi_lista[["es_array"]][2,2]

mi_lista[[2]][1,2]
mi_lista[[2]][2,1]

mi_lista[[1]][2]

mi_lista["mi_logico"]
mi_lista[["mi_logico"]]
# Funciona porque el elemnto que llamo es unideimensional
mi_lista["mi_logico"] <- FALSE
mi_lista[["mi_logico"]] <- c(TRUE,FALSE,TRUE)
mi_lista[["mi_logico"]][3] <- FALSE

names(mi_lista) <- c("mi_vector","mi_array","mi_logico")
# Pero si tuviera varias dimensiones ocomo un array
mi_lista[["mi_array"]][1,] <- c(3,4)

mi_lista[["mi_vector"]] <- c(5,6,7)

# Añadir elementos. Usar nivel de objeto subyacente
ejemplo_lista  <- list(c("a","b","c"),array(1:10,dim=c(2,5)))
ejemplo_lista

ejemplo_lista[[5]] <-  c(1,2,3)
ejemplo_lista
ejemplo_lista$nuevo <- c(FALSE,TRUE)
ejemplo_lista

# Cambiando el valor. Usar nivel d objeto subyacente
ejemplo_lista[[5]] <- TRUE
ejemplo_lista

# Eliminando elementos.No importa el nivel.
ejemplo_lista  <- list(c("a","b","c"),array(1:10,dim=c(2,5)),TRUE)
ejemplo_lista
ejemplo_lista[2] <- NULL
ejemplo_lista[[2]] <- NULL
ejemplo_lista[-2]

ejemplo_lista  <- list(c("a","b","c"),array(1:10,dim=c(2,5)),TRUE)
names(ejemplo_lista) <- c("mi_lista","mi_array","mi_logico")
ejemplo_lista["mi_array"] <- NULL
ejemplo_lista$mi_array <- NULL
ejemplo_lista

ejemplo_lista  <- list(c("a","b","c"),array(1:10,dim=c(2,5)),TRUE)
# wrong ejemplo_lista[c(-1,-3)]
ejemplo_lista[-c(1,3)]

nueva_lista <- ejemplo_lista[-c(1,3)]
ejemplo_lista[c(1,3)] <- NULL
ejemplo_lista


ejemplo_lista  <- list(c("a","b","c"),array(1:10,dim=c(2,5)),TRUE)
ejemplo_lista[c(1,3)][[1]]
ejemplo_lista[c(1,3)][[2]]

# Combinación de listas

lista1 <- list(c(1,2),"A")
lista2 <- list("l1" = c(10,11),matrix(1:10,nrow=5,ncol=2))
lista1
lista2

lista_extendida <- c(lista1,lista2)
class(lista_extendida)
str(lista_extendida)
