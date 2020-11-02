# X111_Online_Covid_19_data_2020_06_04

column_mapping <- cfg_write(provided = c("journeydate", "sex", "ageband", "ccgcode", "ccgname", "Total"), 
                            standard = c("journey_date", "sex", "age_band", "ccg_code", "ccg_name", "total"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/column_mapping.csv")

sex_levels <- X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(sex) %>%
  dplyr::rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/sex_levels.csv", row.names = FALSE)


age_band_levels <- X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(ageband) %>%
  dplyr::rename(provided = ageband) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/age_band_levels.csv", row.names = FALSE)

ccg_code_levels <-  X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(ccgcode) %>%
  dplyr::rename(provided = ccgcode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/ccg_code_levels.csv", row.names = FALSE) 


ccg_name_levels <- X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(ccgname) %>%
  dplyr::rename(provided = ccgname) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/ccg_name_levels.csv", row.names = FALSE) 


