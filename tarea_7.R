# rm(list = ls())
library(ggplot2)
vinos <- read.csv("vinos.csv")

names(vinos)
names(vinos)

mex <- vinos[vinos$country == "Mexico",]
por <- vinos[vinos$country == "Portugal",]

ggplot(data = vinos) + geom_point(aes(x=price, y= points)) + ylab("Calidad")


# -------------- R1 -------------- #
# 1. Un mayor precio no representa una mayor calidad en el vino puesto que hay precio entre 750
# y 1500 que tienen una calidad del 100

# 2. Si 2250 es el precio maximo, se podría conseguir un vino de buena calidad (95% - 100%)
#   entre 500 y 1250

# 3. SI el promedio de la calidad es 90%. Si se paga un precio entre 250 y 750; se podría adquirir
# un vino de mejor calidad que ronda (90% -97.5%) sin pagar el promedio de un mayor precio (1000)

# -------------- R2 -------------- #
ggplot(data = vinos) + 
  geom_point(aes(x=price, y= points)) + 
  geom_vline(aes(xintercept = 2005,color="red")) +
  geom_hline(aes(yintercept = 91,color = "red")) +
  ylab("Calidad")
  # scale_x_continuous(c(0:500))
# ¿Qué características tiene ese vino?
caracteristicas <- vinos[(vinos$designation == "Roger Rose Vineyard")& (vinos$price > 2000),]


# ¿a qué crees que se deba su precio?
names(vinos)
class(vinos$points)
View(vinos[(vinos$points > 90 & vinos$points < 100) & (vinos$price > 800),c(1,3:5,6,9:10)])
View(vinos[(vinos$variety == "Chardonnay") & (vinos$price > 800),c(1,3:5,6,8:10)])
View(vinos[(vinos$designation == "Roger Rose Vineyard"),])
View(vinos[(vinos$variety == "Chardonnay")&(vinos$price > 500),])
View(vinos[vinos$points == 99,c(3,4:6)])

# Considero que el precio se debe a que la única región en EU y america que produce la designación "Roger Rose Vineyard" con
# una calidad mayor a 90% es California