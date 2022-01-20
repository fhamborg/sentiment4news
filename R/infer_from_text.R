#' Title infer_from_text
#'
#' @param left the text from the beginning of the sentence to the mention of the
#' target (will be empty if the sentence starts with the mention of the target).
#' Make sure to include a space if there is one between the left phrase and the
#' target mention, e.g., "I like Peter." -> left="I like ", target="Peter", right=".".""
#' @param target The mention of the target.
#' @param right The text from the end of the target to the end of the sentence.
#' Make sure to include a space if there is one between the target and the next word
#' of the sentence.
#'
#' @return
#' @export
#'
#' @examples
#'
#'

#' @export
infer<- function(left, target, right) {
  tsc$infer_from_text(left, target, right)
}

