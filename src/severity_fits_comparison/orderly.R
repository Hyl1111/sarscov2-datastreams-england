orderly2::orderly_parameters(short_run = TRUE)

orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "original" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/original/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/original/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/original/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/original/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/original/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/original/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/original/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "deaths_hosp" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/deaths_hosp/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/deaths_hosp/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/deaths_hosp/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/deaths_hosp/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/deaths_hosp/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/deaths_hosp/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/deaths_hosp/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "deaths_comm" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/deaths_comm/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/deaths_comm/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/deaths_comm/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/deaths_comm/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/deaths_comm/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/deaths_comm/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/deaths_comm/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "icu" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/icu/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/icu/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/icu/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/icu/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/icu/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/icu/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/icu/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "general" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/general/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/general/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/general/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/general/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/general/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/general/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/general/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "hosp" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/hosp/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/hosp/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/hosp/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/hosp/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/hosp/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/hosp/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/hosp/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "all_admission" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/all_admission/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/all_admission/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/all_admission/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/all_admission/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/all_admission/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/all_admission/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/all_admission/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "pillar2" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/pillar2/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/pillar2/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/pillar2/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/pillar2/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/pillar2/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/pillar2/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/pillar2/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "ons" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/ons/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/ons/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/ons/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/ons/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/ons/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/ons/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/ons/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "react" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/react/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/react/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/react/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/react/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/react/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/react/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/react/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "strain" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/strain/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/strain/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/strain/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/strain/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/strain/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/strain/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/strain/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "sero" && parameter:short_run == this:short_run && parameter:deterministic == TRUE && parameter:change_rate==1)',
  c("inputs/sero/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/sero/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/sero/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/sero/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/sero/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/sero/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/sero/south_west/fit.rds" = "regional_results/south_west/fit.rds"))

orderly2::orderly_artefact("rds files for storing the data", c("outputs/pars.rds","outputs/pars_density_plots.rds","outputs/KL_divergence.rds"))
orderly2::orderly_artefact("plots of density distributions",c('outputs/east_of_england parameter distribution.pdf','outputs/london parameter distribution.pdf','outputs/midlands parameter distribution.pdf','outputs/north_east_and_yorkshire parameter distribution.pdf','outputs/north_west parameter distribution.pdf','outputs/south_east parameter distribution.pdf','outputs/south_west parameter distribution.pdf'))

library(ggplot2)
library(reshape2)
library(gridExtra)
library(ggpubr)

fit_east_original <- readRDS("inputs/original/east_of_england/fit.rds")
fit_london_original <- readRDS("inputs/original/london/fit.rds")
fit_midlands_original <- readRDS("inputs/original/midlands/fit.rds")
fit_northeast_original <- readRDS("inputs/original/north_east_and_yorkshire/fit.rds")
fit_northwest_original <- readRDS("inputs/original/north_west/fit.rds")
fit_southeast_original <- readRDS("inputs/original/south_east/fit.rds")
fit_southwest_original <- readRDS("inputs/original/south_west/fit.rds")

fit_east_deaths_hosp <- readRDS("inputs/deaths_hosp/east_of_england/fit.rds")
fit_london_deaths_hosp <- readRDS("inputs/deaths_hosp/london/fit.rds")
fit_midlands_deaths_hosp <- readRDS("inputs/deaths_hosp/midlands/fit.rds")
fit_northeast_deaths_hosp <- readRDS("inputs/deaths_hosp/north_east_and_yorkshire/fit.rds")
fit_northwest_deaths_hosp <- readRDS("inputs/deaths_hosp/north_west/fit.rds")
fit_southeast_deaths_hosp <- readRDS("inputs/deaths_hosp/south_east/fit.rds")
fit_southwest_deaths_hosp <- readRDS("inputs/deaths_hosp/south_west/fit.rds")

fit_east_deaths_comm <- readRDS("inputs/deaths_comm/east_of_england/fit.rds")
fit_london_deaths_comm <- readRDS("inputs/deaths_comm/london/fit.rds")
fit_midlands_deaths_comm <- readRDS("inputs/deaths_comm/midlands/fit.rds")
fit_northeast_deaths_comm <- readRDS("inputs/deaths_comm/north_east_and_yorkshire/fit.rds")
fit_northwest_deaths_comm <- readRDS("inputs/deaths_comm/north_west/fit.rds")
fit_southeast_deaths_comm <- readRDS("inputs/deaths_comm/south_east/fit.rds")
fit_southwest_deaths_comm <- readRDS("inputs/deaths_comm/south_west/fit.rds")

