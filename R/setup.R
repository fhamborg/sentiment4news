
#' Package Setup
#'
#' @param libname standart
#' @param pkgname standart
#'
#' @return tsc
#' @export
#'
#' @examples
#'
#'
#
pack <- new.env(parent = emptyenv())
NewsSentiment <- NULL

#' @export
.onload <- function(libname, pkgname){
  op <- options()
  op.devtools <- list(
    devtools.path = "~/R-dev",
    devtools.install.args = "",
    devtools.name = "Sentiment4News",
    devtools.desc.author = " Felix Hamborg <first.last@example.com> [aut, cre]",
    devtools.desc.license = "What license is it under?",
    devtools.desc.suggests = NULL,
    devtools.desc = list()
  )
  toset <- !(names(op.devtools) %in% names(op))
  if(any(toset)) options(op.devtools[toset])
  invisible()
  packageStartupMessage("Welcome to NewsSentiment")

  version <- "3.7.9"
  reticulate::install_python(version = version)
  reticulate::virtualenv_create("newssentiment-environment", version = version, packages = "NewsSentiment")
  reticulate::use_virtualenv("newssentiment-environment")
  NewsSentiment_p <<- reticulate::import("NewsSentiment", delay_load = TRUE)
  tsc <<- NewsSentiment_p$TargetSentimentClassifier()
  reticulate::py_function_wrapper(tsc.infer_from_text(), r_function= "py_infer")
  pack$tsc<- NewsSentiment_p$TargetSentimentClassifier()

  #reticulate::py_save_object(tsc, "tsc.pickle")


}

