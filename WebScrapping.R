install.packages("selectr")
install.packages("xml2")
install.packages("rvest")
install.packages("stringr")
install.packages("jsonlite")
library(xml2)
library(rvest)
library(stringr)

table_scrapping <- function (url, path){
  url <- url 
  webpage <- read_html(url)
  table <- url %>%
    read_html() %>%
    html_nodes(xpath=path) %>%
    html_table(fill=TRUE)
  table_info <- table[[1]]
  
  return (table_info)
}

#=============================REAL=============================#
########Criminal
crime_table_info <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/pravonarusheniya/godovye-dannye_7/prestupnost-v-respublike-belarus/",
  '/html/body/div[2]/div/div[2]/div/div[1]/table'
)

#####Last cell criminal
url <- "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/pravonarusheniya/godovye-dannye_7/prestupnost-v-respublike-belarus/"
webpage <- read_html(url)
crime_table_last_cell <- html_nodes(webpage, xpath='/html/body/div[2]/div/div[2]/div/div[2]/table/tbody/tr[8]/td[2]/p')
crime_table_last_cell_info <- str_replace_all(html_text(crime_table_last_cell), "[\r\n\t]" , "")
print(crime_table_last_cell_info)

######ZP
nominal_zp_info <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/realny-sector-ekonomiki/stoimost-rabochey-sily/operativnye-dannye/nominalnaya-nachislennaya-srednyaya-zarabotnaya-plata-rabotnikov-respubliki-belarus-s-1991-po-2018-g/",
  '/html/body/div[2]/div/div[2]/div/div/table'
)

######Education 1-st part
number_of_schools_info_1 <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/obrazovanie/godovye-dannye_5/osnovnye-pokazateli-obrazovaniya/",
  '/html/body/div[2]/div/div[2]/div/div[1]/table'
)

######Education 2-st part
number_of_schools_info_2 <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/obrazovanie/godovye-dannye_5/osnovnye-pokazateli-obrazovaniya/",
  '/html/body/div[2]/div/div[2]/div/div[2]/table'
)

######lifespan 1-st part
lifespan_info_1 <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/zdravoohranenie_2/godovye-dannye_13/ozhidaemaya-prodolzhitelnost-zhizni-pri-rozhdenii/",
  '/html/body/div[2]/div/div[2]/div/div[2]/table'
)

######lifespan 2-st part
lifespan_info_2 <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/zdravoohranenie_2/godovye-dannye_13/ozhidaemaya-prodolzhitelnost-zhizni-pri-rozhdenii/",
  '/html/body/div[2]/div/div[2]/div/div[3]/table'
)

######doctors 1-st part
doctors_info_1 <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/zdravoohranenie_2/godovye-dannye_13/obespechennost-naseleniya-srednimi-meditsinskimi-rabotnikami-po-oblastyam-i-g-minsku/",
  '/html/body/div[2]/div/div[2]/div/div[2]/table'
)

######doctors 2-st part
doctors_info_2 <- table_scrapping(
  "http://www.belstat.gov.by/ofitsialnaya-statistika/solialnaya-sfera/zdravoohranenie_2/godovye-dannye_13/obespechennost-naseleniya-srednimi-meditsinskimi-rabotnikami-po-oblastyam-i-g-minsku/",
  '/html/body/div[2]/div/div[2]/div/div[3]/table'
)
