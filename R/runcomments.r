
#' Run selected, commented lines from RStudio source editor in the console
#'
#' @param pattern character string containing a regular expression
#' @param ... other arguments to rstudioapi::sendToConsole
#'
#' @return
#' @export
#'
runCommentedSource <- function(pattern, ...) {
  selectionText <- getSelectionText()
  selectionText <- removeCommentCharacters(selectionText)
  rstudioapi::sendToConsole(selectionText, ...)
}

#' Return text from current source editor selection
#'
#' @return a character vector. One element per selected line
#'
#' @examples
getSelectionText <- function() {
  rstudioapi::getSourceEditorContext()$selection[[1]]$text
}

#' Use regex pattern to remove comment characters from text
#'
#' @param text character vector of text from current source editor selection
#' @param pattern character string containing a regular expression
#'
#' @return character vector with comment characters removed
#'
#' @examples
removeCommentCharacters <- function(text, pattern = NULL) {
  text <- strsplit(text, "\\n")
  text <- unlist(text)

  if (is.null(pattern)) {
    pattern <- "^\\s*#+\\s*'*"
  }
  gsub(pattern, "", text)
}
