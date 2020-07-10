library(tidyverse)


##############################################
#### Belgium - COVID19BE_MORT  ###############
column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"), 
                            standard = c("date", "region", "age_band", "gender", "deaths"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/belgium_cases_mort/config_files/column_mapping.csv")



region_levels <- COVID19BE_MORT %>%
  distinct(REGION) %>% 
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA)

write.csv(region_levels, file = "/Users/gabrielburcea/Rprojects/maps/belgium_cases_mort/config_files/region_levels.csv")


####################################################
######## nhs_pathways_covid_19_data_ccg_mapped #####
####################################################

column_mapping <- cfg_write(provided = c("SiteType", "Call Date", "Gender", "AgeBand", "CCGCode", "CCGName", "April20 mapped CCGCode", "April20 mapped CCGName", "TriageCount"), 
                            standard = c("site_type", "date", "gender", "age_band", "ccg_code", "ccg_name", "code", "ccg_name_2", "count"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/config_files/column_mapping.csv")



gender_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(Gender) %>% 
  rename(provided = Gender) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(gender_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/gender_levels.csv", row.names = FALSE)

age_band_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(AgeBand) %>%
  rename(provided = AgeBand) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/age_band_levels.csv",  row.names = FALSE)


ccg_code_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGCode) %>%
  rename(provided = CCGCode) %>%
  tibble::add_column(standard = NA)


ccg_name_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGName) %>%
  rename(provided = CCGName) %>% 
  tibble::add_column(standard = NA) 
write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/ccg_name_levels.csv")

