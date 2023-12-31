update_inputs <- function(data_changed) {
  ## Set working directory to project directory
  setwd(orderly2:::orderly_src_root(NULL, TRUE))
  
  ## Find the latest combined report for the given data_changed
  latest <- 
    orderly2::orderly_search(quote(latest(parameter:short_run == FALSE &&
                                            parameter:deterministic == TRUE &&
                                            parameter:data_changed == this:data_changed)),
                             name = "severity_fits_combined",
                             parameters = list(data_changed = data_changed))
  
  ## Folder location in severity_parameters
  pars_folder <- paste0("src/severity_parameters/pars/", data_changed, "/deterministic")
  
  ## Copy the latest info and proposal csvs into that folder location
  orderly2::orderly_copy_files(latest,
                               files = c("proposal.csv" = "outputs/parameters/proposal.csv",
                                         "info.csv" = "outputs/parameters/info.csv"),
                               dest = pars_folder)
}

update_inputs("original")