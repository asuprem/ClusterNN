function [root] = hCluster(dataSet,dataIndex,clusterMap)
%hCluster 
%   hCluster returns a cluster root to hLabeledCluster. It can also be
%   called on its own if unlabeled clusters are desired. dataSet is the
%   data of dimension N x D (N examples, each with D dimesions). dataIndex
%   is index of the data, i.e. 1:size(dataSet,1). It must be specified in
%   function call (for now) for recursive implementation. clusterMap is a
%   vector that determines the hierarchical structure of the cluster root.
%   Example for clusterMap: [3 4 5]. Three clusters at root. Each cluster
%   has 4 subclusters and each subcluster has 5 subclusters. This splits
%   the dataSet into 60 clusters, but the NN searcher searches only 12.
        [root.cluster,root.index] = hClust(dataSet,dataIndex,clusterMap(1));     %cluster according to map
        if(length(clusterMap)>1)        %if there are to be more clusters, we will cluster according using the indices
            for count=1:clusterMap(1)
                root.child(count)=hCluster(dataSet,root.index(count).index,clusterMap(2:length(clusterMap)));   %For each clust, subcluster according to map
            end            
        end       
end