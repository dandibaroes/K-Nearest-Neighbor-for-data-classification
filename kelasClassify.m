function prediksiResult = kelasClassify(dataTest, dataTrain, labels, k) 
    % fungsi ini mereturn label dari data test
    
    [row,~] = size(dataTest);
    prediksiResult = zeros([row,1]);
    for i=1:row
        prediksiResult(i) = kNNClassify(dataTest(i,:),dataTrain,labels,k);
    end

end