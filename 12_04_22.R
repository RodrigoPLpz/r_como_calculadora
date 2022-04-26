# rm(list = ls())
library(ggplot2)
vinos <- read.csv("vinos.csv")

names(vinos)
names(vinos)

mex <- vinos[vinos$country == "Mexico",]
por <- vinos[vinos$country == "Portugal",]

# Visualización de distribución de datos
### Histograma suavizado de las calificaciones de los vinos en Portugal

ggplot() +
  geom_density(data=por,aes(x=as.numeric(points))) +
  geom_histogram(data=por,aes(x=as.numeric(points),y=stat(density)),
                 fill = "yellow",alpha=0.5,binwidth = 1)

# Haciendo analisis exploratorio

nrow(por[as.numeric(por$points)<88.5,])
nrow(por[as.numeric(por$points)>=88.5,])

median(as.numeric(mex$points))
table(por[as.numeric(por$points)<88,]$points)
table(por[as.numeric(por$points)>=88,]$points)
## Caso México
ggplot() +
  geom_density(data=mex,aes(x=as.numeric(points))) +
  geom_histogram(data=mex,aes(x=as.numeric(points),y=stat(density)),
                 fill = "blue",alpha=0.5,binwidth = 1)
median(as.numeric(mex$points))

nrow(mex[as.numeric(mex$points)<84,])
nrow(mex[as.numeric(mex$points)>=84,])

table(mex[as.numeric(mex$points)<84,"points"])
table(mex[as.numeric(mex$points)>=84,"points"])

#  Comparando las distribuciones de portugal y méxico
por1 <- data.frame(points = as.numeric(por$points),country = "Portugal")
mex1 <- data.frame(points = as.numeric(mex$points),country = "Mexico")

por_mex <- rbind(por1,mex1)
tail(por_mex)

ggplot(data = por_mex) +
  geom_density(aes(points,color = country,fill=country),alpha=0.5)

# En qué paises la media y la mediana so aproximadamente iguaels, y por tanto sus curvas deben ser casi iguales

medias_medianas <- data.frame(medias = tapply(as.numeric(vinos$points),
                                              vinos$country,
                                              mean),
                              medianas = tapply(as.numeric(vinos$points),
                                                vinos$country,
                                                median))

medias_medianas$simetria <- ifelse(abs(medias_medianas$medias-medias_medianas$medianas)<0.5
                                   ,"Si","No")
chile <- vinos[vinos$country=="Chile",]
ggplot() +
  geom_density(data=chile,aes(x=as.numeric(points))) +
  geom_histogram(data=chile,aes(x=as.numeric(points),y=stat(density)),
                 fill = "red",alpha=0.5,binwidth = 1)

# MODA
# Función para calcular la moda
# La siguiente función truena con columnas multimodales
moda <- function(vector){
  tabla <- as.data.frame(table(vector))
  tabla <- tabla[tabla$Freq == max(tabla$Freq),]
  names(tabla) <- c("Moda","Frecuencia")
  return(tabla)    
}
moda(c(1,1,1,3,1,6,9,2))
moda(c(1,1,1,2,1,2,6,2,2))
moda(mex$province)


# VARIANZA y DESVIACION ESTANDAR
# Tabla de los tres países
mis_paises <- vinos[vinos$country %in% c("Mexico","Portugal","Chile"),]

# Valor promedio de la calidad en cada país
medias = data.frame(puntaje_medio = tapply(mis_paises$points,
                                           mis_paises$country,
                                           function(x){mean(x,na.rm=TRUE)}))
medias$country <- row.names(medias)

# Graficas
ggplot() +
  geom_density(data = mis_paises,
               aes(x=points,fill=country),
               alpha = 0.5, 
               position = "identity") +
  geom_vline(data = medias,
             aes(xintercept = puntaje_medio,color=country)) +
  xlim(70,100)

# Desciación estandar con pequeños temas técnicos
tapply(mis_paises$points,
       mis_paises$country,
       function(x){sd(x,na.rm=TRUE)})

## Buscaremos los países que tienen mas de 50 productos en la tabla
# Agregando una columna 1 permite que se sumen los paises
vinos$FAC <- 1

productos_paises <- data.frame(total = tapply(vinos$FAC,vinos$country,sum))
productos_paises$country <- row.names(productos_paises)
# Por lo que puedo tomar en cuenta solo los paises mayor a algo
mayores <- productos_paises[productos_paises$total>50,]$country
mas_productores <- vinos[vinos$country %in% mayores,]

## Para cada uno de los países anteriores,
## calculamos la media y la desviación

calidad_estable <- data.frame(medias = tapply(mas_productores$points,
                                              mas_productores$country, function(x){mean(x,na.rm = TRUE)}),
                              desviaciones = tapply(mas_productores$points,
                                                    mas_productores$country, function(x){sd(x,na.rm = TRUE)}))
## Ordenamos el dataframe para ir de mas estables a menos estables y 
## de mayor calidad promedio a menor calidad promedio
calidad_estable
calidad_estable$country  <- row.names(calidad_estable)
calidad_estable <- calidad_estable[order(calidad_estable$desviacion,
                                         calidad_estable$media,
                                         decreasing = c(FALSE,TRUE)),]
row.names(calidad_estable) <- 1:nrow(calidad_estable)

View(calidad_estable)


mis_paises <- vinos[vinos$country %in% c("Mexico","Portugal","Chile","Turkey"),]

# Valor promedio de la calidad en cada país
medias = data.frame(puntaje_medio = tapply(mis_paises$points,
                                           mis_paises$country,
                                           function(x){mean(x,na.rm=TRUE)}))
medias$country <- row.names(medias)

# Graficas
ggplot() +
  geom_density(data = mis_paises,
               aes(x=points,fill=country),
               alpha = 0.5, 
               position = "identity") +
  geom_vline(data = medias,
             aes(xintercept = puntaje_medio,color=country)) +
  

