# antes de continuarmos, vamos instalar pacotes!!!
install.packages("tidyverse")
install.packages("readxl")
install.packages("writexl")
install.packages("leaflet")
install.packages("shiny")
install.packages("remotes")
remotes::install_github("athospd/wavesurfer")

library(readxl)

base <- read_excel("data-raw/CO-Pinheiros-201709.xlsx")
View(base)

base







