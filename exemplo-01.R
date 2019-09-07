library(tidyverse)
library(readxl)

arquivos <- list.files(path = "data-raw", pattern = "CO", full.names = TRUE)
arquivos

df <- map_dfr(arquivos, read_excel)
View(df)


