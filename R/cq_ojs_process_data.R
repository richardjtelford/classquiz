#' Add ojs chunk to load data
#' @param id The id of the form
#' @return NULL
#' @importFrom knitr knit_expand
#' @export


cq_ojs_process_data <- function(id) {
  cat(knit_expand(text = "
  \`\`\`{ojs}
  //| echo: false
  foldData_{{id}} = data_{{id}}
    .fold(aq.not('Timestamp', 'Score'), { as: ['question', 'answer'] })
  \`\`\`
  "))
}
