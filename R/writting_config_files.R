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


##############################################
#### UK gov - coronavirus-cases_latest  ###############

column_mapping <- cfg_write(provided = c("Area.name", "Area.code", "Area.type", "Specimen.date", "Daily.lab.confirmed.cases", "Previously.reported.daily.cases", "Change.in.daily.cases", "Cumulative.lab.confirmed.cases", "Previously.reported.cumulative.cases", "Change.in.cumulative.cases", "Cumulative.lab.confirmed.cases.rate"),
                            standard = c("location", "area_code", "area_type", "date", "daily_labconfirmed_cases", "previously_reported_daily_cases", "change_in_daily_cases", "cumulative_labconfirmed_cases", "previously_reported_cumulative_cases", "change_in_cumulative_cases", "cumulative_labconfirmed_cases"),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/uk_gov_corona_virus_latest/column_mapping.csv")

area_name_level <- coronavirus_cases_latest %>%
  dplyr::distinct(Area.name) %>%
  rename(provided = Area.name) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(area_name_level, file = "/Users/sakelly/maps/uk_gov_corona_virus_latest/area_name_level.csv",  row.names = FALSE)

area_type_level <- coronavirus_cases_latest %>%
  dplyr::distinct(Area.type) %>%
  rename(provided = Area.type) %>%
  tibble::add_column(standard = NA)
write.csv(area_type_level, file = "/Users/sakelly/maps/uk_gov_corona_virus_latest/area_type_level.csv",  row.names = FALSE)

###canada-individual-level-mortality - Canada###

column_mapping <- cfg_write(provided = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date_death_report", "death_source", "additional_info", "additional_source"), 
                            standard = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date", "death_source", "additional_info", "additional_source"), 
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_individual_level_mortality/column_mapping.csv") 

age_levels <- individual_level_mortality %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/age_levels.csv",  row.names = FALSE)

sex_levels <- individual_level_mortality %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(sex_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/sex_levels.csv", row.names = FALSE)

health_region_level <- individual_level_mortality %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_level, file = "/Users/sakelly/maps/canada_individual_level_mortality/health_region_level.csv",  row.names = FALSE)

province_level <- individual_level_mortality %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_individual_level_mortality/province_level.csv",  row.names = FALSE)

country_level <- individual_level_mortality %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_level, file = "/Users/sakelly/maps/canada_individual_level_mortality/country_level.csv",  row.names = FALSE)

###public-covid-19-cases-canada - Canada###

column_mapping <- cfg_write(provided = c("case_id", "provincal_case_id", "age", "sex", "health_region", "province", "country", "date_report", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            standard = c("case_id", "provincal_case_id", "age", "sex", "health_region", "province", "country", "date", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_public_covid_19_cases/column_mapping.csv") 

age_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/age_levels.csv",  row.names = FALSE)

sex_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(sex_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/sex_levels.csv", row.names = FALSE)

health_region_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/health_region_level.csv",  row.names = FALSE)

province_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/province_level.csv",  row.names = FALSE)

country_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/country_level.csv",  row.names = FALSE)

travel_history_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(has_travel_history) %>%
  rename(provided = has_travel_history) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_history_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/travel_history_level.csv",  row.names = FALSE)

locally_acquired_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(locally_acquired) %>%
  rename(provided = locally_acquired) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(locally_acquired_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/locally_acquired_level.csv",  row.names = FALSE)

###canada_testing_data - Canada###

column_mapping <- cfg_write(provided = c("id", "date", "age", "case_id", "country", "province", "region", "sex", "travel", "travelh"), 
                            standard = c("id", "date", "age", "case_id", "country", "province", "region", "sex", "travel", "travelh"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_testing_data/column_mapping.csv") 

age_levels <- canada_testing_data %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_testing_data/age_levels.csv",  row.names = FALSE)

country_level <- canada_testing_data %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_level, file = "/Users/sakelly/maps/canada_testing_data/country_level.csv",  row.names = FALSE)

province_level <- canada_testing_data %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_testing_data/province_level.csv",  row.names = FALSE)

region_level <- canada_testing_data %>%
  dplyr::distinct(region) %>%
  rename(provided = region) %>%
  tibble::add_column(standard = NA)
write.csv(region_level, file = "/Users/sakelly/maps/canada_testing_data/region_level.csv",  row.names = FALSE)

travel_level <- canada_testing_data %>%
  dplyr::distinct(travel) %>%
  rename(provided = travel) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_level, file = "/Users/sakelly/maps/canada_testing_data/travel_level.csv",  row.names = FALSE)

travelh_level <- canada_testing_data %>%
  dplyr::distinct(travelh) %>%
  rename(provided = travelh) %>%
  tibble::add_column(standard = NA)
write.csv(travelh_level, file = "/Users/sakelly/maps/canada_testing_data/travelh_level.csv",  row.names = FALSE)

###canada_cumulative_case - Canada###

column_mapping <- cfg_write(provided = c("objectid", "hr_uid", "province", "engname", "frename", "casecount", "deaths", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at"), 
                            standard = c("objectid", "hr_uid", "province", "engname", "frename", "casecount", "deaths", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_cumulative_case/column_mapping.csv") 

province_level <- canada_cumulative_case_count_by_new_hybrid_regional_health_boundaries %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_cumulative_case/province_level.csv",  row.names = FALSE)

### mexico ###

column_mapping <- cfg_write(provided = c("report_date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"), 
                            standard = c("date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/mexico/column_mapping.csv") 

state_level <- covid19_mexico_daily_cases %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(state_level, file = "/Users/sakelly/maps/mexico/state_level.csv",  row.names = FALSE)

sex_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female"))
write.csv(sex_levels, file = "/Users/sakelly/maps/mexico/sex_levels.csv", row.names = FALSE)

status_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(status) %>%
  rename(provided = status) %>%
  tibble::add_column(standard = NA)
write.csv(status_levels, file = "/Users/sakelly/maps/mexico/status_levels.csv", row.names = FALSE)

origin_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(origin) %>%
  rename(provided = origin) %>%
  tibble::add_column(standard = NA)
write.csv(origin_levels, file = "/Users/sakelly/maps/mexico/origin_levels.csv", row.names = FALSE)

### Italy ###

column_mapping <- cfg_write(provided = c("data", "stato", "codice_regione", "demoninazione_regione", "lat", "long", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospdalizzati", "isolamento_domicilaire", "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti", "total_casi", "tamponi", "casi_testati", "note_it", "note_en"), 
                            standard = c("data", "stato", "codice_regione", "demoninazione_regione", "GPS_latitude", "GPS_longitude", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospdalizzati", "isolamento_domicilaire", "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti", "total_casi", "tamponi", "casi_testati", "note_it", "note_en"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/italy/column_mapping.csv") 


denominazione_regione_levels <- covid_19_italy_situation_monitoring_by_region %>%
  dplyr::distinct(denominazione_regione) %>%
  rename(provided = denominazione_regione) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(stato_levels, file = "/Users/sakelly/maps/italy/denominazione_regione_levels.csv", row.names = FALSE)

### belgium_cases_mort - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"), 
                            standard = c("date", "region", "agegroup", "sex", "deaths"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_cases_mort/column_mapping.csv")

region_level <- COVID19BE_MORT %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_level, file = "/Users/sakelly/maps/belgium_cases_mort/region_level.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_MORT %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_cases_mort/age_group_level.csv",  row.names = FALSE)

sex_levels <- COVID19BE_MORT %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_cases_mort/sex_levels.csv", row.names = FALSE)


### belgium_covid19_age_sex - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "AGEGROUP", "SEX", "CASES"), 
                            standard = c("date", "province", "region", "agegroup", "sex", "deaths"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_age_sex/column_mapping.csv")

province_level <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/belgium_covid19_age_sex/province_level.csv",  row.names = FALSE)

region_level <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_level, file = "/Users/sakelly/maps/belgium_covid19_age_sex/region_level.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/age_group_level.csv",  row.names = FALSE)

sex_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/sex_levels.csv", row.names = FALSE)

### belgium_covid19_cases_hosp - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "NR_REPORTING", "TOTAL_IN", "TOTAL_IN_ICU", "TOTAL_IN_RESP", "TOTAL_IN_ECMO", "NEW_IN", "NEW_OUT"), 
                            standard = c("date", "province", "region", "nr_reporting", "total_in", "total_in_icu", "total_in_resp", "total_in_ecmo", "new_in", "new_out"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/column_mapping.csv")

province_level <- COVID19BE_HOSP %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/province_level.csv",  row.names = FALSE)

region_level <- COVID19BE_HOSP %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_level, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/region_level.csv",  row.names = FALSE)

### belgium_covid19_cases_muni - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "NIS5", "TX_DESCR_NL", "TX_DESCR_FR", "TX_ADM_DSTR_DECSR_NL", "TX_ADM_DSTR_DESCR_FR", "TX_PROV_DESCR_NL", "TX_PROV_DESCR_FR", "TX_RGN_DESCR_NL", "TX_RGN_DESCR_FR", "CASES"), 
                            standard = c("date", "nis5", "tx_descr_nl", "tx_descr_fr", "tx_adm_dstr_descr", "tx_adm_dstr_descr_fr", "tx_prov_descr_nl", "tx_prov_descr_fr", "tx_rgn_descr_nl", "tx_rgn_descr_fr", "cases"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_muni/column_mapping.csv")

tx_descr_nl_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_DESCR_NL) %>%
  rename(provided = TX_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_descr_nl_level.csv",  row.names = FALSE)

tx_descr_fr_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_DESCR_FR) %>%
  rename(provided = TX_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_descr_fr_level.csv",  row.names = FALSE)

tx_adm_dstr_descr_nl_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_NL) %>%
  rename(provided = TX_ADM_DSTR_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_adm_dstr_descr_nl_level.csv",  row.names = FALSE)

tx_adm_dstr_descr_fr_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_FR) %>%
  rename(provided = TX_ADM_DSTR_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_adm_dstr_descr_fr_level.csv",  row.names = FALSE)

tx_prov_descr_nl_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_PROV_DESCR_NL) %>%
  rename(provided = TX_PROV_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_prov_descr_nl_level.csv",  row.names = FALSE)

tx_prov_descr_fr_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_PROV_DESCR_FR) %>%
  rename(provided = TX_PROV_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_prov_descr_fr_level.csv",  row.names = FALSE)

tx_rgn_descr_nl_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_RGN_DESCR_NL) %>%
  rename(provided = TX_RGN_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_rgn_descr_nl_level.csv",  row.names = FALSE)

tx_rgn_descr_fr_level <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_RGN_DESCR_FR) %>%
  rename(provided = TX_RGN_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_rgn_descr_fr_level.csv",  row.names = FALSE)


### belgium_covid19_cases_muni_cum - BELGIUM ###

column_mapping <- cfg_write(provided = c("NIS5", "TX_DESCR_NL", "TX_DESCR_FR", "TX_ADM_DSTR_DECSR_NL", "TX_ADM_DSTR_DESCR_FR", "TX_PROV_DESCR_NL", "TX_PROV_DESCR_FR", "TX_RGN_DESCR_NL", "TX_RGN_DESCR_FR", "CASES"), 
                            standard = c("nis5", "tx_descr_nl", "tx_descr_fr", "tx_adm_dstr_descr", "tx_adm_dstr_descr_fr", "tx_prov_descr_nl", "tx_prov_descr_fr", "tx_rgn_descr_nl", "tx_rgn_descr_fr", "cases"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/column_mapping.csv")

tx_descr_nl_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_DESCR_NL) %>%
  rename(provided = TX_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_descr_nl_level.csv",  row.names = FALSE)

tx_descr_fr_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_DESCR_FR) %>%
  rename(provided = TX_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_descr_fr_level.csv",  row.names = FALSE)

tx_adm_dstr_descr_nl_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_NL) %>%
  rename(provided = TX_ADM_DSTR_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_adm_dstr_descr_nl_level.csv",  row.names = FALSE)

tx_adm_dstr_descr_fr_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_FR) %>%
  rename(provided = TX_ADM_DSTR_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_adm_dstr_descr_fr_level.csv",  row.names = FALSE)

tx_prov_descr_nl_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_PROV_DESCR_NL) %>%
  rename(provided = TX_PROV_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_prov_descr_nl_level.csv",  row.names = FALSE)

tx_prov_descr_fr_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_PROV_DESCR_FR) %>%
  rename(provided = TX_PROV_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_prov_descr_fr_level.csv",  row.names = FALSE)

tx_rgn_descr_nl_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_RGN_DESCR_NL) %>%
  rename(provided = TX_RGN_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_nl_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_rgn_descr_nl_level.csv",  row.names = FALSE)

tx_rgn_descr_fr_level <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_RGN_DESCR_FR) %>%
  rename(provided = TX_RGN_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_fr_level, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_rgn_descr_fr_level.csv",  row.names = FALSE)

### ecdc data ###

column_mapping <- cfg_write(provided = c("dateRep", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"), 
                            standard = c("date", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/ecdc_data/column_mapping.csv")

countriesAndTerritories_level <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(countriesAndTerritories) %>%
  rename(provided = countriesAndTerritories) %>%
  tibble::add_column(standard = NA)
write.csv(countriesAndTerritories_level, file = "/Users/sakelly/maps/ecdc_data/countriesAndTerritories_level.csv",  row.names = FALSE)

geoId_level <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(geoId) %>%
  rename(provided = geoId) %>%
  tibble::add_column(standard = NA)
write.csv(geoId_level, file = "/Users/sakelly/maps/ecdc_data/geoId_level.csv",  row.names = FALSE)

countryterritoryCode_level <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(countryterritoryCode) %>%
  rename(provided = countryterritoryCode) %>%
  tibble::add_column(standard = NA)
write.csv(countryterritoryCode_level, file = "/Users/sakelly/maps/ecdc_data/countryterritoryCode_level.csv",  row.names = FALSE)

continentExp_level <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(continentExp) %>%
  rename(provided = continentExp) %>%
  tibble::add_column(standard = NA)
write.csv(continentExp_level, file = "/Users/sakelly/maps/ecdc_data/continentExp_level.csv",  row.names = FALSE)

### us_coid_statistics_states ###

column_mapping <- cfg_write(provided = c("date", "state", "positive", "negative", "pending", "hospitalizedcurrently", "hospitalizedcumulative", "inicucurrently", "inicucumulative", "onventilatorcurrently", "onventilatorcumulative", "recovered", "dataqualitygrade", "lastupdateet", "hash", "datechecked", "death", "hospitalized", "total", "totaltestresults", "posneg", "fips", "deathincrease", "hopitalizedincrease", "negativeincrease", "positiveincrease", "totaltestresultsincrease"), 
                            standard = c("date", "state", "positive", "negative", "pending", "hospitalizedcurrently", "hospitalizedcumulative", "inicucurrently", "inicucumulative", "onventilatorcurrently", "onventilatorcumulative", "recovered", "dataqualitygrade", "lastupdateet", "hash", "datechecked", "death", "hospitalized", "total", "totaltestresults", "posneg", "fips", "deathincrease", "hopitalizedincrease", "negativeincrease", "positiveincrease", "totaltestresultsincrease"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/us_covid_statistics_states/column_mapping.csv")

state_level <- covid_statistics_by_us_states_daily_updates %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA)
write.csv(state_level, file = "/Users/sakelly/maps/us_covid_statistics_states/state_level.csv",  row.names = FALSE)

hash_level <- covid_statistics_by_us_states_daily_updates %>%
  dplyr::distinct(hash) %>%
  rename(provided = hash) %>%
  tibble::add_column(standard = NA)
write.csv(hash_level, file = "/Users/sakelly/maps/us_covid_statistics_states/hash_level.csv",  row.names = FALSE)

fips_level <- covid_statistics_by_us_states_daily_updates %>%
  dplyr::distinct(fips) %>%
  rename(provided = fips) %>%
  tibble::add_column(standard = NA)
write.csv(fips_level, file = "/Users/sakelly/maps/us_covid_statistics_states/fips_level.csv",  row.names = FALSE)

### us_counties_statistics_states ###

column_mapping <- cfg_write(provided = c("date", "county", "state", "fips", "cases", "deaths"), 
                            standard = c("date", "county", "state", "fips", "cases", "deaths"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/us_counties_statistics_states/column_mapping.csv")

county_level <- us_counties %>%
  dplyr::distinct(county) %>%
  rename(provided = county) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(county_level, file = "/Users/sakelly/maps/us_counties_statistics_states/county_level.csv",  row.names = FALSE)

state_level <- us_counties %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(state_level, file = "/Users/sakelly/maps/us_counties_statistics_states/state_level.csv",  row.names = FALSE)

fips_level <- us_counties %>%
  dplyr::distinct(fips) %>%
  rename(provided = fips) %>%
  tibble::add_column(standard = NA)
write.csv(fips_level, file = "/Users/sakelly/maps/us_counties_statistics_states/fips_level.csv",  row.names = FALSE)
