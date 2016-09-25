function [allClusters,clusterIndices] = hClust(dataSet,dataIndex,clusts)
%hClust 
%   hClust is called from hCluster. clusts is the number of clusters it is
%   directed to find. It finds 'clusts' clusters within the dataSet. Each
%   cluster contains an averaged data point of its members, as well as the
%   indices of dataSet that reside within the cluster. So, dataSet is not
%   copied for recursive calls, preserving space.
    allClusters = dataSet(dataIndex(randsample(length(dataIndex),clusts,true)),:);
    nowIndex = ones(length(dataIndex),1);
    prevIndex = zeros(length(dataIndex),1);
    if(clusts>1)
        while(sum(abs(nowIndex-prevIndex))>0)
            prevIndex = nowIndex;
            
            nowIndex=oneNNnew(allClusters,dataSet(dataIndex,:));
            
            for count=1:clusts
                allClusters(count,:) = sum(dataSet(dataIndex(nowIndex==count),:),1)/sum(nowIndex==count);
            end
        end
    else
        prevClusts = zeros(1,size(allClusters,2));
        while(sum(abs(allClusters-prevClusts)))
            prevClusts = allClusters;
            nowIndex=oneNNneq(allClusters,dataSet(dataIndex,:));
            
            for count=1:clusts
                allClusters(count,:) = sum(dataSet(dataIndex(nowIndex==count),:),1)/sum(nowIndex==count);
            end
        end
    end
    
    for count=1:clusts
       clusterIndices(count).index = dataIndex(nowIndex==count); 
    end
end