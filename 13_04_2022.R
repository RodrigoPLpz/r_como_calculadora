# rm(list = ls())
getwd()
dir()

?read.csv
# Carga los archivos TMod_Vic.csv, descriptor_entidad.csv, descriptor_meses.csv y descriptor_delitos.csv
tmod_vic <- read.csv("TMod_Vic.csv")
str(tmod_vic)
names(tmod_vic)
# BPCOD <- Tipo de delito (número) que se enmcuentra en la tabla
# descriptor_ent
# BP1_1 <- mes en que sucedio el delito
# BP1_2C <- entidad en que sucedio el delito
# FAC_DEL <- Factor del delito: es el número de delitos por observación(renglon)
#                             //representa el factor de delitos por persona
descriptor_del <- read.csv("descriptor_delitos.csv") 
str(descriptor_del)
descriptor_ent <- read.csv("descriptor_entidad.csv")
str(descriptor_ent)
descriptor_mes <- read.csv("descriptor_meses.csv")

tmod_vic[10,c("BPCOD","BP1_1","BP1_2C","FAC_DEL")]

# Muestra los nombres de tmod_vic.
names(tmod_vic)
names(descriptor_ent)

# Añade a tmod_vic tres columnas para describir el nombre de la entidad de ocurrencia del delito,
# el nombre del delito y el mes del año en que ocurrió el delito.
tmod_vic <- merge(tmod_vic,descriptor_ent, by.x = "BP1_2C",by.y = "codigo_entidad",all.x = TRUE)

# Cuenta el número de filas por cada entidad de ocurrencia utilizando la función table.
# Convierte el resultado a dataframe: filas_por_entidad.
# View(table(tmod_vic$descripcion_entidad))
filas_por_entidad <- as.data.frame(table(tmod_vic$descripcion_entidad))
# Añade a filas_por_entidad una columna que indique el nombre explícito de cada entidad.
names(filas_por_entidad) <- c("Entidad","Frecuencia Delito")
# ¿Cuál entidad reportó mas delitos en términos de encuestados?
sort(filas_por_entidad$`Frecuencia Delito`,decreasing = TRUE)
filas_por_entidad <- filas_por_entidad[order(filas_por_entidad$`Frecuencia Delito`, decreasing = TRUE),]
filas_por_entidad
# Ciudad de México -> 4062

# Crea un dataframe llamado delitos_entidad donde se tenga una columna con los nombres
# de cada entidad y otra columna con el total de delitos cometidos en esa entidad

delitos_entidad <- filas_por_entidad
delitos_entidad <- delitos_entidad[delitos_entidad$Entidad!="No especificado",]

# Construye un gráfico de barras a partir de delitos_entidad donde las barras se ordene
# n de mayor a menor. Dale un nombre al gráfico e ilumina cada barra de color "darkgreen"

library(ggplot2)
# ?fct_reorder()
# La funcion anterior se encuentra en la paqueteríai forcats
# https://bookdown.org/content/b298e479-b1ab-49fa-b83d-a57c2b034d49/ranking.html
library(forcats)

ggplot(delitos_entidad, aes(x = `Frecuencia Delito` ,y = Entidad)) +
  geom_bar(stat = "identity", width = 0.8, fill = "darkgreen")

ggplot(delitos_entidad, aes(x = Entidad ,y = `Frecuencia Delito`)) +
  geom_bar(stat = "identity", width = 0.8, fill = "darkgreen")

delitos_entidad$ord_fac <- fct_reorder(delitos_entidad$Entidad,delitos_entidad$`Frecuencia Delito`)

graph_fre_delitos_entidad <- ggplot(delitos_entidad, aes(x=`Frecuencia Delito`,y=ord_fac,))+
  geom_bar(stat = "identity", width = 0.8, fill = "darkgreen")+
  ylab("Entidades")+
  labs(title = "Frecuencia de Personas que reportaron ser victimas de un Delito por Entidad", subtitle = "Republica Mexicana")
  
graph_fre_delitos_entidad

