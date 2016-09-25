function [nearestNeighbors] = oneNNnew(dataSet,testPoints)
%oneNNnew 1-Nearest Neighbor
%   oneNNmew implements 1-NN search on dataSet for all testPoints. dataSet is set
%   of training data of dimensions N x D, where n is number of examples and
%   D is the dimension of the feature space of each example. testPoints is a
%   P x D vector consisting of all points. oneNNnew finds the index of
%   dataSet that has the smallest l2 norm to testPoint (Euclidean distance
%   metric).
    [~,nearestNeighbors]=min((bsxfun(@plus,bsxfun(@plus,-2*(testPoints*dataSet'),sum(dataSet.*dataSet,2)'),sum(testPoints.*testPoints,2))),[],2);
end