# rm(list=ls())
# -------------- R1 -------------- #
# c)Las matrices solo soportan datos del mismo tipo en tanto los dataframes son más flexibles.

# -------------- R2 -------------- #
action_company <- data.frame(company = c("Prime","Microsoft","Pfizer"),
                                           stock_price=c(2000,150,50),
                                           sector=c('Tech','Tech','Pharma'))
names(action_company)
colnames(action_company)
# -------------- R3 -------------- #
nrow(action_company)