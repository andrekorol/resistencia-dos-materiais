library(ggplot2)

dd <- read.csv("tests/test1.csv", fileEncoding = "UTF-8", header = TRUE,
                 sep = ",")

new_colnames <- lapply(colnames(dd), function(name){
  name <- sub("[:.:]", "(", name)
  name <- sub("[:.:]", ")", name)
})

colnames(dd) <- new_colnames

# dd <- data.frame(dt)
# print(typeof(dd))
# print(typeof(dt))

x_axis <- sym(colnames(dd)[1])
y_axis <- sym(colnames(dd)[2])

g <- ggplot(dd, aes(x=!!x_axis, y=!!y_axis)) +
  geom_line(color="seagreen")

plot(g)

# test_files <- list.files("tests", pattern = "*.csv", full.names = TRUE,
#                          recursive = FALSE)

subtitles <- c("Cilindro de 7/8\" em diâmetro", 
               "12 mm de largura x 8 mm de espessura",
               "Cilindro 150 mm de diâmetro",
               "Ensaio de tensão-deformação para um material cerâmico")

i <- 1 # subtitle index

# lapply(test_files, function(test){
#   dd <- read.table(test, fileEncoding = "UTF-8", header = TRUE, sep = ",")
#   print(subtitles[i])
#   print(dd)
#   i <<- i + 1 # increment the global index variable i
# })