
#' Run selected, commented lines from RStudio source editor in the console
#'
#' @param pattern character string containing a regular expression
#' @param ... other arguments to rstudioapi::sendToConsole
#'
#' @return nothing
#' @export
noComment <- function(pattern, ...) {
  selectionText <- getSelectionText()
  selectionText <- removeCommentCharacters(selectionText)
  rstudioapi::sendToConsole(selectionText, ...)
}

#' Return text from current source editor selection
#'
#' @return a character vector. One element per selected line
getSelectionText <- function() {
  context <- rstudioapi::getSourceEditorContext()
  selection <- context$selection[[1]]
  text <- selection$text
  if (text == ""){
    current_row = selection$range$start["row"]
    text <- context$contents[current_row]
  }
  text
}

#' Use regex pattern to remove comment characters from text
#'
#' @param text character vector of text from current source editor selection
#'
#' @return character vector with comment characters removed
removeCommentCharacters <- function(text) {
  text <- strsplit(text, "\\n")
  text <- unlist(text)
  pattern <- getOption("noComment.regex")

  if (is.null(pattern)) {
    pattern <- "^\\s*#+\\s*'*"
  }
  gsub(pattern, "", text)
}
