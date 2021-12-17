## code to prepare `DATASET` dataset goes here

library(grImport2)
library(ggplot2)
library(here)
library(magick)
library(hexSticker)
library(showtext)
font_add_google("Roboto Condensed")


thesis_svg <- image_read_svg('https://brand.mcmaster.ca/app/uploads/2019/04/icon-bookmark_svg.svg', width = 350)
p <- image_ggplot(thesis_svg)



s <- sticker(p,
             package="macdown",
             h_fill="#7A003C",
             h_color="#FDBF57",
             p_size=30,
             p_x = 1,
             p_y = 1.65,
             p_family = "Roboto Condensed",
             h_size = 4,
             s_x=1,
             s_y=1,
             s_width=1.95,
             s_height=1.95,
             url = "paezha.github.io/macdown",
             u_color = "white",
             u_family = "Roboto Condensed",
             u_x = 1.05,
             u_y = 0.12,
             u_size = 10)

s

usethis::use_data(DATASET, overwrite = TRUE)
