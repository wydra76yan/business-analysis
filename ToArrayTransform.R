
library(stringr)

#<==================CRIMINAL====================>#
#append last element
crime_table_info[8,12] <- crime_table_last_cell_info

remove_whitespaces <- function (array_element){
  clear_string <- str_replace_all( str_replace_all( array_element, "\u00A0", ""), " ", "")
  return (clear_string)
}

for (i in 2:12)
{
  crime_table_info_numeric[i-1] <- c(as.numeric(as.character(remove_whitespaces(crime_table_info[8, i]))))  
}

#<==================ZP====================>#

remove_delimetr <- function (array_element){
  clear_string <- str_replace_all( array_element, ",", "")
  return (clear_string)
}

for (i in 17:27)
{
  nominal_zp_info_numeric[i-16] <- c(as.numeric(as.character(remove_delimetr(nominal_zp_info[i, 2]))))  
}
nominal_zp_info_numeric_integer <- nominal_zp_info_numeric[1:11]

for (i in 1:11)
{
  if (nominal_zp_info_numeric_integer[i]%/%10000 == 0) {
    nominal_zp_info_numeric_integer[i] <- nominal_zp_info_numeric_integer[i] / 10
  } else nominal_zp_info_numeric_integer[i] <- nominal_zp_info_numeric_integer[i] / 10000
}

#<==================EDUCATION====================>#

for (i in 8:11)
{
  number_of_schools_info_1_numeric[i-7] <- c(as.numeric(as.character(number_of_schools_info_1[7, i])))  
}

for (i in 2:8)
{
  number_of_schools_info_2_numeric[i-1] <- c(as.numeric(as.character(number_of_schools_info_2[7, i])))  
}
number_of_schools_info_numeric <- c(number_of_schools_info_1_numeric, number_of_schools_info_2_numeric)

#<==================LIFESPAN====================>#

for (i in 10:12)
{
  lifespan_info_1_numeric[i-9] <- c(as.numeric(as.character(remove_delimetr(lifespan_info_1[2, i])))) / 10  
}
lifespan_info_1_numeric

for (i in 2:9)
{
  lifespan_info_2_numeric[i-1] <- c(as.numeric(as.character(remove_delimetr(lifespan_info_2[2, i])))) / 10  
}
lifespan_info_2_numeric

lifespan_info_numeric <- c(lifespan_info_1_numeric, lifespan_info_2_numeric)


#<==================DOCTORS====================>#

for (i in 10:11)
{
  doctors_info_1_numeric[i-9] <- c(as.numeric(as.character(remove_delimetr(doctors_info_1[3, i])))) / 10  
}

for (i in 2:10)
{
  doctors_info_2_numeric[i-1] <- c(as.numeric(as.character(remove_delimetr(doctors_info_2[3, i])))) / 10  
}

doctors_info_numeric <- c(doctors_info_1_numeric, doctors_info_2_numeric)



