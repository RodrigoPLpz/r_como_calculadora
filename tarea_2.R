 # rm(list= ls())
# tarea 2
# -------------- R1 -------------- #
# a
ciudades <- c("Lisboa","Milan","París")
a <- ciudades[1]

# b
a <- c(1,3,5)
b <- c(1,2)
bres <- a + b
# bres <- (1+1,+3+2,5+1)=(2,5,6)

# c
2*c(100,100,250)
# c <- (2*100,2*100,2*250)=(200,200,500)

# d
a <- c(1,4,5,6)
b <- c(2,4,5,5)
d <- a + b
# d <- (1+2,4+4,5+5,6+5)=(3,8,10,11)

# -------------- R1 -------------- #
# -------------- R2 -------------- #
# a
edades <- c(12,11,12,13,14,13,12,10,12,12,14,13)
media_edades <- mean(edades) #12.3333
otras_edades <- edades<11 | edades>13
# edades[edades<11 | edades>13]

# b
edades
names(edades) <- c("Juan", "Raquel", "Jorge",
                   "Ana", "Teresa", "Samuel",
                   "Marcos", "Andrés", "Kate",
                   "Juana", "Marta", "David")
names(edades)

# c
edades[c("Raquel","Ana")]

# d
edades[5]
edades[5] <- 13
edades[5]

# e
baja_edad <- edades[edades<12]

# f
precio <- c(5.6,11.2,4.5,0.25,1,23)

# g
half_price <- precio/2

# h
promocion <- precio[c(1,3,5)]*c(.80,.60,.50)

# i
precio[1:3]
# j
max_precio <- max(precio)

# k
precio_transformado <- (precio+5)/(precio)
# -------------- R2 -------------- #