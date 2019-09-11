library(ggplot2)

# dd <- read.table("tests/test1.csv", fileEncoding = "UTF-8", header = TRUE,
#                  sep = ",")

test_files <- list.files("tests", pattern = "*.csv", full.names = TRUE,
                         recursive = FALSE)

subtitles <- c("Cilindro de 7/8\" em diâmetro", 
               "12 mm de largura x 8 mm de espessura",
               "Cilindro 150 mm de diâmetro",
               "Ensaio de tensão-deformação para um material cerâmico")

i <- 1 # subtitle index

lapply(test_files, function(test){
  dd <- read.table(test, fileEncoding = "UTF-8", header = TRUE, sep = ",")
  print(subtitles[i])
  print(dd)
  i <<- i + 1 # increment the global index variable i
})