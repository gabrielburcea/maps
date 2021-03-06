### us_coid_statistics_states ###
library(tidyverse)
preprocessed <- read_csv("us_covid_statistics_states/preprocessed.csv")
column_mapping <- cfg_write(provided = c("case_count", "clinical_finding", "date", "state", "positive", "negative", "pending", "hospitalizedcurrently", "hospitalizedcumulative", "inicucurrently", "inicucumulative", "onventilatorcurrently", "onventilatorcumulative", "recovered", "dataqualitygrade", "lastupdateet", "hash", "datechecked", "death", "hospitalized", "total", "totaltestresults", "posneg", "fips", "hopitalizedincrease", "negativeincrease", "totaltestresultsincrease"),
                            standard = c("case_count", "clinical_data_item", "date", "geographic_location", "positive", "negative", "pending", "hospitalizedcurrently", "hospitalizedcumulative", "inicucurrently", "inicucumulative", "onventilatorcurrently", "onventilatorcumulative", "recovered", "dataqualitygrade", "lastupdateet", "hash", "datechecked", "death", "hospitalized", "total", "totaltestresults", "posneg", "fips", "hopitalizedincrease", "negativeincrease", "totaltestresultsincrease"),
                            term_id =  c("STATO:0000047", "OGMS:0000123", NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, "clinical_finding_levels.csv", NA, "state_levels.csv", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "hash_levels.csv", NA, NA, NA, NA, NA, NA, "fips_levels.csv", NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/us_covid_statistics_states/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution"), 
                                 term_id =  c("ENVO:00000004"),
                                 constant_values =  c("admin level 2"),
                                 values_id = c("ENVO:00000006"), 
                                 units = c(NA), 
                                 units_id = c(NA), 
                                 notes = c(NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/us_covid_statistics_states/constant_values.csv")

state_levels <- preprocessed %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA)
write.csv(state_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/state_levels.csv",  row.names = FALSE)

hash_levels <- preprocessed %>%
  dplyr::distinct(hash) %>%
  rename(provided = hash) %>%
  tibble::add_column(standard = NA)
write.csv(hash_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/hash_levels.csv",  row.names = FALSE)

fips_levels <- preprocessed %>%
  dplyr::distinct(fips) %>%
  rename(provided = fips) %>%
  tibble::add_column(standard = NA)
write.csv(fips_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/fips_levels.csv",  row.names = FALSE)

clinical_finding_levels <- preprocessed %>%
  dplyr::distinct(clinical_finding) %>%
  rename(provided = clinical_finding) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(clinical_finding_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/clinical_finding_levels.csv", row.names = FALSE)
