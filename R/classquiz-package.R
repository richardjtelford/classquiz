#' @keywords internal
#' @details To use `classquiz`, first make a quiz with google forms.
#' The following types of questions are supported
#'
#' - Multiple choice grid
#' - Multiple choice
#'
#' Each quiz may contain ony one type of question.
#' Publish the quiz and find the URL of the google form and the google sheets that contains the answers.
#' The main functions to use in classquiz are [cq_add_form()] which makes an iframe showing the quiz, and [cq_add_results()] which adds a plot showing the result.
#' Functions with names like `cq_ojs_xxx()` make the individual observable chunks.
#' They don't need to be used directly, but can be if you want to take their output and modify it.
#'
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