fit_east_icu <- readRDS("inputs/icu/east_of_england/fit.rds")
fit_london_icu <- readRDS("inputs/icu/london/fit.rds")
fit_midlands_icu <- readRDS("inputs/icu/midlands/fit.rds")
fit_northeast_icu <- readRDS("inputs/icu/north_east_and_yorkshire/fit.rds")
fit_northwest_icu <- readRDS("inputs/icu/north_west/fit.rds")
fit_southeast_icu <- readRDS("inputs/icu/south_east/fit.rds")
fit_southwest_icu <- readRDS("inputs/icu/south_west/fit.rds")

pars_east<-list(original=fit_east_original$samples$pars,deaths_hosp=fit_east_deaths_hosp$samples$pars,deaths_comm=fit_east_deaths_comm$samples$pars,icu=fit_east_icu$samples$pars)
pars_london<-list(original=fit_london_original$samples$pars,deaths_hosp=fit_london_deaths_hosp$samples$pars,deaths_comm=fit_london_deaths_comm$samples$pars,icu=fit_london_icu$samples$pars)
pars_midlands<-list(original=fit_midlands_original$samples$pars,deaths_hosp=fit_midlands_deaths_hosp$samples$pars,deaths_comm=fit_midlands_deaths_comm$samples$pars,icu=fit_midlands_icu$samples$pars)
pars_northeast<-list(original=fit_northeast_original$samples$pars,deaths_hosp=fit_northeast_deaths_hosp$samples$pars,deaths_comm=fit_northeast_deaths_comm$samples$pars,icu=fit_northeast_icu$samples$pars)
pars_northwest<-list(original=fit_northwest_original$samples$pars,deaths_hosp=fit_northwest_deaths_hosp$samples$pars,deaths_comm=fit_northwest_deaths_comm$samples$pars,icu=fit_northwest_icu$samples$pars)
pars_southeast<-list(original=fit_southeast_original$samples$pars,deaths_hosp=fit_southeast_deaths_hosp$samples$pars,deaths_comm=fit_southeast_deaths_comm$samples$pars,icu=fit_southeast_icu$samples$pars)
pars_southwest<-list(original=fit_southwest_original$samples$pars,deaths_hosp=fit_southwest_deaths_hosp$samples$pars,deaths_comm=fit_southwest_deaths_comm$samples$pars,icu=fit_southwest_icu$samples$pars)

gdata::keep(pars_east,pars_london,pars_midlands,pars_northeast,pars_northwest,pars_southeast,pars_southwest,sure=TRUE)

fit_east_general <- readRDS("inputs/general/east_of_england/fit.rds")
fit_london_general <- readRDS("inputs/general/london/fit.rds")
fit_midlands_general <- readRDS("inputs/general/midlands/fit.rds")
fit_northeast_general <- readRDS("inputs/general/north_east_and_yorkshire/fit.rds")
fit_northwest_general <- readRDS("inputs/general/north_west/fit.rds")
fit_southeast_general <- readRDS("inputs/general/south_east/fit.rds")
fit_southwest_general <- readRDS("inputs/general/south_west/fit.rds")

fit_east_hosp <- readRDS("inputs/hosp/east_of_england/fit.rds")
fit_london_hosp <- readRDS("inputs/hosp/london/fit.rds")
fit_midlands_hosp <- readRDS("inputs/hosp/midlands/fit.rds")
fit_northeast_hosp <- readRDS("inputs/hosp/north_east_and_yorkshire/fit.rds")
fit_northwest_hosp <- readRDS("inputs/hosp/north_west/fit.rds")
fit_southeast_hosp <- readRDS("inputs/hosp/south_east/fit.rds")
fit_southwest_hosp <- readRDS("inputs/hosp/south_west/fit.rds")

