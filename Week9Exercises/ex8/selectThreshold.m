function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    # what are our predictions?
    predictions = (pval < epsilon);
    # make running counters for fps, fns, tps and tns to calculate precision, accuracy and F1
    falsePositives = 0;
    falseNegatives = 0;
    truePositives = 0;
    trueNegatives = 0;

    # determine what kind of predictions we have by comparing each with yval and what 
    # prediction is made
    for i = 1 : size(predictions, 1),
      if predictions(i) != yval(i),
        if predictions(i) == 1,
          falsePositives += 1;
        else
          falseNegatives += 1;
        end;
      else
        if predictions(i) == 1,
          truePositives += 1;
        else
          trueNegatives += 1;
        end;
      end;
    end;

    # disregard infinity values
    if truePositives + falsePositives == 0,
      F1 = 0;
    else
      precision = (truePositives) / (truePositives + falsePositives);
      recall = (truePositives) / (truePositives + falseNegatives);

      F1 = (2 * precision * recall) / (precision + recall);
    end;

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
