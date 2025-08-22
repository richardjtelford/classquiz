
# classquiz

<!-- badges: start -->
<!-- badges: end -->

The goal of `classquiz` is to facilitate adding google form quizzes to a quarto document and showing plots of the results with observable.

## Installation

You can install the development version of classquiz from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("richardjtelford/classquiz")
```

## Example

This is a minimal quarto file to include a quiz and show the results

````
---
title: quiz demo
format: 
  revealjs
---

```{r}
#| echo: false
library(classquiz)
cq_add_form(
  form_url = "https://docs.google.com/forms/d/e/1FAIpQLSclFEEt2PIQhnr-laqmtSk1CTGSyv43VaroA05G978_ammHIg/viewform?embedded=true")
```

## Answers

```{r}
#| echo: false
#| output: asis

cq_add_results(
  sheet_url = "https://docs.google.com/spreadsheets/d/1cmX_0HSUDh7Wh9lDE0Fn75d6RkU6mkI15SpdcKh7px4/edit?resourcekey=&gid=86435373#gid=86435373",
  type = "multiple_choice"
)
```

````



