#' firstup
#'
#' @param x 
#'
#' @return
#' @export
#'
#' @examples
firstup <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}



#' simpleCap 
#'
#' @param x 
#'
#' @return first letter of a string into upper case 
#' @export
#'
#' @examples
simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

#' cfg_write
#'
#' @param provided categorical levels of the variable that are provided in the original dataset
#' @param standard levels recoded to new categories
#' @param table the name of the table to which new table should be saved
#' @param term_id 
#' @param units 
#' @param units_id 
#' @param value_mapping_file 
#' @param path the path of the folder to which the table should be saved
#' @param notes 
#'
#' @return
#' @export
#'
#' @examples
cfg_write <- function(provided = c(1:2),
                      standard = c(1:2),
                      term_id = c(1:2),
                      units = c(1:2), 
                      units_id = c(1:2), 
                      value_mapping_file = c(1:2),
                      notes = c(1:2), 
                      table = table,
                      path = "path/to/save") {
  
  
  df <- tibble::tibble(provided = provided, 
                      standard = standard, 
                      term_id = term_id, 
                      units = units, 
                      units_id = units_id,
                      value_mapping_file = value_mapping_file, 
                      notes = notes)
  df
  
  write.csv(df, file = path, row.names = FALSE)
  
}



#' const_val_fct 
#'
#' @param column_mapping 
#' @param term_id 
#' @param constant_values 
#' @param values_id 
#' @param units 
#' @param units_id 
#' @param notes 
#' @param path 
#'
#' @return
#' @export
#'
#' @examples
const_val_fct <- function(column_name = c(1:2), 
                          term_id = c(1:2), 
                          constant_values = c(1:2), 
                          values_id = c(1:2), 
                          units = c(1:2), 
                          units_id = c(1:2), 
                          notes = c(1:2), 
                          table = table,
                          path = "path/to/save"){
  
  
  df <- tibble::tibble(column_name = column_name, 
                       term_id = term_id, 
                       constant_values = constant_values, 
                       values_id = values_id, 
                       units = units, 
                       units_id = units_id, 
                       notes = notes)
  
  df 
  
  write.csv(df, file = path, row.names = FALSE)
  
}





#' apply_cl_cm
#'
#' @param data a dataframe or a tibble
#' @param vars_ordered selecting the variables in the order you want. it is similiar to dplyr::select('var1', 'var2').
#' @param data_selected_order a bolean TRUE or FALSE. If TRUE then dataset obtained in vars_ordered will be saved into a folder of your choice.
#' @param column_mapping a bolean TRUE OR FALSE. If TRUE, then a column mapping tibble with 2 variables - 'provided' and 'standard'.
#' provided variable stores all the variables of data passed into this function, stored as rows; standard variable contains the same variables as in provided column but
#' all variables are transformed from CAPITAL letters variables to lower letters. e.g. PSEUDO_ID -> pseudo_id
#' @param config_folder_path the path of your choice where the column_mapping tibble (and other tibbles that form the process of recoding levels of variables) are stored
#' @param save_ordered_data the path folder where the data is saved
#'
#' @return
#' @export
#'
#' @examples
apply_cl_cm <- function(data,
                        vars_bolean = TRUE,
                        vars_ordered = c(1:50),
                        data_selected_order = TRUE,
                        save_ordered_data = "path/to/save/data.csv",
                        column_mapping = TRUE,
                        config_folder_path = "/config_folder_path/column_mapping.rds") {
  
  if(vars_bolean == TRUE) {
    
    vars_ordered <- data %>%
      dplyr::select(vars_ordered)
    
  }else{
    
    if(vars_bolean == FALSE & vars_ordered == FALSE) {
      vars_ordered <- data %>%
        dplyr::select_all()
      
    } else {
      print("Previous parameters, had vars_bolean == FALSE and vars_ordered is null.
              a similar data has been saved into your folder passed at saved_ordered_data")
    }
    
  }
  
  if (column_mapping == TRUE) {
    column_mapping <- tibble::tibble(names(vars_ordered)) %>%
      dplyr::rename(provided = "names(vars_ordered)") %>%
      dplyr::mutate(standard = tolower(provided))
    
    saveRDS(column_mapping, file = config_folder_path)
    
  }
  
  if (data_selected_order == TRUE) {
    write.csv(vars_ordered, file = save_ordered_data, row.names = FALSE)
    
  } else{
    NULL
    
  }
  
  
}



empty_as_na <- function(x) {
  if ("factor" %in% class(x))
    x <- as.character(x)
  ifelse(as.character(x) != "", x, NA)
}



# 
# smotest <- list(name = "SMOTE with more neighbors!",
#                 func = function (x, y) {
#                   115
#                   library(DMwR)
#                   dat <- if (is.data.frame(x)) x else as.data.frame(x)
#                   dat$.y <- y
#                   dat <- SMOTE(.y ~ ., data = dat, k = 3, perc.over = 100, perc.under =
#                                  200)
#                   list(x = dat[, !grepl(".y", colnames(dat), fixed = TRUE)],
#                        y = dat$.y) },
#                 first = TRUE)
# 
# newRF <- caretFuncs
# 
# fiveStats <- function(...) c(twoClassSummary(...),
#                              defaultSummary(...)) newRF$summary <- fiveStats
# 
# ctrl <- rfeControl(method = "repeatedcv", repeats = 3,
#                    verbose = TRUE, functions = newRF)
# 
# ctrlInside1 <- trainControl(method = "repeatedcv", number = 2,
#                             repeats = 2,
#                             classProbs = TRUE, allowParallel = TRUE, summaryFunction = fiveStats, verboseIter = TRUE, sampling = smotest)


# data <- data %>% 
#   mutate_each(funs(empty_as_na))
# 
# 
# data <- data %>%
#   naniar::replace_with_na_if(.predicate = is.character,
#                              condition = ~ .x %in% ("Not stated"))
# 
# data <- data %>% replace_na(list(ethnicity = "Missing"))
