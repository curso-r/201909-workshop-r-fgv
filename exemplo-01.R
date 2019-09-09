library(tidyverse)
library(readxl)

#----------------------------------------------------------------------------------
# carregar muitos arquivos de uma so vez
arquivos <- list.files(path = "data-raw", pattern = "CO", full.names = TRUE)
arquivos

df <- map_dfr(arquivos, read_excel)
View(df)


