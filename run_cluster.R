## 1. severity_parsed_data
orderly2::orderly_run("severity_parsed_data")

## 2. severity_parameters 
orderly2::orderly_run("severity_parameters", 
                      parameters = list(deterministic = TRUE,
                                        data_changed = "original"))

## ---------------------------
## Run in the cluster
## ---------------------------

## 1. Context ----
setwd(orderly2:::orderly_src_root(NULL, TRUE))
packages <- c("sircovid", "lubridate", "coda", "tidyr", "ggplot2",
              "viridisLite", "orderly2", 'vaultr', 'readxl', "ggtext",
              'abind', 'here', "mcstate", "dust", "spimalot", "purrr",
              "stringr", "ggrepel", "naniar", "desplot", "rmarkdown",
              "jtools", "DescTools", "car", "data.table")
src <- conan::conan_sources(NULL,
                            repos = c("https://ncov-ic.r-universe.dev",
                                      "https://mrc-ide.r-universe.dev"))
ctx <- context::context_save("contexts",
                             packages = packages,
                             package_sources = src)
cfg <- didehpc::didehpc_config(cluster = "wpia-hn",
                               template = 'AllNodes',
                               cores = 8)
obj <- didehpc::queue_didehpc(ctx, config = cfg)

regions <- sircovid::regions("england")

#----

## 2. Short runs ----
fits <- 
  obj$lapply(X = regions,
             FUN = function(x) {
               orderly2::orderly_run('severity_fits',
                                     parameters = list(region = x,
                                                       short_run = TRUE,
                                                       deterministic = TRUE,
                                                       data_changed = "original"))})
batch <- fits$name

## Collect results
res <- obj$task_bundle_get(batch)$results()

# Combined
combined <- obj$enqueue(orderly2::orderly_run('severity_fits_combined',
                                              parameters = list(short_run = TRUE,
                                                                deterministic = TRUE,
                                                                data_changed = "original")))
combined_result <- combined$result()

#----

## 3. Long runs ----
fits <- 
  obj$lapply(X = regions,
             FUN = function(x) {
               orderly2::orderly_run('severity_fits',
                                     parameters = list(region = x,
                                                       short_run = FALSE,
                                                       deterministic = TRUE,
                                                       data_changed = "original"))})
batch <- fits$name

## Collect results
res <- obj$task_bundle_get(batch)$results()

# Combined
combined <- obj$enqueue(orderly2::orderly_run('severity_fits_combined',
                                              parameters = list(short_run = FALSE,
                                                                deterministic = TRUE,
                                                                data_changed = "original")))
combined_result <- combined$result()
