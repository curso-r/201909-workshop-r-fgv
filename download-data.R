# devtools::install_github("atmoschem/koffing")
library(koffing)
library(lubridate)
library(purrr)

x <- koffing::cetesb_station_ids
koffing::cetesb_param_ids

estacoes <- cetesb_station_ids()


baixar_ultimo_ano <- function(pol) {
  
  cod_poluente <- cetesb_param_ids$id[cetesb_param_ids$param_abbrev == pol]
  
  
  starts <- dmy("01/08/2018") - months(0:11)
  ends <- starts + months(1) - days(1)
  
  formatar <- function(x) {
    sprintf("%02d/%02d/%04d", day(x), month(x), year(x))
  }
  
  starts <- formatar(starts)
  ends <- formatar(ends)
  
  dfs <- map2(
    starts, 
    ends, 
    ~scraper_cetesb(
      "99", 
      cod_poluente, 
      .x, 
      .y, 
      type = "P", 
      "seu_login", 
      "sua_senha", 
      invalidData = "on", 
      network = "A"
    )
  )
  
  starts <- dmy(starts)
  for(i in 1:12){
    writexl::write_xlsx(dfs[[i]], sprintf("data-raw/%s-Pinheiros-%04d%02d.xlsx",pol, year(starts[i]) ,month(starts[i])))
  } 
  
}


baixar_ultimo_ano("NO")
baixar_ultimo_ano("CO")


df_ <- scraper_cetesb(
  99, 
  16, 
  "01/01/2018", 
  "31/01/2018", 
  type = "P", 
  "seu_login", 
  "sua_senha", 
  invalidData = "on", 
  network = "A"
)
View(df_)


writexl::write_xlsx(df_, "data-raw/CO-Pinheiros-201801.xlsx")



