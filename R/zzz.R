

#pack <- new.env(parent = emptyenv())
NewsSentiment <- NULL

.onLoad <- function(libname, pkgname) {

  packageStartupMessage("Welcome to NewsSentiment.
                        The first installation might take a couple of minutes.
                        But further uses of the package will be much faster.")

  version <- "3.7.9"
  reticulate::install_python(version = version)
  reticulate::virtualenv_create("newssentiment-environment", version = version, packages = "NewsSentiment")
  reticulate::use_virtualenv("newssentiment-environment")
  NewsSentiment_p <<- reticulate::import("NewsSentiment", delay_load = TRUE)
  tsc <<- NewsSentiment_p$TargetSentimentClassifier()
  #pack$tsc <- NewsSentiment_p$TargetSentimentClassifier()

}

