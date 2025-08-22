#' Add results of quiz to quarto document
#' @description
#' Writes observable chunks that add the results of a quiz in google forms to a quarto document.
#' @param sheet_url URL to the google sheet containing the results
#' @param type Type of question being plotted.
#' @param \dots Optional arguments to the plotting function.
#' Options are "multiple_choice_grid" and "multiple_choice"
#' @details
#' IMPORTANT: The chunk used to run this function must have the chunk option `#| output: asis`.
#'
#'Remember to share the google sheet containing the answers.
#'
#'There must be at least one row of answers or ojs will fail (on todo list)
#'
#' Remember to delete the answers from the previous year from the google sheet before class. (Could add a temporal filter option).
#' @seealso [cq_ojs_multiple_choice_grid_barplot()], [cq_ojs_multiple_choice_barplot()]
#' @export

cq_add_results <- function(sheet_url, type, ...) {
  # use option() to set incrementing ID
  if (is.null(getOption("cq_id"))) {
    id <- 1
    options(cq_id = id)
  } else {
    id <- getOption("cq_id")
    id <- id + 1
    options(cq_id = id)
  }

  # setup chunk
  cq_ojs_setup()

  # load data chunk
  cq_ojs_load_data(sheet_url = sheet_url, id = id)

  # process data chunk
  cq_ojs_process_data(id = id, type = type)



  # add plot
  switch(type,
         "multiple_choice_grid" = {
           cq_ojs_multiple_choice_grid_barplot(id = id, ...)
         },
         "multiple_choice" = {
           cq_ojs_multiple_choice_barplot(id = id, ...)
         },
         { # default
           cq_ojs_multiple_choice_barplot(id = id, ...)
         })


  # add refresh button
  cq_ojs_refresh(id = id)
}
