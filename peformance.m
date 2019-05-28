function [ result ] = peformance( confusionMatrix , param )
    %hitung peformance classifier dengan confusion matrix

    TruePositive = zeros(length(confusionMatrix),1); 
    TrueNegative = zeros(length(confusionMatrix),1);
    FalsePositive = zeros(length(confusionMatrix),1);
    FalseNegative = zeros(length(confusionMatrix),1);
    
    for i=1:length(confusionMatrix)
        TruePositive(i) = confusionMatrix(i,i);
        TrueNegative(i) = sum(sum(confusionMatrix)) - sum(FalsePositive)-sum(FalseNegative)-TruePositive(i);
        FalsePositive(i) = sum(confusionMatrix(:,i)) - TruePositive(i);
        FalseNegative(i) = sum(confusionMatrix(i,:)) - TruePositive(i);
    end
    
    if param == 1
        result = (sum(TruePositive) + sum(TrueNegative)) /  (sum(TruePositive) + sum(TrueNegative) + sum(FalsePositive) + sum(FalseNegative)); %menghitung akurasi
    end

end