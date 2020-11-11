### belgium_cases_mort - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"), 
                            standard = c("date", "geographic_location", "age_band", "sex", "case_count"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_cases_mort/column_mapping.csv")

region_levels <- COVID19BE_MORT %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_cases_mort/region_levels.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_MORT %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_cases_mort/age_group_levels.csv",  row.names = FALSE)

sex_levels <- COVID19BE_MORT %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("female", "male", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_cases_mort/sex_levels.csv", row.names = FALSE)
