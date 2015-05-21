

library(igraph)

# create adjacency matrix
matrix = matrix(c(0,1,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,0,0),
                nrow = 5, ncol = 5, byrow = TRUE)

# plot the adjacency matrix
graph = graph.adjacency(matrix, weighted = TRUE)
plot.igraph(graph)