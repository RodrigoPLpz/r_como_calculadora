# rm(list = ls())

data(mtcars)
# ---1
View(mtcars)
# ---2
?mtcars
# ---3
head(mtcars)
# head(mtcars,10)
tail(mtcars)
str(mtcars)

# ¿Cómo se llaman los registros de mtcars? ¿Cómo se llaman los campos?
row.names(mtcars)
names(mtcars)
#   Muestra un resumen de cada una de las columnas.
summary(mtcars)
# Muestra la tabla formada por los elementos con 4 cilindros.
mtcars[mtcars$cyl == 4,]
 
# Muestra la tabla formada por los elementos con 4 o 6 cilindros.
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6,]
mtcars[mtcars$cyl %in% c(4,6),]
# Muestra la tabla formada por los elementos con 4 o con tres engranes (los engranes es la columna gear).
mtcars[mtcars$gear == 4 | mtcars$gear == 3,] 
mtcars[mtcars$gear %in% c(4,3),]
# Muestra la tabla formada por los elementos con 4 y con tres engranes (los engranes es la columna gear). ¿Cuántos registros cumplen esta condición?
nrow(mtcars[mtcars$gear == 4 | mtcars$gear == 3,])
#   Muestra la tabla formada por los elementos que no tienen 4 cilindros.
mtcars[mtcars$cyl != 4,]
mtcars[-(mtcars$cyl == 4),]

# Muestra nuevamente la tabla formada por 4 o 6 cilindros utilizando %in%.
mtcars[mtcars$cyl %in% c(4,6),]
# Muestra los registros de los elementos que tienen mas de 100 caballos de fuerza pero y a lo más 105.
mtcars[mtcars$hp>100&mtcars$hp <= 105,]
mtcars[mtcars$hp%in%c(100,101,102,103,104,105),]
data1 <- data.frame(pais=c("Mex","Bra","Qa"),grupo  = c(1,2,3))
data2 <- data.frame(pais=c("Arg","Ita","Chi"),numero  = c(1,2,3), grupo = c("a","b","c"))

names(data1)
names(data2)

names(data2)%in% names(data1)

# Añade una columna donde esté el cociente de los cilindros con el peso.
mtcars$cyl/mtcars$wt 
ncol(mtcars)
mtcars[12] <- mtcars$cyl/mtcars$wt
mtcars$col_extra <- mtcars$cyl/mtcars$wt
ncol(mtcars)
# Ordenar mtcars respeceto al número de cilindros de forma creciente y luego decreciente.
# creciente
mtcars[order(mtcars$cyl),]
# decreciente
mtcars[order(mtcars$cyl, decreasing = TRUE),]

mi_vector <- c(1,3,3,2,6)
#  Devuelve los indixes de elementos ordenados
sort(mi_vector)
# Devuelme lementos ordenados
order(mi_vector)

# Ordener mtcars respecto al número de cilindros y, en caso de empate, respecto de la cilindrada. 
# Ambos en forma creciente (la cilindrada es Displacement).
# Priemer ordenad por cilindros y leugo por el despalzamiento (cilindrada)
mtcars[order(mtcars$cyl,mtcars$disp),]
# Ordener mtcars respecto al número de cilindros y, en caso de empate, respecto de la cilindrada.
# El número de cilindros en forma decreciente y la cilindrada de forma creciente.
mtcars[order(mtcars$cyl,mtcars$disp, decreasing = c(TRUE,FALSE)),]














