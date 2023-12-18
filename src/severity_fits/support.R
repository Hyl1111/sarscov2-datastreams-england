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


fix_unused_parameters <- function(pars, date) {
  
  ## Automatically detect which betas to fix
  ## We need to keep all betas up to the first one with date greater than or 
  ## equal to the date parameter
  i <- max(which(pars$base$beta_date < sircovid::sircovid_date(date)))
  beta_fixed <- setdiff(pars$base$beta_names, sprintf("beta%d", seq_len(i + 1)))
  
  ## Now we will fix other parameters that have no impact before the date
  ## parameter
  
  ## Note firstly that the following parameters are required whatever
  ## the date parameter is:
  ## "alpha_admission", "alpha_D", "alpha_death_hosp", "alpha_H", "p_G_D","p_H",
  ## "p_H_D", "p_ICU", "p_ICU_D", "p_W_D", "start_date"
  
  ## Now we declare the date from which these parameters have an impact
  pars_dates <- list(
    ## Various changepoint parameters. We must include them the day after the
    ## previous changepoint
    mu_D = "2020-04-02",
    mu_D_2 = "2020-09-16",
    mu_D_3 = "2020-12-02",
    mu_D_4 = "2021-02-05",
    mu_D_5 = "2021-11-05",
    mu_gamma_H = "2020-12-02",
    mu_gamma_H_2 = "2021-01-02",
    mu_gamma_H_3 = "2021-03-02",
    mu_gamma_H_4 = "2021-06-02",
    p_G_D_2 = "2020-05-02",
    p_H_2 = "2021-11-05",
    p_ICU_2 = "2020-04-02",
    
    ## Pillar 2 parameters - we start fitting pillar 2 from 2020-06-18
    ## This is a Thursday, so first weekend day is 2020-06-20
    p_NC_15_24 = "2020-06-18",
    p_NC_25_49 = "2020-06-18",
    p_NC_50_64 = "2020-06-18",
    p_NC_65_79 = "2020-06-18",
    p_NC_80_plus = "2020-06-18",
    p_NC_weekend_15_24 = "2020-06-20",  
    p_NC_weekend_25_49 = "2020-06-20", 
    p_NC_weekend_50_64 = "2020-06-20", 
    p_NC_weekend_65_79 = "2020-06-20", 
    p_NC_weekend_80_plus = "2020-06-20", 
    rho_pillar2_tests = "2020-06-18",
    
    ## alpha parameters
    rel_p_D_alpha = "2020-09-17",
    rel_p_H_alpha = "2020-09-17",
    rel_p_ICU_alpha = "2020-09-17",
    seed_date_alpha = "2020-09-17",
    ta_alpha = "2020-09-17",
    
    ## delta parameters
    rel_p_D_delta = "2021-03-08",
    rel_p_H_delta = "2021-03-08",
    rel_p_ICU_delta = "2021-03-08",
    seed_date_delta = "2021-03-08",
    ta_delta = "2021-03-08",
    
    ## omicron parameters
    rel_p_D_omicron = "2021-11-01",
    rel_p_H_omicron = "2021-11-01",
    rel_p_ICU_omicron = "2021-11-01",
    seed_date_omicron = "2021-11-01",
    ta_omicron = "2021-11-01"
  )

  ## Fix parameters
  fixed <- c(beta_fixed, names(pars_dates)[pars_dates > date])
  pars$mcmc <- pars$mcmc$fix(pars$mcmc$initial()[fixed])
  
  pars
}

add_full_proposal <- function(dat, pars) {
  
  new_prop <- dat$fit$parameters$proposal
  old_prop <- pars$proposal
  
  new_prop_pars <- new_prop$name
  
  full_prop <- data.frame(0 * old_prop)
  full_prop[new_prop_pars, new_prop_pars] <- new_prop[, -c(1, 2)]
  full_prop <- cbind(data.frame(region = dat$fit$samples$info$region,
                                name = rownames(full_prop)),
                     full_prop)
  rownames(full_prop) <- NULL
  dat$fit$parameters$proposal <- full_prop
  
  dat
}