pars_east2<-list(general=fit_east_general$samples$pars,hosp=fit_east_hosp$samples$pars)
pars_london2<-list(general=fit_london_general$samples$pars,hosp=fit_london_hosp$samples$pars)
pars_midlands2<-list(general=fit_midlands_general$samples$pars,hosp=fit_midlands_hosp$samples$pars)
pars_northeast2<-list(general=fit_northeast_general$samples$pars,hosp=fit_northeast_hosp$samples$pars)
pars_northwest2<-list(general=fit_northwest_general$samples$pars,hosp=fit_northwest_hosp$samples$pars)
pars_southeast2<-list(general=fit_southeast_general$samples$pars,hosp=fit_southeast_hosp$samples$pars)
pars_southwest2<-list(general=fit_southwest_general$samples$pars,hosp=fit_southwest_hosp$samples$pars)
pars_east=append(pars_east,pars_east2)
pars_london=append(pars_london,pars_london2)
pars_midlands=append(pars_midlands,pars_midlands2)
pars_northeast=append(pars_northeast,pars_northeast2)
pars_northwest=append(pars_northwest,pars_northwest2)
pars_southeast=append(pars_southeast,pars_southeast2)
pars_southwest=append(pars_southwest,pars_southwest2)

gdata::keep(pars_east,pars_london,pars_midlands,pars_northeast,pars_northwest,pars_southeast,pars_southwest,sure=TRUE)

fit_east_all_admission <- readRDS("inputs/all_admission/east_of_england/fit.rds")
fit_london_all_admission <- readRDS("inputs/all_admission/london/fit.rds")
fit_midlands_all_admission <- readRDS("inputs/all_admission/midlands/fit.rds")
fit_northeast_all_admission <- readRDS("inputs/all_admission/north_east_and_yorkshire/fit.rds")
fit_northwest_all_admission <- readRDS("inputs/all_admission/north_west/fit.rds")
fit_southeast_all_admission <- readRDS("inputs/all_admission/south_east/fit.rds")
fit_southwest_all_admission <- readRDS("inputs/all_admission/south_west/fit.rds")

fit_east_pillar2 <- readRDS("inputs/pillar2/east_of_england/fit.rds")
fit_london_pillar2 <- readRDS("inputs/pillar2/london/fit.rds")
fit_midlands_pillar2 <- readRDS("inputs/pillar2/midlands/fit.rds")
fit_northeast_pillar2 <- readRDS("inputs/pillar2/north_east_and_yorkshire/fit.rds")
fit_northwest_pillar2 <- readRDS("inputs/pillar2/north_west/fit.rds")
fit_southeast_pillar2 <- readRDS("inputs/pillar2/south_east/fit.rds")
fit_southwest_pillar2 <- readRDS("inputs/pillar2/south_west/fit.rds")

fit_east_ons <- readRDS("inputs/ons/east_of_england/fit.rds")
fit_london_ons <- readRDS("inputs/ons/london/fit.rds")
fit_midlands_ons <- readRDS("inputs/ons/midlands/fit.rds")
fit_northeast_ons <- readRDS("inputs/ons/north_east_and_yorkshire/fit.rds")
fit_northwest_ons <- readRDS("inputs/ons/north_west/fit.rds")
fit_southeast_ons <- readRDS("inputs/ons/south_east/fit.rds")
fit_southwest_ons <- readRDS("inputs/ons/south_west/fit.rds")

pars_east2<-list(all_admission=fit_east_all_admission$samples$pars,pillar2=fit_east_pillar2$samples$pars,ons=fit_east_ons$samples$pars)
pars_london2<-list(all_admission=fit_london_all_admission$samples$pars,pillar2=fit_london_pillar2$samples$pars,ons=fit_london_ons$samples$pars)
pars_midlands2<-list(all_admission=fit_midlands_all_admission$samples$pars,pillar2=fit_midlands_pillar2$samples$pars,ons=fit_midlands_ons$samples$pars)
pars_northeast2<-list(all_admission=fit_northeast_all_admission$samples$pars,pillar2=fit_northeast_pillar2$samples$pars,ons=fit_northeast_ons$samples$pars)
pars_northwest2<-list(all_admission=fit_northwest_all_admission$samples$pars,pillar2=fit_northwest_pillar2$samples$pars,ons=fit_northwest_ons$samples$pars)
pars_southeast2<-list(all_admission=fit_southeast_all_admission$samples$pars,pillar2=fit_southeast_pillar2$samples$pars,ons=fit_southeast_ons$samples$pars)
pars_southwest2<-list(all_admission=fit_southwest_all_admission$samples$pars,pillar2=fit_southwest_pillar2$samples$pars,ons=fit_southwest_ons$samples$pars)
pars_east=append(pars_east,pars_east2)
pars_london=append(pars_london,pars_london2)
pars_midlands=append(pars_midlands,pars_midlands2)
pars_northeast=append(pars_northeast,pars_northeast2)
pars_northwest=append(pars_northwest,pars_northwest2)
pars_southeast=append(pars_southeast,pars_southeast2)
pars_southwest=append(pars_southwest,pars_southwest2)

