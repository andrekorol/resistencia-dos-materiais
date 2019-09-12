library(ggplot2)

test_files <- list.files("tests", pattern = "*.csv", full.names = TRUE,
                         recursive = FALSE)

titles <- c("Cilindro de 7/8\" em diâmetro", 
               "12 mm de largura x 8 mm de espessura",
               "Cilindro 150 mm de diâmetro",
               "Ensaio de tensão-deformação para um material cerâmico")

plot_colors <- c("seagreen", "darkorange", "darkblue", "indianred")

i <- 1 # global index

lapply(test_files, function(test){
  dd <- read.csv(test, fileEncoding = "UTF-8", header = TRUE, sep = ",")
  new_colnames <- lapply(colnames(dd), function(name){
    name <- sub(".mm.mm.", "(mm/mm)", name)
    name <- sub("[:.:]", "(", name)
    name <- sub("[:.:]", ")", name)
  })
  
  colnames(dd) <- new_colnames
  
  x_axis <- sym(colnames(dd)[1])
  y_axis <- sym(colnames(dd)[2])
  
  g <- ggplot(dd, aes(x=!!x_axis, y=!!y_axis)) +
    geom_line(color=plot_colors[i]) +
    labs(title=titles[i]) +
    theme(plot.title = element_text(hjust = 0.5))
  
  plot(g)
  
  i <<- i + 1 # increment the global index variable i
})