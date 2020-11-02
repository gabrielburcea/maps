# mexico
library(tidyverse)

### Translating the variable status and then applying the translation on the wider dataset 
# unique(covid19_mexico_daily_cases$status)
# 
# status_levels <- c(
#   "Suspected" = "Sospechoso", 
#   "Confirmed" = "Confirmado", 
#   "Suspected" = "Sosechoso" # this may be "Sospechoso" - quality data issues? 
#   
# )
# covid19_mexico_daily_cases <- covid19_mexico_daily_cases %>%
#   dplyr::mutate(status = forcats::fct_recode(status, !!!status_levels))
# write.csv(covid19_mexico_daily_cases, file = "/Users/gabrielburcea/rprojects/maps/mexico/covid19_mexico_daily_cases.csv", row.names = FALSE)

# status_levels <- covid19_mexico_daily_cases %>%
#   dplyr::distinct(status) %>%
#   rename(provided = status) %>%
#   tibble::add_column(standard = c("Suspected", "Confirmed"))
# write.csv(status_levels, file = "/Users/gabrielburcea/rprojects/maps/mexico/status_levels.csv", row.names = FALSE)

column_mapping <- cfg_write(provided = c("report_date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"), 
                            standard = c("date", "geographical_resolution", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"),
                            term_id = c(NA, "GAZ:00000448", "PATO:0000047", "OBI:0001169",NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA,NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA,NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, "state_levels.csv", "sex_levels.csv", NA, "status_levels.csv", NA, NA, NA, NA),
                            notes = c(NA, "geographic location or locatio of?", NA, NA,"need to check what date?", "this is in spanish: suspected", NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/gabrielburcea/rprojects/maps/mexico/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country" , "geographic_resolution", "case_type" ), 
                                 term_id =  c('ENVO:00000009', "GAZ:00000448", NA),
                                 constant_values =  c("Mexico", NA, "status of covid: suspected or confirmed"), 
                                 values_id = c(NA, NA, NA),
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, "ask ontology team"), 
                                 table = constant_values,
                                 path = "/Users/gabrielburcea/rprojects/maps/mexico/constant_values.csv")


