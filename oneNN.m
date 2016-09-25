function [nearestNeighbors] = oneNN(dataSet,testPoint)
%oneNN 1-Nearest Neighbor
%   oneNN implements 1-NN search on dataSet for testPoint. dataSet is set
%   of training data of dimensions N x D, where n is number of examples and
%   D is the dimension of the feature space of each example. testPoint is a
%   1 x D vector consisting of one specific point. oneNN finds the index of
%   dataSet that has the smallest l2 norm to testPoint (Euclidean distance
%   metric).
    [~,nearestNeighbors]=min(sum(bsxfun(@minus,dataSet,testPoint).^2,2));
end