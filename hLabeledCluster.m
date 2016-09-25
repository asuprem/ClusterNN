function [root] = hLabeledCluster(dataSet,labelSet,labels,dataIndex,clusterMap)
%hLabeledCluster
%   Wrapper function for hCluster for labeled clusters. It is called with
%   dataSet of dimensions N x D (N examples, each with D dimensions);
%   labelSet of indexed labels for dataSet (N x 1); labels specifying the
%   labels contained in labelSet (ex: for digit identification,
%   labels=0:9); dataIndex = 1:size(dataSet,1); clusterMap is row vector of
%   hierarchical map of the clustering. 
%   Example: clusterMap = [4 5 2]. 4 clusters per label at root. Each
%   cluster has 5 subclusters. Each subcluster has 2 subclusters. For 10
%   unique labels, we have 10*4*5*2 = 400 clusters. An NN searches needs to
%   search only 47 clusters.
        for count=1:length(labels)
            [root.cluster((count-1)*clusterMap(1)+1:clusterMap(1)*count,:),root.index((count-1)*clusterMap(1)+1:clusterMap(1)*count)] = hClust(dataSet,dataIndex(labelSet==labels(count)),clusterMap(1));     %cluster according to map
        end
        if(length(clusterMap)>1)        %if there are to be more clusters, we will cluster according using the indices
            for count=1:clusterMap(1)*length(labels)
                if(~isempty(root.index(count).index))
                    root.child(count)=hCluster(dataSet,root.index(count).index,clusterMap(2:length(clusterMap)));   %Foreach clust, subcluster according to map
                end
            end            
        end
        root.type = 1;  %labeled
        root.labs=labels;
        root.perLab = clusterMap(1);
        
end