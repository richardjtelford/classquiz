#' Add ojs setup
#' @description Adds an ojs setup code chunk to a quarto document. This chunk imports the arquero library (equivalent to tidyverse), sets up a function to get the CSV URL from a Google Sheets URL, and adds the URL of the google sheet with the responses to the form.
#' @return NULL. Used for its side effect.
#' @export

cq_ojs_setup <- function() {
  cat(knit_expand(text = "
\`\`\`{ojs}
//| echo: false

import { aq, op } from '@uwdata/arquero'

getCsvUrl = url => {
  url = new URL(url);
  const id = url.pathname.split('/')[3]
  const gid = new URLSearchParams(url.hash.slice(1)).get('gid') || 0;
  return `https://docs.google.com/spreadsheets/d/${id}/export?format=csv&gid=${gid}`
}

\`\`\`
"))
}
