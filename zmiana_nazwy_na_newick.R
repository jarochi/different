library(dplyr)

#format protein name
format_pname <- function(x) {
  paste(strsplit(x, " ")[[1]][1], sub("]", "", last(strsplit(x, "[", fixed = TRUE)[[1]]), fixed = TRUE)) %>% 
    gsub(pattern = "[():,]", replacement = "", .) %>% 
    gsub(pattern = " ", replacement = "_", .) %>% 
    substr(1, 49)
}

getwd()
setwd("/home/jarek/Pobrane/śmieci")

list.files()

csga <- "csga.aln.treefile"
csga_slow <- read.table("csga_slow.csv", sep = ">", stringsAsFactors = FALSE) %>% 
  mutate(V2 = sapply(V2, format_pname))
csgc <- "csgc.aln.treefile"
csgc_slow <- read.table("csgc_slow.csv", sep = ">", stringsAsFactors = FALSE) %>% 
  mutate(V2 = sapply(V2, format_pname))
csgd <- "csgd.aln.treefile"
csgd_slow <- read.table("csgd_slow.csv", sep = ">", stringsAsFactors = FALSE) %>% 
  mutate(V2 = sapply(V2, format_pname))

# lista_slow <- c(csga_slow, csgc_slow, csgd_slow)





format_pname(csga_slow[1, 2])

tree <- readLines(csgd)
for(i in 1L:nrow(csgd_slow)) {
  tree <- sub(pattern = csgd_slow[i, 1], csgd_slow[i, 2], x = tree);
  tree <- sub(pattern = csgd_slow[i, 1], csgd_slow[i, 2], x = tree);
  writeLines(tree, con="/home/jarek/Pobrane/śmieci/csgd_pop.treefile")
}

# for(i in 1L:nrow(csga_slow)) {
#   # print(i)
#   slow <- csga_slow[i,1];
#   zast <- csga_slow[i,2];
#   txt <- paste0(readLines(csga))
#   # print(c(slow, zast));
#   csga_pop <- gsub(slow, zast, txt, fixed = TRUE)
#   writeLines(csga_pop, con="/home/jarek/Pobrane/śmieci/csga_pop.txt")
# }


