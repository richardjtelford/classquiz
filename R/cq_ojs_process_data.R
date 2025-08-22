#' Add ojs chunk to load data
#' @param id The id of the form
#' @param type The type of google form question. Currently supported are `multiple_choice_grid` and `multiple_choice`. Others might work.
#' @return NULL
#' @importFrom knitr knit_expand
#' @export


cq_ojs_process_data <- function(id, type) {
  domain <- ""
  switch(type,
         "multiple_choice_grid" = {
           # split question title from individual questions and remove `[]`
           extra <- ".spread({question: d => op.split(d.question, '[')} , {as: ['question_title', 'question']})
           .derive({question: d => op.replace(d.question, ']', '')});"
           domain <- knit_expand(text = "cnames_{{id}} = data_1
                     .columnNames()
                     .filter((c) => !['Timestamp', 'Score'].includes(c))
                     .map(d => d.replace(/^.*\\[/, '').replace(/]$/, ''));")
         },
         "multiple_choice" = {
          extra <- ""
         },
         { # default
          extra <- ""
         }
  )

  cat(knit_expand(text = "
\`\`\`{ojs}
//| echo: false
{{domain}}
foldData_{{id}} = data_{{id}}
  .fold(aq.not('Timestamp', 'Score'), { as: ['question', 'answer'] })
  {{extra}}
\`\`\`
"))
}
