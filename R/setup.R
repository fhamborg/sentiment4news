
#' Package Setup
#'
#' @param libname Generic.
#' @param pkgname Generic.
#'
#' @return
#' @export
#'
#' @examples
#'
#'
#' #
pack <- new.env(parent = emptyenv())
NewsSentiment <- NULL

#' @export
.onload <- function(libname, pkgname) {

  packageStartupMessage("Welcome to NewsSentiment.
                        The first installation might take a couple of minutes.
                        But further uses of the package will be much faster.")

  version <- "3.7.9"
  reticulate::install_python(version = version)
  reticulate::virtualenv_create("newssentiment-environment", version = version, packages = "NewsSentiment")
  reticulate::use_virtualenv("newssentiment-environment")
  # tsc <- reticulate::import("NewsSentiment.TargetSentimentClassifier")
  NewsSentiment_p <<- reticulate::import("NewsSentiment") # , delay_load = TRUE)
  tsc <<- NewsSentiment_p$TargetSentimentClassifier()
  reticulate::py_function_wrapper(tsc.infer_from_text(), r_function = "py_infer")
  pack$tsc <- NewsSentiment_p$TargetSentimentClassifier()

}
