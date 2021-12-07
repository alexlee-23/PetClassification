%Linear discriminant analysis training error rate is [YOUR VALUE].
%Linear discriminant analysis test error rate is [YOUR VALUE].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)
[avgcat avgdog] = average_pet(Xtrain,ytrain);
Xtrain_dog = [];
Xtrain_cat = [];
for i=1:length(ytrain)
    if (ytrain(i) == 1)
        Xtrain_dog = [Xtrain_dog;Xtrain(i,:)];
    else
        Xtrain_cat = [Xtrain_cat;Xtrain(i,:)];
    end
end
ntrain = height(Xtrain);
ntrain_dog = height(Xtrain_dog);
ntrain_cat = height(Xtrain_cat);
cv_dog = cov(Xtrain_dog);
cv_cat = cov(Xtrain_cat);
cv = 1/(ntrain-2) * ( ((ntrain_cat-1)*cv_cat) + ((ntrain_dog-1)*cv_dog) );

x_variable = (2*Xrun*pinv(cv)*(avgdog-avgcat)');
const = (avgdog*pinv(cv)*avgdog') - (avgcat*pinv(cv)*avgcat');

yguess = (x_variable >= const);
yguess = double(yguess);
for i=1:length(yguess)
   if (yguess(i) == 0) 
       yguess(i) = -1;
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