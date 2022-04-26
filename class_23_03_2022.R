# Los vectores están integrados por elementos del mismo tipo
mi_vector = c("a","hola","tengo hambre","2") 
# función que regresa el número de elementos de un vector
length(mi_vector)
# Indexado de vectores. En r es desde 1
mi_vector[1]
mi_vector[4]

c(2,2022)[1]

# Peso en Kilogramos
# Acceso rapido para simbolo de asignación:Alt + -
# <- 

mis_personas <- c(71.4, 65.1, 63, 94.5)
mis_personas
length(mis_personas)
typeof(mis_personas)
mis_personas[3]
mis_personas[4]

# Peso en libras
2.2046*mis_personas[3]
2.2046*mis_personas[4]
mis_personas_lb <- 2.2046 * mis_personas
mis_personas_lb
(2.2046 * mis_personas)[2]
# Operaciones aritmeticas

c(5,2,0)/2

c(5,2,0)^2

exp(c(5,2,0))

# log(número/vec,base)
log(c(5,2,0),10)
log(100) #logaritmo neperiano
log(100,10)

sqrt(c(5,2,0))

2^2
2**2

mis_personas / 2

# Por alguna razón la balanza estaba mal calibrada y se a cada persona se le dió un peso menor al verdadero.
# En la primer persona falló por 0.4; en la segunda por 0.2; en la tercera por 0.4 y en la cuarta por 0.3

mis_personas_corregido <- mis_personas + c(0.4,0.2,0.4,0.3)

mis_personas_corregido

# Propiedad de ciclado de elementos en operaciones aritmeticas

c(1,2,3)+c(10,20)
c(10,20) + c(1,2,3)
c(1,2,3) + c(4,5,6,7,8.9)
c(1,2,3) + 3

# La balanza falló y pesó 0.5kg de más a cada persona
mis_personas - 0.5

# Operaciones comparativas
# Encuentra las personas cuyo peso es mayor a 64 kg
mis_personas > 64
# Uso del ==
c(1,2,5) == c(2,2,5)
c(1,2,3) == c(1,2,4,1,2,4)


# Jerarquía de operaciones
(2+3)*5
2+(3*5)
sqrt(4)+12
sqrt(4+12)
10/(sqrt(9)*8)


(1-3)*8/0
(1+3)*8/0
exp(0)/(1-1)
0/0
(exp(0)-1)/0

sqrt(-4)
sqrt(-4+0i)

# calcular raiz que no es cuadrada
# raiz n-ésima de un número x es lo mismo que elevar a la 1/n a x
2022^(1/5)
5^6
log(5^6, base = 5)
log(15625, base = 5)

NaN / 0
NaN + 2
0 * NaN
Inf + NaN
NaN / Inf

mis_personas_2 <- c(61,NaN,56.4,70.2,90.5)
mis_personas_3 <- 5 + mis_personas_2
mis_personas_3
mis_personas_3 <- 5 + mis_personas_2[!is.na(mis_personas_2)]
mis_personas_3

?sin()
# Las funciones trigonometricas se calculan en readianes, debe hacer la conversión a deg
sin(45 * (pi/180))

# Tarea C01
sqrt(85)
15/(10^2)
(215+log(100,10))/(exp(100))
# log1p(24)+log(24,2)
log(24)+log(24,2)

#  --------------------------------------

personas <- c("Karla","Rodrigo","Luis","Pedro")
pesos <- c(71.4, 65.1, 63, 94.5)

pes_per <- data.frame(personas,pesos)
