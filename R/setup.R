#library(devtools)
#devtools::check()
#library(usethis)
#usethis::use_r("infer_from_text")

"_PACKAGE"
pack <- new.env(parent = emptyenv())
NewsSentiment <- NULL

.onload <- function(libname, pkgname){
  version <- "3.7.9"
  reticulate::install_python(version = version)
  reticulate::virtualenv_create("newssentiment-environment", version = version, packages = "NewsSentiment")
  reticulate::use_virtualenv("newssentiment-environment")
  NewsSentiment <- reticulate::import("NewsSentiment", delay_load = TRUE)
  tsc <<- NewsSentiment$TargetSentimentClassifier()
  pack$tsc<- NewsSentiment$TargetSentimentClassifier()


}
