### belgium_covid19_cases_hosp - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "NR_REPORTING", "TOTAL_IN", "TOTAL_IN_ICU", "TOTAL_IN_RESP", "TOTAL_IN_ECMO", "NEW_IN", "NEW_OUT"), 
                            standard = c("date", "geographic_location", "region", "nr_reporting", "total_in", "total_in_icu", "total_in_resp", "total_in_ecmo", "case_count", "new_out"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/column_mapping.csv")

province_levels <- COVID19BE_HOSP %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/province_levels.csv",  row.names = FALSE)

region_levels <- COVID19BE_HOSP %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/region_levels.csv",  row.names = FALSE)
