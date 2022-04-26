# Tipos de datos

# Character(r)/string(python)
mensaje <- "hola soy nuevo en r"
typeof(mensaje)
class(mensaje) # esta es la función que más se usa para identificar un tipo de variable

# Númerico. Al menos que se le especifique a R que es un entero, R lo interpreta como numerico
Num = 1
class(Num)
Num = 1L
class(Num)
Num = 1
Num = as.integer(1)
class(Num)

Num_float <- 2.567832
Num_float_integer <- as.integer(Num_float)
class(Num_float_integer)

Num_sem_integer <- 2
Num_integer_float <- as.numeric(Num_sem_integer)
class(Num_integer_float)

# Boleanos

bools <- c(TRUE,FALSE)

as.numeric(bools)
as.integer(bools)


# Funciones para saber tipo de datos
# class() es un concepto orientadoa  objetos, enla practica sirve para saber que tipo de cosas se le pueden aplicar
# typeof() como la computadora gestiona un dato en su memoria

numero = 1
class(numero)
typeof(numero)  

entero = 1L #(cuando no especificas la l lo toma como flotante)
class(entero)
typeof(entero)  

palabra <-  " este es un perico"
class(palabra)
typeof(palabra)

mi_vector = c(1,2,3)
class(mi_vector)
typeof(mi_vector)

mi_vector = c(1,"2",3)
class(mi_vector)
typeof(mi_vector)

mi_vector = c(1,"2",3)
mi_vector_cor <- as.integer(mi_vector)
class(mi_vector_cor)
typeof(mi_vector_cor)

# Funciones para testear clase de datos
is.numeric(1)
is.character(2)

is.numeric("hola mundo")
is.logical("hola mundo que háce")
is.character("hola a todos")

is.numeric(TRUE)
is.logical(FALSE)
is.character(TRUE)
is.character("TRUE")

#  Conversiones entre clases de datos
mi_vector = c(1,2,3)
mi_vector_char <- as.character(mi_vector)
is.character(mi_vector_char)
class(mi_vector_char)
#  No todos se puede convertir en número pero si todo a caracter
as.numeric("2022")
as.numeric("perico")
as.logical("FALSE")
as.character(FALSE)
as.character(1254899)

(mis_pesos  <- c(71.2,78.5,"No es un peso",73.2))
# Lo que no se peude convertir lo rellena con NA
(mis_pesos_num  <- as.numeric(mis_pesos))

# Los valores logicos los convierte a númerico:1-TRUE,0-FALSE
mi_vector_logico  <- c(TRUE,TRUE,FALSE,TRUE,FALSE)
as.numeric(mi_vector_logico)

# Fechas

class(as.Date("2022-03-28"))
as.numeric(as.Date("2022-03-28"))


# Factores
#  Se usan para gestionar clasificaciones
clasificaciones  <- c("América","Europa","Asia","Africa","Oceania","Antartida","América","Asia")

clasificaciones_factor <- factor(clasificaciones)
nlevels(clasificaciones_factor)

class(factor(clasificaciones))
typeof(clasificaciones_factor)
as.numeric(clasificaciones_factor)

sexos <- c("hombre","mujer","hombre","hombre","mujer")
sexos_factor <- factor(sexos)
levels(sexos_factor)
nlevels(sexos_factor)
sexos_factor

as.numeric(sexos_factor)

sexos_factor <- factor(sexos)
levels(sexos_factor) <- c("H","M")
sexos_factor
as.numeric(sexos_factor)


altitudes  <- c("media","alta","baja","alta","media")
factor(altitudes)
factor(altitudes, order = TRUE, levels = c("baja","media","alta"))
altitudes_factor  <- factor(altitudes, order = TRUE, levels = c("baja","media","alta"))
as.numeric(altitudes_factor)

sexos <- c("hombre","mujer","hombre","hombre","mujer")
sexos_factor <- factor(sexos, order = TRUE, levels = c("mujer","hombre"))
as.numeric(sexos_factor)
as.character(sexos_factor)

summary(sexos_factor)


# -------------------------------- Tarea 2 -------------------------------- #

# -------------------------------- Tarea 2 -------------------------------- #
