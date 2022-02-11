#' infer from text with target
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
#' @return the sentiment
#' @export
#'
#' @examples
#' sentiment <- infer_from_text("I like ", "Peter", " but I don't like Robert.")
#' print(sentiment[0])
infer_from_text <- function(left = NULL, target = NULL, right = NULL) {
  reticulate::use_virtualenv("newssentiment-environment")
  tsc$infer_from_text(left, target, right)
}

#' Infer by Index
#'
#' @param text : The whole text.
#' @param target_mention_from Beginning Index of Target.
#' @param target_mention_to End Index of Target.
#'
#' @return the sentiment
#' @export
#'
#' @examples
#sentiment <- infer_by_index("I like Peter but I don't like Robert.", 7,11)
#' print(sentiment[0])
infer_by_index <- function(
                           text = NULL,
                           target_mention_from = NULL,
                           target_mention_to = NULL) {
  text_left = substr(text, 0, (target_mention_from-1))
  target_mention= substr(text, target_mention_from, target_mention_to)
  text_right= substr(text, (target_mention_to+1), nchar(text))
  tsc$infer(text_left, target_mention, text_right )
}


#' Infer without target. \n
#' Get the sentence Sentiment without an target mention.
#' This function is provided for convenience but the model was not
#' trained for this.
#'
#' @param text the sentence
#'
#' @return the sentiment
#' @export
#'
#' @examples
#' infer("I like Peter")
infer <- function(text=NULL){
  tsc$infer("",text,"")
}
