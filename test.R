library(stringr)
library(dplyr)
library(tidyverse)

summarise(diamonds, .by = abc)

text <- readr::read_lines("coloration-vn.vim") |>
  stringr::str_subset("^hi")

tibble(
  text = text |>
    str_remove("hi\\s+"),
  var = str_extract(text, "^\\S+"),
  col = str_extract(text, "#\\S+")
) |>
  filter(!is.na(col)) |>
  filter(
    !grepl("^(ruby|eruby|html|java|yaml|css)", var)
  ) |>
  mutate(col = toupper(col)) |>
  summarise(
    var = var |>
      sort() |>
      unique() |>
      paste(collapse = ","),
    .by = col
  ) |>
  mutate(
    out = glue::glue("{col}: {var}")
  ) |>
  pull(out)


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

combine_colours <- function(...) {
  x <- list(...)

  Reduce(x = x, function(b, a) {
    alpha_a <- a[4]
    alpha_b <- b[4]
    rgb_a   <- a[1:3]
    rgb_b   <- b[1:3]
    new_alpha <- alpha_a + alpha_b * (1 - alpha_a)
    new_cols <- (rgb_a * alpha_a + rgb_b * alpha_b * (1 - alpha_a)) / new_alpha
    c(new_cols, new_alpha)
  })
}

col2rgba <- function(x) unname(c(col2rgb(x)[, 1], 1))
rgba2col <- function(x) toupper(paste0("#", paste(format.hexmode(x[1:3]), collapse = "")))

rgba2col(combine_colours(
  col2rgba("#002240"),
  c(179, 101, 57, 0.75)
))

rgba2col(c(128, 145, 160, 1))
"#8091A0"

rgba2col(c(179, 101, 57, 0.75))
"#b36539"
my_col <- "#86543a"



