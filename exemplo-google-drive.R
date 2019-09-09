library(googledrive)
# credencial do google drive -------------------------------------------------------------------------------------
drive_auth()

# listar arquivos ------------------------------------------------------------------------------------------------
bases <- drive_find(pattern = "tpa_saude", type = "folder") %>% drive_ls(type = "csv")

# baixar um arquivo ----------------------------------------------------------------------------------------------
id <- bases$id[1]

drive_download(
  as_id(id),
  overwrite = TRUE
)

# ler o arquivo ----------------------------------------------------------------------------------------------
library(readr)
dataset <- read_csv("base_operadora.csv", locale = locale(encoding = "ISO-8859-1"))
