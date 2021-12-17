## code to create hex sticker

library(ggplot2)
library(here)
library(magick)
library(hexSticker)
library(showtext)

font_add_google("Roboto Condensed")

thesis_svg <- image_read_svg('https://brand.mcmaster.ca/app/uploads/2019/04/icon-bookmark_svg.svg', width = 900)

hp <- thesis_svg %>%
  #image_crop("143x350+80") %>%
  image_ggplot()


hs <- sticker(hp,
              package="macdown",
              h_fill="#7A003C",
              h_color="#FDBF57",
              p_size=6,
              p_x = 0.98,
              p_y = 0.75,
              p_family = "Roboto Condensed",
              p_color = "#7A003C",
              h_size = 2,
              s_x=0.95,
              s_y=1,
              s_width=2.5,
              s_height=2.5,
              url = "paezha.github.io/macdown",
              u_color = "white",
              u_family = "Roboto Condensed",
              u_x = 1.05,
              u_y = 0.15,
              u_size = 2,
              filename = paste0(here(), "/man/figures/macdown.png"))
