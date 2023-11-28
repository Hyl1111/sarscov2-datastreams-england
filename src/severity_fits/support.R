simplify_transform <- function(pars, path, date) {
  
  e <- new.env()
  sys.source(file.path(path, "transform.R"), e)
  
  make_transform <- e$make_transform
  pars$transform <- make_transform(pars$base, date)
  
  pars$mcmc <- spimalot:::spim_pars_mcmc_single(pars$info, pars$prior, 
                                                pars$proposal, pars$transform)
  
  
  pars$base$epoch_dates <-
    pars$base$epoch_dates[pars$base$epoch_dates <= sircovid_date(date)]
  keep_strain_epochs <- pars$base$strain_epochs <= length(pars$base$epoch_dates)
  pars$base$strain_epochs <- pars$base$strain_epochs[keep_strain_epochs]
  pars$base$date <- date
  
  pars
}
