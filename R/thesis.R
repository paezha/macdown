#' Creates an R Markdown PDF Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the McMaster Graduate Thesis LaTeX template and cls files.
#'
#' @export
#'
#' @param toc A Boolean (TRUE or FALSE) specifying whether table of contents
#'  should be created
#' @param toc_depth A positive integer
#' @param ... Further arguments passed to or from other methods.
#' @param highlight Syntax highlighting style. Supported styles include
#' "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn",
#' and "haddock". Pass NULL to prevent syntax highlighting.
#'
#' @return A modified \code{pdf_document} based on McMaster Graduate Thesis LaTeX
#'   template
#' @examples
#' \dontrun{
#' output:macdown::thesis_pdf
#' }
thesis_pdf <- function(toc = TRUE, toc_depth = 3, highlight = "default", ...) {
  base <- bookdown::pdf_book(
    template = "template.tex",
    toc = toc,
    toc_depth = toc_depth,
    highlight = highlight,
    keep_tex = TRUE,
    pandoc_args = "--top-level-division=chapter",
    ...
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- NA
  #base$knitr$opts_knit$cache <- FALSE
  base$knitr$opts_knit$fig.path <- "_bookdown_files/"
  # base$knitr$opts_chunk$fig.align <- "center"

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)
  on.exit(options(bookdown.post.latex = old_opt))

  base
}

fix_envs <- function(x) {
  beg_reg <- "^\\s*\\\\begin\\{.*\\}"
  end_reg <- "^\\s*\\\\end\\{.*\\}"
  i3 <- if (length(i1 <- grep(beg_reg, x))) {
    (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]
  }

  i3 <- c(
    i3,
    if (length(i2 <- grep(end_reg, x))) {
      (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
    }
  )
  if (length(i3)) x <- x[-i3]
  x
}
