x=c(1,1.1,5,5.1,1.5,5.2,7.9,1.2,8.1,9)
plot(x)
library(amap)
mycluster=kmeans(x,3)
print(mycluster$size) # Observations in the clusters
print(mycluster$cluster) # cluster-ids belonging to elements in the array
print(mycluster$centers)
print(mycluster$withins)
plot(x, col = mycluster$cluster) # color the points
points(mycluster$centers, col = 1:3, pch = 8, cex=2) # plot cluster center


### Number 2
set.seed(43)
library(amap)
data(USArrests)
hc_ave = hcluster(USArrests,link = "ave") # similarity is average of pairs withihn a cluster
plot(hc_ave)
hc_sin <- hcluster(USArrests,link = "single") # similarity by one pair defined
hc_com <- hcluster(USArrests,link = "complete") #similarity is defined by the max distance of a pair in the cluster
plot(hc_sin)
plot(hc_com)