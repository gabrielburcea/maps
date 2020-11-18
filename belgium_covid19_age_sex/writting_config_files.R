### belgium_covid19_age_sex - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "AGEGROUP", "SEX", "CASES"), 
                            standard = c("date", "geographic_location", "region", "age_band", "sex", "case_count"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_age_sex/column_mapping.csv")

province_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/province_levels.csv",  row.names = FALSE)

region_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/region_levels.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/age_group_levels.csv",  row.names = FALSE)

sex_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/sex_levels.csv", row.names = FALSE)
