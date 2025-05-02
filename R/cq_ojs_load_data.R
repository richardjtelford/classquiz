#' Add ojs chunk to load data
#' @param id The id of the form
#' @param sheet_url URL of the google sheet with the responses to the google form.
#' @return NULL
#' @importFrom knitr knit_expand
#' @export

cq_ojs_load_data <- function(sheet_url, id) {
  cat(knit_expand(text = "
  \`\`\`{ojs}
  //| echo: false
  url_{{id}} = '{{sheet_url}}'
  data_{{id}} = {
    refresh_{{id}};
    yield(aq.loadCSV(getCsvUrl(url_{{id}})))
  }
  \`\`\`
  "))
}
