#' Add ojs barplot
#' @description Adds an ojs code chunk that generates a barplot.
#' @param id The id of the form to be plotted
#' @details If this plot this code generates is not suitable for your needs, you can modify the code this function produces.
#' @return NULL
#' @export

cq_ojs_barplot <- function(id) {
  cat(knit_expand(text = "
  \`\`\`{ojs}
  //| echo: false
  Plot.plot({
    marginLeft: 60,
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
