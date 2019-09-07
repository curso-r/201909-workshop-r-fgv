library(tidyverse)
library(readxl)
library(writexl)

arquivos_CO <- list.files(path = "data-raw", pattern = "CO", full.names = TRUE)
arquivos_NO <- list.files(path = "data-raw", pattern = "NO", full.names = TRUE)


df_CO <- map_dfr(arquivos_CO, read_excel)
df_NO <- map_dfr(arquivos_NO, read_excel)


View(df_CO)
View(df_NO)


df_CO <- df_CO %>%
  rename(mass_co = mass_conc) %>%
  select(-parameter)

df_NO <- df_NO %>%
  rename(mass_no = mass_conc) %>%
  select(mass_no, time)

View(df_CO)
View(df_NO)

df <- inner_join(
  df_CO, 
  df_NO, 
  by = "time"
) 

View(df)

write_xlsx(df, "base-agregada.xlsx")


# https://github.com/Hironsan/BossSensor
# https://www.businessinsider.com/programmer-automates-his-job-2015-11

