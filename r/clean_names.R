#change col_names to lower case and replace spaces with underscores
clean_names <- function(nms) {
  x <- tolower(gsub("[ ]", "_", nms))
  x <- tolower(gsub("[/]", "_", x))
}