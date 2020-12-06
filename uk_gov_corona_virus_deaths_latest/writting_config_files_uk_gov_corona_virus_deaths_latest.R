#### UK gov - coron_virus_deaths_latest  ###############
library(tidyverse)
preprocessed <- read_csv("uk_gov_corona_virus_deaths_latest/preprocessed.csv")
column_mapping <- cfg_write(provided = c("Area.name", "Area.code", "Area.type", "Reporting.date", "Daily.change.in.deaths", "Cumulative.deaths"),
                            standard = c("geographic_location", "area_code", "area_type", "date", "case_count", "cumulative_deaths"),
                            term_id =  c("GAZ:00000448", NA, NA, NA, "STATO:0000047", NA),
                            units = c(NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c("area_name_levels.csv", NA, NA, NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution", "clinical_data_item"), 
                                 term_id =  c("ENVO:00000004", "OGMS:0000123"),
                                 constant_values =  c("admin level 0", "deaths"),
                                 values_id = c("ENVO:00000009", NA), 
                                 units = c(NA, NA), 
                                 units_id = c(NA, NA), 
                                 notes = c(NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/constant_values.csv")

area_name_levels <- preprocessed %>%
  dplyr::distinct(Area.name) %>%
  rename(provided = Area.name) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(area_name_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/area_name_levels.csv",  row.names = FALSE)

area_code_levels <- preprocessed %>%
  dplyr::distinct(Area.code) %>%
  rename(provided = Area.code) %>%
  tibble::add_column(standard = NA)
write.csv(area_code_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/area_code_levels.csv",  row.names = FALSE)

area_type_levels <- preprocessed %>%
  dplyr::distinct(Area.type) %>%
  rename(provided = Area.type) %>%
  tibble::add_column(standard = NA)
write.csv(area_type_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/area_type_levels.csv",  row.names = FALSE)


