# antes de continuarmos, vamos instalar pacotes!!!
install.packages("tidyverse")
install.packages("readxl")
install.packages("writexl")
install.packages("leaflet")
install.packages("shiny")
install.packages("remotes")
install.packages("glmnet")
install.packages("recipes")
install.packages("caret")
install.packages("ranger")
install.packages("flexdashboard")
install.packages("googledrive")
remotes::install_github("athospd/wavesurfer")
remotes::install_github("abjur/abjData")

#----------------------------------------------------------------------------------
# Primeiro exemplo: carregando uma tabela do excel

library(readxl)

base <- read_excel("data-raw/CO-Pinheiros-201709.xlsx")
View(base)

base



