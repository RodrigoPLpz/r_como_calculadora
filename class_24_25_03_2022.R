c(10000,20000,4000,3000) #crea un vector pero no lo guarda en la memoria
c(1,2,3,"hola")
c(1,2,"3",4,5)
poblacion <- c(10000,20000,4000,3000)

rm(poblacion)

poblacion <- c(10000,20000,4000,3000)

2 * poblacion

# como escribo la susesión de 100:200 que no incluya el 150
c(100:149,151:200)
# Dame todo exepto (-) la posición 51
(100:200)[-51]
c(100:200)[c(1:50,52:99)]
c(2*(51:100)-1)

# pares
2*(1:50)
# impares
2*(1:50)-1

poblacion_texto  <- c(10000,20000,"4000",3000)
poblacion_texto
# creación del objeto e impresion de su valor
(poblacion_texto  <- c(10000,20000,"4000",3000))

2*poblacion_texto

# Propiedad de indexado

mis_personas  <-  c(71.4, 65.1, 63, 94.5)
mis_personas[4]
mis_personas[c(1,3)]
mis_indices <- c(1,3)
mis_personas[mis_indices]


mi_vector <- c("A","B","C","D","E")
mi_vector
longitud <- length(mi_vector)
pares <- 2*(1:2)
mi_vector[pares]

# susesiones
2:4
4:17

mi_ejemplo  <- c(2,5,2,4,6,2,6,2,7,8,5,7,6,3,5,6,8,3,2)
mi_ejemplo[5:length(mi_ejemplo)]


c(1,3,2:6,10)
mis_datos  <- c("L","L","H","A","A","L","M","A","B","C","L")
# trae las posiciones
mis_datos[c(1,3,6:8,10)]
# no traigas (-) las pósiciones 
mis_datos[-c(1,3,6:8,10)]

# Operaciones con vectores
# Funciones de agregación
# sum() para la suma aritmetica
# mean() para la media aritmética.
# max() para el máximo.
# min() para el mínimo.

mis_personas
sum(mis_personas)
prod(mis_personas)

2+NaN
faltante_NA <- c(1,2,3,NA,4,8)
faltante_NA
sum(faltante_NA)
sum(faltante_NA, na.rm = TRUE)

faltante_NaN <- c(1,2,3,NaN,4,8)
faltante_NaN
sum(faltante_NaN)
sum(faltante_NA, na.rm = TRUE)

faltante_NULL <- c(1,2,3,NULL,4,8)
faltante_NULL
sum(faltante_NULL)

View(faltante_NA)


min(mis_personas)
max(mis_personas)
mean(mis_personas)

mean(faltante_NaN)
mean(faltante_NaN, na.rm = TRUE)

# Funciones de agregación de min y max se pueden aplicar a strings

max(c("Adelante","Ahora","ROdrigo"))
min(c("Adelante","Ahora","ROdrigo"))

max(c("1000","4","10000","0.5"))
min(c("1000","4","10000","0.5"))


promedio  <- mean(faltante_NaN,na.rm=TRUE)
promedio

# Residuo
2022 %% 11

# División entera
2022 %/% 11

# Con residuo calculamos hora en 12hrs
# 0  1  2  3   4  5   6   7   8   9   10  11
# 12 13 14 15 16  17  18  19  20  21  22  23
20%%12
21%%12
13%%12
11%%12

# Ordenaciones
?sort()

sort(c(33,21,54,3,-7))
sort(c(33,21,54,3,-7), decreasing = TRUE)

sort(c(33,21,NaN,54,3,-7), decreasing = TRUE)

sort(mis_datos <- c("L","L","H","A","A","L","M","A","B","C","L"))
sort(mis_datos <- c("L","L","H","A","A","L","M","A","B","C","L"), decreasing = TRUE)


sort(faltante_NA)
sort(mis_datos)
sort(mis_datos,decreasing=TRUE)

# Operadores de comparación

mis_personas  <- c(71.4, 65.1, 63, 94.5)
mis_personas > 63

