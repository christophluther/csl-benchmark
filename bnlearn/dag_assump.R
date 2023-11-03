# Bayesian network structure learning using tabu algorithm (as implemented in bnlearn)
# setwd("~/Desktop/csl-submission/")
# dir.create("bnlearn/results")
# dir.create("bnlearn/results/tabu")

#install.packages("bnlearn")
library("bnlearn")

# set seed
set.seed(1902)

# to loop through different data sets
sample_size <- 100000
filename <- paste("data/dag_assump.csv", sep="")
df <- read.csv(filename)


data_fit <- df[sample(nrow(df), sample_size), ]
bn <- tabu(data_fit)
adj_mat <- amat(bn)
# adjacency matrix
amat_file <- paste("bnlearn/results/tabu/dag_assump_", sample_size, "_obs.csv", sep="")
write.csv(adj_mat, file=amat_file, row.names = FALSE)
