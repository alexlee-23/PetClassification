%Closest average training error rate is [YOUR VALUE].
%Closest average test error rate is [YOUR VALUE].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)
[avgcat avgdog] = average_pet(Xtrain,ytrain);
yguess = [];
for i = 1:height(Xrun)
    if ( sqrt(sum((Xrun(i,:) - avgdog).^2))  < sqrt(sum((Xrun(i,:)-avgcat).^2)) )
        yguess = [yguess; 1];
    else
        yguess = [yguess; -1];
    end
end
%Your code should go above this line.
if (~iscolumn(yguess))
    error("yguess is not a column vector.")
elseif (length(yguess)~=size(Xrun,1))
    error("Length of yguess is not equal to the number of rows in Xrun.")
elseif (sum(unique(abs(ytrain))~=1))
    warning("Some elements in ytrain are not +1 or -1.")
elseif (sum(unique(abs(yguess))~=1))
    warning("Some elements in yguess are not +1 or -1.")
end