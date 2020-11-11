### NHS_Patways_Covid_19_data_2020_06_04

column_mapping <- 
  cfg_write(provided = c("SiteType", "Call Date", "Sex", "AgeBand", "CCGCode", "CCGName", "TriageCount"), 
            standard = c("site_type", "call_date", "sex", "age_band", "ccg_code","ccg_name", "triage_count"), 
            table = column_mapping, 
            path = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/column_mapping.csv")

site_type_levels <- NHS_Pathways_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(SiteType) %>%
  dplyr::rename(provided = SiteType) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(site_type_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/csite_type_levels.csv", row.names = FALSE)

sex_levels <- NHS_Pathways_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(Sex) %>%
  dplyr::rename(provided = Sex) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))


write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/sex_levels.csv", row.names = FALSE)


age_band_levels <- NHS_Pathways_Covid_19_data_2020_06_04  %>%
  dplyr::distinct(AgeBand) %>%
  dplyr::rename(provided = AgeBand) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/age_band_levels.csv", row.names = FALSE)




ccg_code_levels <-  NHS_Pathways_Covid_19_data_2020_06_04  %>%
  dplyr::distinct(CCGCode) %>%
  dplyr::rename(provided = CCGCode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/ccg_code_levels.csv", row.names = FALSE) 



ccg_name_levels <- NHS_Pathways_Covid_19_data_2020_06_04%>%
  dplyr::distinct(CCGName) %>%
  dplyr::rename(provided = CCGName) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))


write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/ccg_name_levels.csv", row.names = FALSE) 


# no_deaths_all_causes_care_homes_local_authority 
# ons_deaths_across_england_wales_scotland_northern_ireland and all the ons data
# we need to ask further as to how to deal with this type of data 

