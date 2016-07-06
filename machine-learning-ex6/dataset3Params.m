function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

minErr = 100000.0;
minC = 1;
minSigma = 1;

numberOfIter = 8;

for i = 1:numberOfIter
  sigma = 0.01;
  for j = 1:numberOfIter
  
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
    predictions = svmPredict(model, Xval);
    curErr = mean( double(predictions ~= yval) );
    if minErr > curErr
      minErr = curErr;
      minC = C;
      minSigma = sigma;
    end
    sigma = sigma * 3;
  end
  C = C * 3;
end

C = minC;
sigma = minSigma;




% =========================================================================

end
