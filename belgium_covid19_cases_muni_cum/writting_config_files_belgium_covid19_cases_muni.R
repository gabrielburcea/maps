### belgium_covid19_cases_muni_cum - BELGIUM ###
library(tidyverse)
column_mapping <- cfg_write(provided = c("NIS5", "TX_DESCR_NL", "TX_DESCR_FR", "TX_ADM_DSTR_DECSR_NL", "TX_ADM_DSTR_DESCR_FR", "TX_PROV_DESCR_NL", "TX_PROV_DESCR_FR", "TX_RGN_DESCR_NL", "TX_RGN_DESCR_FR", "CASES"), 
                            standard = c("nis5", "geographic_location", "tx_descr_fr", "tx_adm_dstr_descr", "tx_adm_dstr_descr_fr", "tx_prov_descr_nl", "tx_prov_descr_fr", "tx_rgn_descr_nl", "tx_rgn_descr_fr", "case_count"),
                            term_id = c(NA, NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, NA, "tx_descr_nl_levels.csv", "tx_descr_fr_levels.csv", "tx_adm_dstr_descr_nl_levels.csv", "tx_adm_dstr_descr_fr_levels.csv", "tx_prov_descr_nl_levels.csv", "tx_prov_descr_fr_levels.csv", "tx_prov_descr_nl_levels.csv", "tx_prov_descr_fr_levels.csv"),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "clinical_data_item", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', "OGMS:0000123", "ENVO:00000004"),
                                 constant_values =  c("Belgium","cases", "admin level 3"),
                                 values_id = c(NA, NA, "ENVO:00000007"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/constant_values.csv")

tx_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_DESCR_NL) %>%
  rename(provided = TX_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_descr_nl_levels.csv",  row.names = FALSE)

tx_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_DESCR_FR) %>%
  rename(provided = TX_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_descr_fr_levels.csv",  row.names = FALSE)

tx_adm_dstr_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_NL) %>%
  rename(provided = TX_ADM_DSTR_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_adm_dstr_descr_nl_levels.csv",  row.names = FALSE)

tx_adm_dstr_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_FR) %>%
  rename(provided = TX_ADM_DSTR_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_adm_dstr_descr_fr_levels.csv",  row.names = FALSE)

tx_prov_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_PROV_DESCR_NL) %>%
  rename(provided = TX_PROV_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_prov_descr_nl_levels.csv",  row.names = FALSE)

tx_prov_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_PROV_DESCR_FR) %>%
  rename(provided = TX_PROV_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_prov_descr_fr_levels.csv",  row.names = FALSE)

tx_rgn_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_RGN_DESCR_NL) %>%
  rename(provided = TX_RGN_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_rgn_descr_nl_levels.csv",  row.names = FALSE)

tx_rgn_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_RGN_DESCR_FR) %>%
  rename(provided = TX_RGN_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_rgn_descr_fr_levels.csv",  row.names = FALSE)
