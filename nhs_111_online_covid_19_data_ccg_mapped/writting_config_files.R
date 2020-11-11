# nhs_111_online_covid_19_data_ccg_mapped

column_mapping <- cfg_write(provided = c("journeydate", "gender", "ageband", "CCGcode", "CCGname", "April20 mapped CCGCode", "April20 mappedCCGName", "Total"), 
                            standard = c("journey_date", "sex", "age_band", "ccg_code", "ccg_name","april20_mapped_ccgcode", "april20_mapped_ccgname", "total"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/column_mapping.csv")

sex_levels <- X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(gender) %>%
  dplyr::rename(provided = gender) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/sex_levels.csv", row.names = FALSE)


age_band_levels <- X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(ageband) %>%
  dplyr::rename(provided = ageband) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/age_band_levels.csv", row.names = FALSE)

ccg_code_levels <-  X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGCode) %>%
  dplyr::rename(provided = CCGCode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/ccg_code_levels.csv", row.names = FALSE) 


ccg_name_levels <- X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGName) %>%
  dplyr::rename(provided = CCGName) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/ccg_name_levels.csv", row.names = FALSE) 
