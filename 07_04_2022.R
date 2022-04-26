# rm(list=ls())

# mi_animal <- readline(prompt="¿Qué animal eres?: ")
# La línea anterio no se ocupa paa hacer analisis de datos.
mi_animal <- "perro"
mi_animal2 <- "gato"
if(mi_animal2 == "gato"){
  print("Este animal hace 'miau'")    
}
print("No tengo dipónible el animal que has elegido")


if(mi_animal != "gato"){
  print("No tengo dipónible el animal que has elegido'")    
}else{
  print("Este animal hace 'miau")
}

es_gato <- function(opc){
  if(mi_animal2 != opc){
    print("No tengo dipónible el animal que has elegido'")    
  }else{
    print("Este animal hace 'miau")
  }
}
es_gato("gato")


mi_guerrero <- "Adame"

if(mi_guerrero == "Yamcha" | mi_guerrero == "Krilin" | mi_guerrero == "Adame"){
  print("Seguro se va a morir")
  print("!Goku date prisa!")
} else{
  print("Tenemos oportunidad de que nos salve")
}
print("Así pasa en DBZ")

dbz <- function(mi_guerrero){
  if(mi_guerrero == "Yamcha" | mi_guerrero == "Krilin" | mi_guerrero == "Adame"){
    print("Seguro se va a morir")
    print("!Goku date prisa!")
  } else{
    print("Tenemos oportunidad de que nos salve")
  }
  print("Así pasa en DBZ")
}
dbz("Adame")




dbz2 <- function(mi_guerrero){
  if(mi_guerrero == "Yamcha" | mi_guerrero == "Krilin"){
    print("Es un humano")
  } else if(mi_guerrero == "Gokú" | mi_guerrero == "Vegueta"){
    print("Es un saijajín")
  } else if(mi_guerrero == "18" | mi_guerrero == "17"){
    print("Es un androide")
  } else if(mi_guerrero == "Pikoro"){
    print("Es un namekuseí")
  } else{
    print("No es un personaje importante")
  }
  print("Esas son razas de DBZ")
}


dbz2("Pikoro")


dbz3 <- function(mi_guerrero){
  if(mi_guerrero == "Yamcha"){
    print("Seguro se va a morir")
  } else if(mi_guerrero == "Krilin"){
    print("Seguro lo van a explotar")
  } else if(mi_guerrero == "Vegeta"){
    print("Siempre llora cuando va perdiendo")
  } else{
    print("No sé qué decir de este guerrero")
  }
  
}
dbz3("Krilin")


dato_texto = "-12456"
dato_texto = "holis"
# Si no fuera un texto as.numeric(x) <- regresa un NaN
dato  <- as.numeric(dato_texto)
# is.na(x) <- regresa un valor booleano, si encuentra na devuelve TRUE
if(is.na(dato) == FALSE){
  print('Es un número.')
  if(dato < 0){
    print('Es negativo.')
  } else if(dato > 0){
    print('Es positivo.')
  } else{
    print('Es cero')
  }
} else{
  print('No es un número.')
}

dato_texto = "-12456"
dato_texto = "holis"

idn_num <- function(dato_texto){
  dato  <- as.numeric(dato_texto)
  if(!is.na(dato)){
    print('Es un número.')
    if(dato < 0){
      print('Es negativo.')
    } else if(dato > 0){
      print('Es positivo.')
    } else{
      print('Es cero')
    }
  } else{
    print('No es un número.')
  }
}

idn_num("-1")

idn_num <- function(dato_texto){
  dato  <- as.numeric(dato_texto)
  if(is.na(dato) == FALSE & dato < 0){
    print('El núemero es negativo.')
  } else if(is.na(dato) == FALSE & dato > 0){
    print('El núemero es positivo.')
  }else if(is.na(dato) == FALSE & dato == 0){
    print('El núemero igual a 0.')
  }else{
    print('No es un número.')
  }
}

idn_num("0")

# If vectorizado
mi_vector  <- c(1,5,27,5,187,34,45,848,24,7)
mean(mi_vector)
ifelse(mi_vector < mean(mi_vector),"Es menor que la media","No es menor")

ifelse(mi_vector < mean(mi_vector),"Es menor que la media",
       ifelse(mi_vector<500,"Es menor que 500","No es menor que media ni que500"))

mi_data <- data.frame(nombre=c("Luis","Rosita","Marco"),
                      sexo = c("masculino","femenino","masculino"))

mi_data$sexo_cod <- ifelse(mi_data$sexo == "masculino",
                           1,
                           0)



# Encontrar el primer número cuyo cuadrado exceda un número dado

numero_dado  <- 400
as.numeric(numero_dado)
numero  <- 0
while(numero^2 <= numero_dado){
  numero = numero+1
}

numero

numero_dado <- 400
# ifelse()

# Dado un string, llenar una lista con cada una de sus palabras

mi_frase <- "Hola a todos. Buenos días."

longitud = nchar(mi_frase)
n=1
pos_inicial = 1
lista <- list()
letra = ''
posicion <- vector()
while(n <= longitud){
  letra  <- substr(mi_frase,n,n)
  if(letra == " " & n < longitud){
    posicion = n
    lista = c(lista,list(substr(mi_frase,pos_inicial,posicion-1)))
    pos_inicial = posicion + 1
  } else if(n==longitud){
    lista = c(lista,list(substr(mi_frase,pos_inicial,n)))
  }
  n = n+1    
}

lista























