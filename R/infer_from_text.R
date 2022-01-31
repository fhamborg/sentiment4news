#' infer_from_text
#'
#' @param left The text from the beginning of the sentence to the mention of the
#' target (will be empty if the sentence starts with the mention of the target).
#' Make sure to include a space if there is one between the left phrase and the
#' target mention, e.g., "I like Peter." -> left="I like ", target="Peter",
#' right=".".""
#' @param target The mention of the target.
#' @param right The text from the end of the target to the end of the sentence.
#' Make sure to include a space if there is one between the target and the next
#' word of the sentence.
#'
#' @return
#' @export
#'
#' @examples
#' sentiment <- infer_from_text("I like ", "Peter", " but I don't like Robert.")
#' print(sentiment[0])
infer_from_text <- function(left = NULL, target = NULL, right = NULL) {
  reticulate::use_virtualenv("newssentiment-environment")
  tsc <- reticulate::import("NewsSentiment.TargetSentimentClassifier")
  tsc$infer_from_text(left, target, right)
}

#' Infer by Index
#'
#' @param text : The whole text.
#' @param target_mention_from Beginning Index of Target.
#' @param target_mention_to End Index of Target.
#'
#' @return
#' @export
#'
#' @examples
#'
infer_by_index <- function(text_left = NULL,
                           target_mention = NULL,
                           text_right = NULL,
                           text = NULL,
                           target_mention_from = NULL,
                           target_mention_to = NULL) {
  tsc$infer(text, target_mention_from, target_mention_to)
}
