orderly2::orderly_parameters(short_run = TRUE)

orderly2::orderly_dependency(
  "severity_fits_combined",
  'latest(parameter:data_changed == "original" && parameter:short_run == this:short_run && parameter:deterministic == TRUE)',
  c("inputs/original/east_of_england/fit.rds" = "regional_results/east_of_england/fit.rds",
    "inputs/original/london/fit.rds" = "regional_results/london/fit.rds",
    "inputs/original/midlands/fit.rds" = "regional_results/midlands/fit.rds",
    "inputs/original/north_east_and_yorkshire/fit.rds" = "regional_results/north_east_and_yorkshire/fit.rds",
    "inputs/original/north_west/fit.rds" = "regional_results/north_west/fit.rds",
    "inputs/original/south_east/fit.rds" = "regional_results/south_east/fit.rds",
    "inputs/original/south_west/fit.rds" = "regional_results/south_west/fit.rds"))
