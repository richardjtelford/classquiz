#' Add a refresh button
#' @description Adds an ojs code chunk that generates a refresh button.
#' @param id The id of the form to be plotted.
#' @param text The text to be displayed on the button.
#' @return NULL
#' @importFrom knitr knit_expand
#' @export

cq_ojs_refresh <- function(id, text = "Refresh") {
  cat(knit_expand(text = "
  \`\`\`{ojs}
  //| echo: false
  viewof refresh_{{id}} = Inputs.button('{{text}}')
  \`\`\`
  "))
}
