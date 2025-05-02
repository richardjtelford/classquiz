#' Add google form
#' @description
#' Adds a google form in an iframe to a quarto document. A wrapper for [knitr::include_url()] with differnt defaults.
#' @param form_url URL of google form
#' @param height height of iframe.
#' @return An R object that knitr recognizes to generate the iframe.
#' @examples
#' cq_add_form(
#'   form_url = "https://docs.google.com/forms/d/e/1FAIpQLSclFEEt2PIQhnr-laqmtSk1CTGSyv43VaroA05G978_ammHIg/viewform?embedded=true"
#' )
#'
#' @export

cq_add_form <- function(form_url, height = "600px") {
  knitr::include_url(form_url, height = height)
}
