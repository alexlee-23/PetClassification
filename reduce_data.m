%For PCA-reduced data with dimension k = 50, linear discriminant analysis training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 50, linear discriminant test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 50, perceptron training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 50, perceptron test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 100, linear discriminant analysis training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 100, linear discriminant test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 100, perceptron training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 100, perceptron test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 200, linear discriminant analysis training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 200, linear discriminant test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 200, perceptron training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 200, perceptron test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 400, linear discriminant analysis training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 400, linear discriminant test error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 400, perceptron training error rate is [YOUR VALUE].
%For PCA-reduced data with dimension k = 400, perceptron test error rate is [YOUR VALUE].

%This function takes in a training data matrix Xtrain and uses
%it to compute the PCA basis and a sample mean vector. 
%It also takes in a test data matrix Xtest and a dimension k. 
%It first centers the data matrices Xtrain and Xtest by subtracting the
%Xtrain sample mean vector from each of their rows. It then uses the 
%top-k vectors in the PCA basis to project the centered Xtrain and Xtest
%data matrices into a k-dimensional space, and outputs
%the resulting data matrices as Xtrain_reduced and Xtest_reduced.
function [Xtrain_reduced Xtest_reduced] = reduce_data(Xtrain,Xtest,k)
mean_x = 1/height(Xtrain) * Xtrain' * ones(height(Xtrain),1);
pcaX = pca(Xtrain);

Xtrain_reduced = (Xtrain - (mean_x' * ones(width(Xtrain), 1)))  * pcaX(:, 1:k );
Xtest_reduced = (Xtest - (mean_x' * ones(width(Xtest), 1)))  * pcaX(:, 1:k );


%Your code should go above this line.
if (size(Xtrain_reduced,1)~=size(Xtrain,1)) 
    error("The number of rows in Xtrain_reduced is not the same as the number of rows in Xtrain.")
elseif (size(Xtest_reduced,1)~=size(Xtest,1)) 
    error("The number of rows in Xtest_reduced is not the same as the number of rows in Xtest.")
elseif (size(Xtrain_reduced,2)~=k) 
    error("The number of columns in Xtrain_reduced is not equal to k.")
elseif (size(Xtest_reduced,2)~=k) 
    error("The number of columns in Xtest_reduced is not equal to k.")
end
