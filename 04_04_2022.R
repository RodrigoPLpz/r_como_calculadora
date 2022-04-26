# rm(list = ls())

data(mtcars)

# Agregramos la columna brand a mtcars
mtcars$brand  <- c("Mazda","Mazda","Datsun","Hornet","Hornet","Valiant","Duster","Merc",
                   "Merc","Merc","Merc","Merc","Merc","Merc","Cadillac","Lincoln",
                   "Chrysler","Fiat","Honda","Toyota","Toyota","Dodge","AMC","Camaro",
                   "Pontiac","Fiat","Porsche","Lotus","Ford","Ferrari","Maserati","Volvo")

View(mtcars)
mtcars$model  <- row.names(mtcars)

# creamos el dataframe de marcas
brands_origin <- data.frame(
  car_brand = c("Mazda","Toyota","Fiat","Volvo","Skoda"),
  country = c("Japan","Japan","Italy","Sweden","Checa"),
  type = c("A","B","C","D","E")
)
View(brands_origin)
dim(mtcars)

# ------------------ Inner join ------------------ #
?merge()

interno <- merge(mtcars,brands_origin, by.x = "brand", by.y = "car_brand")
str(interno)
dim(interno)
View(interno)


# inner join izquierdo
interno_izq <- merge(mtcars,brands_origin, by.x = "brand", by.y = "car_brand", all.x = TRUE)
# inner join derecho
interno_der <- merge(mtcars,brands_origin, by.x = "brand", by.y = "car_brand", all.y = TRUE)
# Full join
interno_full <- merge(mtcars,brands_origin, by.x = "brand", by.y = "car_brand", all = TRUE)

# Visualiización de datos

# Nube de púntos: dos columnas numericas en un plano xy
?plot()

plot(x = mtcars$hp, y = mtcars$wt, main = "Título del gráfico",
     xlab = "caballos de fuerza", ylab = "peso", col = "blue")

plot(x = mtcars$hp, y = mtcars$wt, main = "potencia",
     xlab = "hp", ylab = "peso",
     bg = "blue", col = "red",
     pch = 22, cex = 1.5)
# Barras. Conteo sobre las diferentes clases que tienen una variable de clasificación
count_cyl <- table(mtcars$cyl)
barplot(table(mtcars$cyl), main = "Número de cilindros")
barplot(count_cyl, main = "Número de cilindros")
barplot(count_cyl, main = "Número de cilindros",
        xlab = "cilindros", ylab = "total",
          col = c("tomato1", "blue", "sienna"))

# Histogramas. Distribuciónd e frecuencias

hist(mtcars$hp, col = "blue")
hist(mtcars$hp,col="darkgreen",breaks=5)
# para saber cuantas barras se necesita se aplica regla de sturges

#  ggplots
library(ggplot2)
# binwidth <- ancho de barra
ggplot(data = mtcars, aes(x = hp)) +
        geom_histogram(fill = "blue", col = "white", binwidth = 50)

ggplot(data = mtcars, aes(x=hp, y=wt)) +
        geom_point(aes(col= "blues9", size = factor(cyl)),alpha = 0.4)
ggplot(data = mtcars, aes(x=hp, y=wt)) +
        geom_point(aes(col= factor(cyl), size = factor(cyl)),alpha = 0.4)