mis_indices_log <- mis_personas > 63


# Devolver los valores cuya posición quedo verdadero
mis_personas[mis_personas > 63]
mis_personas[mis_indices_log]

# El número 20278781 es múltiplo de 3?
20278781 %% 3 == 0
20278781 %% 3 != 0

mis_personas[mis_personas > 63]
# Devuelve el indice de los elementos del vector que cumplen con la condición
which(mis_personas > 63)

# Operadores Lógicos
mis_personas

mis_personas < 65 | mis_personas > 70

mis_personas > 65 & mis_personas < 70

# Pesos que no cumplen:mas grande 1ue 65 y menores qeu 70
!(mis_personas > 65 & mis_personas < 70)

# Coercion de numeros a boolenanos. Los booleanos los convierte en numeros:0,1
X <- c(TRUE,FALSE,0,6)
Y <- c(FALSE,TRUE,FALSE,TRUE)

!X
X & Y
X | Y
# X && Y
# X || Y

# Nombres en los vectores

mis_personas  <- c(71.4, 65.1, 63, 94.5)
names(mis_personas)
names(mis_personas) <- c("Luis","Raúl","María","Ramón")
names(mis_personas)
mis_personas


mis_personas[c("Luis","Raúl","María","Ramón")]
sort(names(mis_personas))

which(mis_personas > 60 & mis_personas < 70)
names(which(mis_personas > 60 & mis_personas < 70))
names(which(mis_personas > 60 & mis_personas < 70)) <- c("Medios","Medios")

# Modificamos los elementos de un vector

## Supongamos que a Luis se le asigno un peso incorrecto y su peso verdadero es 65

mis_personas
mis_personas["Luis"] <- 65 # Como el índice de Luis es 1, también se pudo hacer mis_personas[1]<-65
mis_personas
mis_personas[1] <- 71.4
mis_personas

# Supongamos que nos equivocamos en las personas 2,3 y 4 y los pesos correctos son 63, 64 y 90.9

mis_personas[2:4] <- c(63,64,90.9)
mis_personas

mis_personas <- c(71.4, 65.1, 63, 94.5)

# Añadimos un nuevo elemento
length(mis_personas)
mis_personas[5] <- c(90)
mis_personas
names(mis_personas) <- c("Luis","Raúl","María","Ramón","Alberto")
mis_personas["Ana"] <- 70
mis_personas[9] <- 50
mis_personas
mis_personas[10:15] <- 10:15
mis_personas

names(mis_personas)[c(7,8)] <- c("Juan","Marco")
mis_personas
names(mis_personas)[9:15] <- c("A","B","C","D","E","F","G")
mis_personas

# Eliminando elementos
mis_personas <- c(71.4, 65.1, 63, 94.5)
mis_personas <- mis_personas[-2]
mis_personas

mis_personas <- c(71.4, 65.1, 63, 94.5,90)

# Si a cada persona la queremos bajar 20%, 20%, 10%, 5% y 5%, ¿cuánto pesarían?

(mis_personas*(c(0.80,0.80,0.90,0.95,0.95)))
(1-c(0.2, 0.2, 0.1, 0.05, 0.05))*mis_personas

# Cambiemos a las personas con peso mayor a 70 por el valor 70
mis_personas[mis_personas > 70]  <- 70
mis_personas_70 <- mis_personas[mis_personas>70] <- 70
mis_personas

# Cambiemos el peso de las personas en posición 2 y 4 por su promedio.
mis_personas[c(2,4)]  <- mean(mis_personas[c(2,4)])
mis_personas_prom <- mis_personas[c(2,4)] <- mean(mis_personas[c(2,4)])
mis_personas

# Tomemos a las personas cuyo peso es mayor a 68 y guardemoslas en otro vector.
mis_personas <- c(71.4, 65.1, 63, 94.5,90)
mis_personas_mas_68 <- mis_personas[mis_personas>68]
mis_personas_mas_68
mis_personas_pesadas  <- mis_personas[mis_personas > 68]
mis_personas_pesadas