change_data <- function(data, data_changed,change_rate) {
  if (data_changed =="original"){
  }else if(length(change_rate)==1) {
    for (i in data_changed){
      if(i=="deaths_hosp"){
        index<-which(!is.na(data[,"deaths_hosp_0_49"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"deaths_hosp"]=NA
        data[index,"deaths_hosp_0_49"]=NA
        data[index,"deaths_hosp_50_54"]=NA
        data[index,"deaths_hosp_55_59"]=NA
        data[index,"deaths_hosp_60_64"]=NA
        data[index,"deaths_hosp_65_69"]=NA
        data[index,"deaths_hosp_70_74"]=NA
        data[index,"deaths_hosp_75_79"]=NA
        data[index,"deaths_hosp_80_plus"]=NA
      }else if(i=="deaths_comm"){
        index<-which(!is.na(data[,"deaths_comm_0_49"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"deaths_comm"]=NA
        data[index,"deaths_comm_0_49"]=NA
        data[index,"deaths_comm_50_54"]=NA
        data[index,"deaths_comm_55_59"]=NA
        data[index,"deaths_comm_60_64"]=NA
        data[index,"deaths_comm_65_69"]=NA
        data[index,"deaths_comm_70_74"]=NA
        data[index,"deaths_comm_75_79"]=NA
        data[index,"deaths_comm_80_plus"]=NA
      }else if(i=="icu"){
        index<-which(!is.na(data[,"icu"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"icu"]=NA
      }else if(i=="general"){
        index<-which(!is.na(data[,"general"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"general"]=NA
      }else if(i=="hosp"){
        index<-which(!is.na(data[,"hosp"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"hosp"]=NA
      }else if(i=="all_admission"){
        index<-which(!is.na(data[,"all_admission_0_9"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"all_admission"]=NA
        data[index,"all_admission_0_9"]=NA
        data[index,"all_admission_10_19"]=NA
        data[index,"all_admission_20_29"]=NA
        data[index,"all_admission_30_39"]=NA
        data[index,"all_admission_40_49"]=NA
        data[index,"all_admission_50_59"]=NA
        data[index,"all_admission_60_69"]=NA
        data[index,"all_admission_70_79"]=NA
        data[index,"all_admission_80_plus"]=NA
      }else if(i=="pillar2"){
        index<-which(!is.na(data[,"pillar2_15_24_tot"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"pillar2_tot"]=NA
        data[index,"pillar2_pos"]=NA
        data[index,"pillar2_cases"]=NA
        data[index,"pillar2_over25_tot"]=NA
        data[index,"pillar2_over25_pos"]=NA
        data[index,"pillar2_over25_cases"]=NA
        data[index,"pillar2_under15_tot"]=NA
        data[index,"pillar2_under15_pos"]=NA
        data[index,"pillar2_under15_cases"]=NA
        data[index,"pillar2_15_24_tot"]=NA
        data[index,"pillar2_15_24_pos"]=NA
        data[index,"pillar2_15_24_cases"]=NA
        data[index,"pillar2_25_49_tot"]=NA
        data[index,"pillar2_25_49_pos"]=NA
        data[index,"pillar2_25_49_cases"]=NA
        data[index,"pillar2_50_64_tot"]=NA
        data[index,"pillar2_50_64_pos"]=NA
        data[index,"pillar2_50_64_cases"]=NA
        data[index,"pillar2_65_79_tot"]=NA
        data[index,"pillar2_65_79_pos"]=NA
        data[index,"pillar2_65_79_cases"]=NA
        data[index,"pillar2_80_plus_tot"]=NA
        data[index,"pillar2_80_plus_pos"]=NA
        data[index,"pillar2_80_plus_cases"]=NA
      }else if(i=="ons"){
        index<-which(!is.na(data[,"ons_pos"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"ons_pos"]=NA
        data[index,"ons_tot"]=NA
      }else if(i=="react"){
        index<-union(which(!is.na(data[,"react_pos"])),which(!is.na(data[,"react_tot"])),which(!is.na(data[,"react_5_24_pos"])),which(!is.na(data[,"react_5_24_tot"])),which(!is.na(data[,"react_25_34_pos"])),which(!is.na(data[,"react_25_34_tot"])),which(!is.na(data[,"react_35_44_pos"])),which(!is.na(data[,"react_35_44_tot"])),which(!is.na(data[,"react_45_54_pos"])),which(!is.na(data[,"react_45_54_tot"])),which(!is.na(data[,"react_55_64_pos"])),which(!is.na(data[,"react_55_64_tot"])),which(!is.na(data[,"react_65_plus_pos"])),which(!is.na(data[,"react_65_plus_tot"])))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"react_pos"]=NA
        data[index,"react_tot"]=NA
        data[index,"react_5_24_pos"]=NA
        data[index,"react_5_24_tot"]=NA
        data[index,"react_25_34_pos"]=NA
        data[index,"react_25_34_tot"]=NA
        data[index,"react_35_44_pos"]=NA
        data[index,"react_35_44_tot"]=NA
        data[index,"react_45_54_pos"]=NA
        data[index,"react_45_54_tot"]=NA
        data[index,"react_55_64_pos"]=NA
        data[index,"react_55_64_tot"]=NA
        data[index,"react_65_plus_pos"]=NA
        data[index,"react_65_plus_tot"]=NA
      }else if(i=="strain"){
        index<-which(!is.na(data[,"strain_non_variant"]))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"strain_non_variant"]=NA
        data[index,"strain_tot"]=NA
        data[index,"strain_over25_tot"]=NA
        data[index,"strain_over25_non_variant"]=NA
      }else if(i=="sero"){
        index<-union(which(!is.na(data[,"sero_pos_15_64_1"])),which(!is.na(data[,"sero_tot_15_64_1"])),which(!is.na(data[,"sero_pos_15_64_2"])),which(!is.na(data[,"sero_tot_15_64_2"])))
        index=sample(index,length(index)*change_rate,replace = FALSE)
        data[index,"sero_pos_15_64_1"]=NA
        data[index,"sero_pos_15_64_2"]=NA
        data[index,"sero_tot_15_64_1"]=NA
        data[index,"sero_tot_15_64_2"]=NA
      }else{
        stop("Please check the name of the data stream")
      }
    }
  }else if(length(data_changed)==length(change_rate)){
    for (j in 1:length(data_changed)){
      i=data_changed[j]
      if(i=="death_hosp"){
        index<-which(!is.na(data[,"deaths_hosp_0_49"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"deaths_hosp"]=NA
        data[index,"deaths_hosp_0_49"]=NA
        data[index,"deaths_hosp_50_54"]=NA
        data[index,"deaths_hosp_55_59"]=NA
        data[index,"deaths_hosp_60_64"]=NA
        data[index,"deaths_hosp_65_69"]=NA
        data[index,"deaths_hosp_70_74"]=NA
        data[index,"deaths_hosp_75_79"]=NA
        data[index,"deaths_hosp_80_plus"]=NA
      }else if(i=="deaths_comm"){
        index<-which(!is.na(data[,"deaths_comm_0_49"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"deaths_comm"]=NA
        data[index,"deaths_comm_0_49"]=NA
        data[index,"deaths_comm_50_54"]=NA
        data[index,"deaths_comm_55_59"]=NA
        data[index,"deaths_comm_60_64"]=NA
        data[index,"deaths_comm_65_69"]=NA
        data[index,"deaths_comm_70_74"]=NA
        data[index,"deaths_comm_75_79"]=NA
        data[index,"deaths_comm_80_plus"]=NA
      }else if(i=="icu"){
        index<-which(!is.na(data[,"icu"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"icu"]=NA
      }else if(i=="general"){
        index<-which(!is.na(data[,"general"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"general"]=NA
      }else if(i=="hosp"){
        index<-which(!is.na(data[,"hosp"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"hosp"]=NA
      }else if(i=="all_admission"){
        index<-which(!is.na(data[,"all_admission_0_9"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"all_admission"]=NA
        data[index,"all_admission_0_9"]=NA
        data[index,"all_admission_10_19"]=NA
        data[index,"all_admission_20_29"]=NA
        data[index,"all_admission_30_39"]=NA
        data[index,"all_admission_40_49"]=NA
        data[index,"all_admission_50_59"]=NA
        data[index,"all_admission_60_69"]=NA
        data[index,"all_admission_70_79"]=NA
        data[index,"all_admission_80_plus"]=NA
      }else if(i=="pillar2"){
        index<-which(!is.na(data[,"pillar2_15_24_tot"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"pillar2_tot"]=NA
        data[index,"pillar2_pos"]=NA
        data[index,"pillar2_cases"]=NA
        data[index,"pillar2_over25_tot"]=NA
        data[index,"pillar2_over25_pos"]=NA
        data[index,"pillar2_over25_cases"]=NA
        data[index,"pillar2_under15_tot"]=NA
        data[index,"pillar2_under15_pos"]=NA
        data[index,"pillar2_under15_cases"]=NA
        data[index,"pillar2_15_24_tot"]=NA
        data[index,"pillar2_15_24_pos"]=NA
        data[index,"pillar2_15_24_cases"]=NA
        data[index,"pillar2_25_49_tot"]=NA
        data[index,"pillar2_25_49_pos"]=NA
        data[index,"pillar2_25_49_cases"]=NA
        data[index,"pillar2_50_64_tot"]=NA
        data[index,"pillar2_50_64_pos"]=NA
        data[index,"pillar2_50_64_cases"]=NA
        data[index,"pillar2_65_79_tot"]=NA
        data[index,"pillar2_65_79_pos"]=NA
        data[index,"pillar2_65_79_cases"]=NA
        data[index,"pillar2_80_plus_tot"]=NA
        data[index,"pillar2_80_plus_pos"]=NA
        data[index,"pillar2_80_plus_cases"]=NA
      }else if(i=="ons"){
        index<-which(!is.na(data[,"ons_pos"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"ons_pos"]=NA
        data[index,"ons_tot"]=NA
      }else if(i=="react"){
        index<-union(which(!is.na(data[,"react_pos"])),which(!is.na(data[,"react_tot"])),which(!is.na(data[,"react_5_24_pos"])),which(!is.na(data[,"react_5_24_tot"])),which(!is.na(data[,"react_25_34_pos"])),which(!is.na(data[,"react_25_34_tot"])),which(!is.na(data[,"react_35_44_pos"])),which(!is.na(data[,"react_35_44_tot"])),which(!is.na(data[,"react_45_54_pos"])),which(!is.na(data[,"react_45_54_tot"])),which(!is.na(data[,"react_55_64_pos"])),which(!is.na(data[,"react_55_64_tot"])),which(!is.na(data[,"react_65_plus_pos"])),which(!is.na(data[,"react_65_plus_tot"])))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"react_pos"]=NA
        data[index,"react_tot"]=NA
        data[index,"react_5_24_pos"]=NA
        data[index,"react_5_24_tot"]=NA
        data[index,"react_25_34_pos"]=NA
        data[index,"react_25_34_tot"]=NA
        data[index,"react_35_44_pos"]=NA
        data[index,"react_35_44_tot"]=NA
        data[index,"react_45_54_pos"]=NA
        data[index,"react_45_54_tot"]=NA
        data[index,"react_55_64_pos"]=NA
        data[index,"react_55_64_tot"]=NA
        data[index,"react_65_plus_pos"]=NA
        data[index,"react_65_plus_tot"]=NA
      }else if(i=="strain"){
        index<-which(!is.na(data[,"strain_non_variant"]))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"strain_non_variant"]=NA
        data[index,"strain_tot"]=NA
        data[index,"strain_over25_tot"]=NA
        data[index,"strain_over25_non_variant"]=NA
      }else if(i=="sero"){
        index<-union(which(!is.na(data[,"sero_pos_15_64_1"])),which(!is.na(data[,"sero_tot_15_64_1"])),which(!is.na(data[,"sero_pos_15_64_2"])),which(!is.na(data[,"sero_tot_15_64_2"])))
        index=sample(index,length(index)*change_rate[j],replace = FALSE)
        data[index,"sero_pos_15_64_1"]=NA
        data[index,"sero_pos_15_64_2"]=NA
        data[index,"sero_tot_15_64_1"]=NA
        data[index,"sero_tot_15_64_2"]=NA
      }else{
        stop("Please check the name of the data stream")
      }
    }
  }else{
    stop("The length of change_rate should equal to either 1 or the length of data_changed")
  }

  data
}
