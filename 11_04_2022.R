# rm(list=ls())
x <- 1:4
y <- 101:104
z <- x+y
## Construir una lista de textos: textos = list("Texto 1","Texto 2",...,"Texto n")
# lapply(X,function()). La función se aplica a cada elemento de X que peude ser
# vector,lista o array [puedes considerar dataframes]
# lapply() siempre devuelve una lista
mi_funcion1 <- function(x){
  paste(c("Texto_",x),collapse="")
}

mi_funcion1("Ola ke Ace?")
lapply(c(1:5,"Ola ke Ace?"),mi_funcion1)
# lapply(c(1:5,"Ola ke Ace?"),mi_funcion1)

lapply(1:10,mi_funcion1)

paste("texto_",1:20)

#Dada una lista de textos, convertir las vocales a mayúsculas

cambio_vocales <- function(texto){
  n = nchar(texto)
  letras <- vector()#c()
  for(x in 1:n){
    letras[x] <- substr(texto,x,x)
    if(letras[x] %in% c("a","e","i","o","u")){
      letras[x] <- c("A","E","I","O","U")[letras[x]==c("a","e","i","o","u")]
    }
  }
  return(paste(letras,collapse=""))  
}
cambio_vocales("hola a todos")


mis_frases <- c("La vida es una obra teatral que no importa cuánto haya durado, sino lo bien que haya sido representada",
                "Elige un trabajo que ames, y no tendrás que trabajar un solo día de tu vida",
                "Nuestra mayor gloria no es no caer nunca, sino levantarnos cada vez que caemos")
cambio_vocales(mis_frases)
lapply(mis_frases, cambio_vocales)

# Lectura de archivos:

archivos <- c(1,2,4)
mis_archivos <- lapply(dir()[archivos],read.csv)

# renombrando archivos
names(mis_archivos) <- unlist(strsplit(dir(),split=".csv"))[archivos]

data(mtcars)
mtcars
# calcular el máximo y el promedio de cada de las columnas mpg, hp y wt

mi_max_prom <- function(columna){
  valores  <- c(max(columna),mean(columna))
  names(valores) <- c("Maximo","Promedio")
  return(valores)
}

lapply(mtcars[,c("mpg","hp","wt")],mi_max_prom)
mi_lista <- lapply(mtcars[,c("mpg","hp","wt")],mi_max_prom)
mi_lista$wt


# Quiero una lista con cada una de las subtablas

mtcars[mtcars$carb == 1,]
# quitar duplicados
unique(mtcars$carb)
sort(unique(mtcars$carb))

categorias_carb <- sort(unique(mtcars$carb))

lapply(categorias_carb, function(x){
  mtcars[mtcars$carb == x,]
})


extraer <- function(x){
  return(mtcars[mtcars$carb == x,])
}
lista_carb <- lapply(categorias_carb,extraer)
lista_carb


# lista_carb2 <- do.call(as.data.frame,lista_carb)

# ---------------------- uso de sapply()
# con sapply puedes controlar la salida = una lista o un data frame 
mis_frases
sapply(mis_frases,cambio_vocales,simplify = "array",USE.NAMES = TRUE)
class(sapply(mis_frases,cambio_vocales,simplify = "array",USE.NAMES = TRUE))
View(sapply(mis_frases,cambio_vocales,simplify = "array",USE.NAMES = TRUE))
sapply(mis_frases,cambio_vocales,simplify = "array",USE.NAMES = FALSE)

# Devolviendo un dataframe
sapply(mtcars[,c("mpg","hp","wt")],mi_max_prom,simplify=TRUE, USE.NAMES=TRUE)
sapply(mtcars[,c("mpg","hp","wt")],mi_max_prom,simplify=TRUE, USE.NAMES=FALSE)
class(sapply(mtcars[,c("mpg","hp","wt")],mi_max_prom,simplify=TRUE, USE.NAMES=TRUE))
# Devolviendo una lista
sapply(mtcars[,c("mpg","hp","wt")],mi_max_prom,simplify=FALSE, USE.NAMES=FALSE)
class(sapply(mtcars[,c("mpg","hp","wt")],mi_max_prom,simplify=FALSE, USE.NAMES=FALSE))


# este es para los archvios que jalas de una carpeta
sapply(dir()[archivos],read.csv,simplify = TRUE,USE.NAMES = TRUE)
sapply(dir()[archivos],read.csv,simplify = FALSE,USE.NAMES = TRUE)


lista_carb <- sapply(categorias_carb,
                     extraer,
                     simplify=FALSE,
                     USE.NAMES=TRUE)
lista_carb
class(lista_carb)
# como todas las columnas tienen el mismo nombre
lista_carb2 <- do.call(rbind,lista_carb)

## Insertar una columna a mtcars con la marca del automovil
lista_carb <- sapply(categorias_carb,
                     extraer,
                     simplify=TRUE,
                     USE.NAMES=TRUE)
lista_carb
class(lista_carb)

## Insertar una columna a mtcars con la marca del automovil

nombres_partidos <- strsplit(row.names(mtcars)," ")
mtcars$marca <- sapply(nombres_partidos,function(x){x[1]})
mtcars
strsplit(row.names(mtcars)," ")


# ----------------------- tapply()
# esta función tiene una similitud a usar group_by()

# Agrupa por marcas y calcula el promedio
tapply(mtcars$mpg,mtcars$marca,mean)

# calcular el mínimo de disp por cilindros y engranaje
# agrupando por dos discriminadores <- list(Filas,columnas)

tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear),min)

# calcular el promedio de disp por cilindros, engranaje y marca

tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear,mtcars$marca),min)
# Mercedes
tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear,mtcars$marca),min)[,,17]
#  Unicamente para mercedes
# se cumple o no se cumple para la marca Merc
tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear,mtcars$marca == "Merc"),min)
# False
tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear,mtcars$marca == "Merc"),min)[,,1]
# True

tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear,mtcars$marca == "Merc"),min)[,,2]
mercedes <- mtcars[mtcars$marca=="Merc",]
tapply(mercedes$disp,list(mercedes$cyl,mercedes$gear),min)
tapply(mtcars$disp,list(mtcars$cyl,mtcars$gear,mtcars$marca=="Merc"),min)[,,2]










