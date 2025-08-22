#' Add ojs barplot for multiple choice grid form
#' @description Adds an ojs code chunk that generates a barplot suitable for a multiple choice grid google form.
#' @param id The id of the form to be plotted
#' @param height The height of the plot.
#' @param marginLeft Width of the left margin.
#' @param domain Category values in required order.
#' @param range Fill colours to use


#' @details If this plot this code generates is not suitable for your needs,
#'  you can modify the code this function produces.
#' @return NULL
#' @export

cq_ojs_multiple_choice_grid_barplot <- function(id, height = "", marginLeft = 100, domain, range) {
  marginLeft <- paste0("marginLeft: ", marginLeft, ",\n")
  if(!missing(height)) {
    height <- paste0("height: ", height, ",\n")
  }
  if(!missing(domain)){
    domain <- paste0("domain: [\"", paste(domain, collapse = "\", \""), "\"]")
  }
  if(!missing(range)){
    range <- paste0("range: [\"", paste(range, collapse = "\", \""), "\"],")
  }


  cat(knit_expand(text = "
\`\`\`{ojs}
//| echo: false
Plot.plot({
  {{marginLeft}}
  marginBottom: 60,
  {{height}}
  x: {label: 'Frequency', labelOffset: 50},
  y: {label: null, domain: cnames_{{id}}},
  color: {
    legend: true,
    {{domain}},
    {{range}}
  },
  style: {fontSize: '25px'},
  marks: [
    Plot.barX(foldData_{{id}}, {y: 'question', x: 1, inset: 0.5, fill: 'answer', sort: 'answer'}),
    Plot.ruleX([0])
  ]
})
\`\`\`
"))
}



#' Add ojs barplot for multiple choice form
#' @description Adds an ojs code chunk that generates a barplot suitable for a multiple choice google form.
#' @param id The id of the form to be plotted
#' @details If this plot this code generates is not suitable for your needs, you can modify the code this function produces.
#' @return NULL
#' @export

cq_ojs_multiple_choice_barplot <- function(id) {
  cat(knit_expand(text = "
\`\`\`{ojs}
//| echo: false
Plot.plot({
  marginLeft: 100,
  marginBottom: 60,
  x: {label: 'Frequency', labelOffset: 50},
  y: {label: null},
  color: {legend: true},
  style: {fontSize: '25px'},
  marks: [
    Plot.barX(foldData_{{id}}, {y: 'question', x: 1, inset: 0.5, fill: 'answer', sort: 'answer'}),
    Plot.ruleX([0])
  ]
})
\`\`\`
"))
}