gdata::keep(pars_east,pars_london,pars_midlands,pars_northeast,pars_northwest,pars_southeast,pars_southwest,sure=TRUE)

fit_east_react <- readRDS("inputs/react/east_of_england/fit.rds")
fit_london_react <- readRDS("inputs/react/london/fit.rds")
fit_midlands_react <- readRDS("inputs/react/midlands/fit.rds")
fit_northeast_react <- readRDS("inputs/react/north_east_and_yorkshire/fit.rds")
fit_northwest_react <- readRDS("inputs/react/north_west/fit.rds")
fit_southeast_react <- readRDS("inputs/react/south_east/fit.rds")
fit_southwest_react <- readRDS("inputs/react/south_west/fit.rds")

fit_east_strain <- readRDS("inputs/strain/east_of_england/fit.rds")
fit_london_strain <- readRDS("inputs/strain/london/fit.rds")
fit_midlands_strain <- readRDS("inputs/strain/midlands/fit.rds")
fit_northeast_strain <- readRDS("inputs/strain/north_east_and_yorkshire/fit.rds")
fit_northwest_strain <- readRDS("inputs/strain/north_west/fit.rds")
fit_southeast_strain <- readRDS("inputs/strain/south_east/fit.rds")
fit_southwest_strain <- readRDS("inputs/strain/south_west/fit.rds")

fit_east_sero <- readRDS("inputs/sero/east_of_england/fit.rds")
fit_london_sero <- readRDS("inputs/sero/london/fit.rds")
fit_midlands_sero <- readRDS("inputs/sero/midlands/fit.rds")
fit_northeast_sero <- readRDS("inputs/sero/north_east_and_yorkshire/fit.rds")
fit_northwest_sero <- readRDS("inputs/sero/north_west/fit.rds")
fit_southeast_sero <- readRDS("inputs/sero/south_east/fit.rds")
fit_southwest_sero <- readRDS("inputs/sero/south_west/fit.rds")

pars_east2<-list(react=fit_east_react$samples$pars,strain=fit_east_strain$samples$pars,sero=fit_east_sero$samples$pars)
pars_london2<-list(react=fit_london_react$samples$pars,strain=fit_london_strain$samples$pars,sero=fit_london_sero$samples$pars)
pars_midlands2<-list(react=fit_midlands_react$samples$pars,strain=fit_midlands_strain$samples$pars,sero=fit_midlands_sero$samples$pars)
pars_northeast2<-list(react=fit_northeast_react$samples$pars,strain=fit_northeast_strain$samples$pars,sero=fit_northeast_sero$samples$pars)
pars_northwest2<-list(react=fit_northwest_react$samples$pars,strain=fit_northwest_strain$samples$pars,sero=fit_northwest_sero$samples$pars)
pars_southeast2<-list(react=fit_southeast_react$samples$pars,strain=fit_southeast_strain$samples$pars,sero=fit_southeast_sero$samples$pars)
pars_southwest2<-list(react=fit_southwest_react$samples$pars,strain=fit_southwest_strain$samples$pars,sero=fit_southwest_sero$samples$pars)
pars_east=append(pars_east,pars_east2)
pars_london=append(pars_london,pars_london2)
pars_midlands=append(pars_midlands,pars_midlands2)
pars_northeast=append(pars_northeast,pars_northeast2)
pars_northwest=append(pars_northwest,pars_northwest2)
pars_southeast=append(pars_southeast,pars_southeast2)
pars_southwest=append(pars_southwest,pars_southwest2)

gdata::keep(pars_east,pars_london,pars_midlands,pars_northeast,pars_northwest,pars_southeast,pars_southwest,sure=TRUE)
pars<-list(east_of_england=pars_east,london=pars_london,midlands=pars_midlands,north_east_and_yorkshire=pars_northeast,north_west=pars_northwest,south_east=pars_southeast,south_west=pars_southwest)
if (!dir.exists('outputs')) {
  dir.create('outputs')
}
saveRDS(pars,file = 'outputs/pars.rds')
gdata::keep(pars,sure=TRUE)

