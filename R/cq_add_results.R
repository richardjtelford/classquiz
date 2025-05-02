#' Add results of quiz to quarto document
#' @description
#' Writes observable chunks that add the results of a quiz in google forms to a quarto document.
#' @param sheet_url URL to the google sheet containing the results
#' @param id id of the form (arbitrary text to distinguish multiple forms).
#' @details
#' IMPORTANT: The chunk used to run this function must have the chunk option `#| output: asis`.
#'
#' Remember to delete the results from the google sheet before class.
#' @export

cq_add_results <- function(sheet_url, id = 1) {
  # setup chunk
  cq_ojs_setup()

  # load data chunk
  cq_ojs_load_data(sheet_url = sheet_url, id = id)

  # process data chunk
  cq_ojs_process_data(id = id)



  # add barplot chunk
  cq_ojs_barplot(id = id)

  # add refresh button
  cq_ojs_refresh(id = id)
}