# Construir la tabla de excel
# Jalando los codigos de delitos
# names(descriptor_del)
tmod_vic <- merge(tmod_vic,descriptor_del, by.x ="BPCOD", by.y = "codigo_del" ,all.x = TRUE)
names(tmod_vic)

# Se usa la columna "BP1_2C" porque maneja codigos númericos por identidad que es más 
# fácil pasar como un argumento a la función "x"

extraer <- function (x){
  
  return(tmod_vic[tmod_vic$BP1_2C == x,])
}
extraer(1)

# se recorre una lista con el código de los estados y para cada elemento de la lista
# aplica la función extraer
tabla_entidad <- lapply(c(1:32,99), extraer)

armado <- function(df,entidad){
  previo <- as.data.frame(tapply(df$FAC_DEL,
                                 df$descripcion_del,
                                 sum))
  previo$delitos <- row.names(previo)
  colnames(previo) <- c("Absolutos","Tipo")
  previo <- previo[,c(2,1)]
  # Se crea un df que contenga el resultado de la suma de los tipos de delito
  totales <- data.frame(Tipo="Total",
                        Absolutos=sum(previo$Absolutos))
  # Ordenando filas de mayor a menor y obteniendo las primeras cinco filas
  previo <- previo[order(previo$Absolutos,decreasing = TRUE),][1:5,]
  # Se hace un df que contenga la suma de los primeros cinco tipo de delitos
  totales_cinco <- data.frame(Tipo="Total",
                              Absolutos=sum(previo$Absolutos))
  previo <- rbind(NA,previo,totales_cinco,NA)
  # Se empieza a darle formato a la tabla que incluya las columans 
  # vacias y las que hay que llenar
  previo <- data.frame(NA,NA,NA,NA,Tipo=previo$Tipo,NA,Absolutos=previo$Absolutos)
  previo[1,3] <- totales$Absolutos
  previo$Relativos <- (previo$Absolutos *100) / totales$Absolutos #previo[1,3]
  previo[[1,1]] <- entidad
  return(previo)
}
View(armado(tabla_entidad[[1]],"Aguascalientes"))
# tabla_entidad[[1]]$descripcion_entidad
# Como la función armado necesita un argumento que haga referencia al nombre de la Entidad
# se puede hacer una variable qeu contenga la función mapply qeu porporcione una lista que
# recibe la función armado,la tabla de entidades con el tipo de delitos y 
# el nombre de la entidad que representa  la lista de argumentos de todas las entidades
entidades_ordenadas <- mapply(armado,tabla_entidad,descriptor_ent$descripcion_entidad,
       SIMPLIFY = FALSE)
entidades_ordenadas

# Diseño y exportación del dataframe en Excel
write.csv(resultado,"mis_resultados.csv",row.names = FALSE,na="")

# --------------------------------- Anotaciones -------------------------------------------- #
# Se crea una función que reciba un código númerico como argumento
# para construir un dataframe con todas las variables que corresponden
# a dicha entidad segun su código
df_codigo <- function (x){
  return(tmod_vic[tmod_vic$BP1_2C == x,])
}
df_codigo(1)

# Recorremos la lista de lños estados verificando los tipos de delitos
table(tabla_entidad[[1]]$BP1_2C)
table(tabla_entidad[[23]]$BP1_2C)

# Se obtiene segun el estado la frecuencia del tipo de delitos por estado (código númerico)
tapply(tabla_entidad[[1]]$FAC_DEL,
       tabla_entidad[[1]]$descripcion_del,
       sum)

# la lista se convierte en un dataframe
View(as.data.frame(tapply(tabla_entidad[[1]]$FAC_DEL,
                          tabla_entidad[[1]]$descripcion_del,
                          sum)))

# Se empieza a costruir la función que reciba un dataframe con conrme su códgo numérico
# y devuelva la lista de tipos de delitos en un nuevo dataframe
armado <- function(df){
  previo <- as.data.frame(tapply(df$FAC_DEL,
                                 df$descripcion_del,
                                 sum))
  previo$delitos <- row.names(previo)
  colnames(previo) <- c("Absolutos","Tipo")
  return(previo)
}
armado(tabla_entidad[[1]])

# --------------------------------- Anotaciones -------------------------------------------- #