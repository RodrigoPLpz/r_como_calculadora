# rm(list = ls())

# Rutas Absolutas
# Obtener ruta de trabajo
getwd()
# "D:/scidata/r_como_calculadora"

# Fijar ruta de trabajo
# setwd("D:/scidata/tareas")
setwd("D:/scidata/r_como_calculadora")

# Rutas Relativas
getwd()
# "D:/scidata/ <- "
# Sube un nivel: avanzar una carpeta a la izquierda
setwd("../")
getwd()
# "D:/scidata/ -> "
# Baja al nivel indicado: avanzar una carpeta a la derecha
setwd("./r_como_calculadora")
getwd()

# Enlista los archivos que hay en la carpeta en la que estamos posicionados
dir()

# Guardar objetos
# save(list = c("nombre del objeto 1", "nombre del objeto 2",...), file = "como quieres que se llame.RData")
s_frame <- data.frame(col=c(1,2,3),col2=c(4,5,6))
s_mi_vector <- c(1:2022)
s_frase <- "Hoy es un gran día"
save(list = c("s_frame","s_mi_vector","s_frase"),file = "test_save_obj.RData")
# para guardar todos los objetos de golpe
save.image("test_save_obj.RData")
# Cargar  objetos
load("test_save_obj.RData")

# Cargar archivos separados por coomas
?read.csv
read.csv(file="NYC temperature data.csv",
         header = TRUE,
         sep = ",")
temperaturas <- read.csv(file="NYC temperature data.csv",
                    header = TRUE,
                    sep = ",")
View(temperaturas)
?write.csv
# Escribir archivos separados por coomas
write.csv(temperaturas,"temperaturas_ny_rev01.csv",
          row.names = FALSE)

mi_data  <- data.frame(colores = c("Azul","Rojo","Verde"), cantidad = c(1,NA,2))

write.csv(mi_data,"mis_colores.csv",
          row.names = FALSE)

# Para saber el tipo de dato de cada variable del dataframe que leyo
colnames(temperaturas)
class(temperaturas$date)
class(temperaturas$average_precipitation)

# library(tidyverse)
# temperaturas_tidy <- read_csv("NYC temperature data.csv")
# View(temperaturas_tidy)
# class(temperaturas_tidy$date)
# class(temperaturas_tidy$average_precipitation)

# desactivar paqueteria tidyverse
# detach("package:tidyverse",unload = TRUE)


# Cargando archivos excel
library(readxl)
mi_excel <- read_excel("NYC temperature data.xlsx")

mi_excel <- read_excel("mi_excel.xlsx",sheet = 2, skip = 5)
View(mi_excel)
mi_excel_2 <- mi_excel[-c(1:2,36:49),-c(3)]
names(mi_excel_2) <- c("Entidad federativa","Tasa total de prevalencia","TasaPreval Hombres","TasaPreval Mujeres")
View(mi_excel_2)


# Escribir archivos en Excel

library(writexl)
write_xlsx(mi_excel_2,"test_excel.xlsx")