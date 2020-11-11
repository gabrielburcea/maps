column_mapping <- cfg_write(provided = c("DATE", "NIS5", "TX_DESCR_NL", "TX_DESCR_FR", "TX_ADM_DSTR_DECSR_NL", "TX_ADM_DSTR_DESCR_FR", "TX_PROV_DESCR_NL", "TX_PROV_DESCR_FR", "TX_RGN_DESCR_NL", "TX_RGN_DESCR_FR", "CASES"), 
                            standard = c("date", "nis5", "geographic_location", "tx_descr_fr", "tx_adm_dstr_descr", "tx_adm_dstr_descr_fr", "tx_prov_descr_nl", "tx_prov_descr_fr", "tx_rgn_descr_nl", "tx_rgn_descr_fr", "case_count"),
                            term_id = c(NA, NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, NA, "tx_descr_nl_levels.csv", "tx_descr_fr_levels.csv", "tx_adm_dstr_descr_nl_levels.csv", "tx_adm_dstr_descr_fr_levels.csv", "tx_prov_descr_nl_levels.csv", "tx_prov_descr_fr_levels.csv", "tx_prov_descr_nl_levels.csv", "tx_prov_descr_fr_levels.csv", NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_covid19_cases_muni/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "case_type", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', NA, "ENVO:00000004"),
                                 constant_values =  c("Belgium","cases", "admin level 3"),
                                 values_id = c(NA, NA, "ENVO_00000007"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_covid19_cases_muni/constant_values.csv")