regions <- sircovid::regions("england")

pars_density_plots=as.list(matrix(nrow = length(regions), ncol=1))
names(pars_density_plots)=regions
KL_divergence=as.list(matrix(nrow = length(regions), ncol=1))
names(KL_divergence)=regions

for (r in regions){
  pars_density_plots[[r]]= as.list(matrix(nrow = length(colnames(pars[[r]]$original))+1,ncol=1))
  names(pars_density_plots[[r]]) = c('grided_plots',colnames(pars[[r]]$original))
  pars_density_plots[[r]]$grided_plots = as.list(matrix(nrow=length(colnames(pars[[r]]$original)),ncol=1))
  names(pars_density_plots[[r]]$grided_plots) = colnames(pars[[r]]$original)
  KL_divergence[[r]]= as.list(matrix(nrow = length(colnames(pars[[r]]$original)),ncol=1))
  names(KL_divergence[[r]]) = colnames(pars[[r]]$original)
  
  for (parameter in colnames(pars[[r]]$original)){
    pars_density_plots[[r]][[parameter]] = as.list(matrix(nrow=length(names(pars[[r]])),ncol=1))
    names(pars_density_plots[[r]][[parameter]]) = names(pars[[r]])
    KL_divergence[[r]][[parameter]] = as.list(matrix(nrow=length(names(pars[[r]])),ncol=1))
    names(KL_divergence[[r]][[parameter]]) = names(pars[[r]])
    
    for (dataOff in names(pars[[r]])){
      if (dataOff=='original'){
        temp=as.data.frame(pars[[r]]$original)
        temp=as.data.frame(temp[,colnames(temp) %in% parameter])
        colnames(temp)=parameter
        pars_density_plots[[r]][[parameter]][[dataOff]] <-
          ggplot(temp, aes(get(parameter)))+
          geom_density(color='#f8766d',fill='#f8766d',alpha=0.6)+
          ggtitle('original')+
          xlab(parameter)
        KL_divergence[[r]][[parameter]][[dataOff]] <- 0
      }else{
        temp=data.frame(pars[[r]]$original[,colnames(pars[[r]]$original) %in% parameter],pars[[r]][[dataOff]][,colnames(pars[[r]][[dataOff]]) %in% parameter])
        colnames(temp)=c('original',dataOff)
        
        original <- density(temp[,1])
        changed <- density(temp[,2])
        common_support <- sort(union(original$x,changed$x))
        original_interp <- approx(original$x,original$y,xout=common_support,method = 'linear')$y
        changed_interp <- approx(changed$x,changed$y,xout=common_support, method = 'linear')$y
        original_interp[is.na(original_interp)] <- 0
        changed_interp[is.na(changed_interp)] <- 0
        
        X<-rbind(original_interp/sum(original_interp),changed_interp/sum(changed_interp))
        KL<-philentropy::KL(X)
        
        temp=melt(temp,variable.name='data_off')
        subtitle=paste("origianl &",dataOff, 'KL_div =', round(KL,4))
        pars_density_plots[[r]][[parameter]][[dataOff]] <-
          ggplot(temp, aes(value,fill=data_off,color=data_off))+
          geom_density(alpha=0.6)+
          ggtitle(subtitle)+
          xlab(parameter)
        KL_divergence[[r]][[parameter]][[dataOff]] <- KL
      }
    }
    title=paste(parameter,'in', r)
    grided<-grid.arrange(grobs=pars_density_plots[[r]][[parameter]],newpage = TRUE)
    #    annotate_figure(grided,top=ggpubr::text_grob(title,face='bold',size=18))
    pars_density_plots[[r]]$grided_plots[[parameter]]=grided
    #    title=paste0(parameter, ' in ', r, '.pdf')
    #    ggsave(title,plot = grided, width =11.69, height =8.27)
    graphics.off()
  }
  pdf(paste0('outputs/',r,' parameter distribution.pdf'),width =11.69, height =8.27)
  for (i in names(pars_density_plots[[r]]$grided_plots)){
    print(grid.arrange(pars_density_plots[[r]]$grided_plots[[i]]))
  }
  dev.off()
  graphics.off()
}

saveRDS(pars_density_plots,file = 'outputs/pars_density_plots.rds')

graphics.off()

saveRDS(KL_divergence,file = 'outputs/KL_divergence.rds')
