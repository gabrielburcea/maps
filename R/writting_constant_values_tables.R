# mexico 


constant_values <- const_val_fct(column_name = c("country" , "report_date", "state", "sex" , "age", "date_of_start_case_type", "status", "origin", "date_of_arrival_in_mexico", "report_url"), 
                                 term_id =  c('ENVO:00000009', 'EUPATH:0000151', 'PATO:0000047', 'OBI:0001167', NA, NA, NA, NA, NA, NA),
                                 constant_values =  c("Mexico",NA, NA, NA, NA, NA, NA, NA, NA, NA),
                                 values_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 notes = c(NA, "talk", NA, NA, NA, NA, NA, NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/gabrielburcea/rprojects/maps/mexico/constant_values.csv"
)


# Italy 
constant_values <- const_val_fct(column_name = c("country", "data", "stato", "codice_regione", "demoninazione_regione", "lat", "long", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospdalizzati", "isolamento_domicilaire", "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti", "total_casi", "tamponi", "casi_testati", "note_it", "note_en"), 
                                 term_id =  c('ENVO:00000009', NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                                 constant_values =  c("Italy",NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                                 values_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA ), 
                                 units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 notes = c(NA, "talk", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/gabrielburcea/rprojects/maps/italy/constant_values.csv")

