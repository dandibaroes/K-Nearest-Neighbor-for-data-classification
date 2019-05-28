function result = validation(dataSet , labelClass, kFoldSize, kforKNN)
    %fungsi ini digunakan untuk melakukan k fold cross validation, denngan
    %tujuan untuk mendapatkan bestK
    %dataset = dataTraining
    
    
    [ row , ~ ] = size(dataSet);
    numberDataSingleFold = row/kFoldSize; 

    dataTesting{kFoldSize,1} = [];
    dataTraining{kFoldSize,1} = [];
    
    %bagi dataTraining dan dataTesting untuk diberikan kFold
    dataTesting{1} = dataSet(1:numberDataSingleFold,:);
    dataTraining{1} = dataSet(numberDataSingleFold+1:end,:);
    
    % data testing = 800 dan data training = 3200
    for f = 2:kFoldSize
      dataTesting{f} = dataSet((f-1)*numberDataSingleFold+1:(f)*numberDataSingleFold,:);
      dataTraining{f} = [dataSet(1:(f-1)*numberDataSingleFold,:); dataSet(f*numberDataSingleFold+1:end, :)];
    end
    
    % hitung peformance setiap k
    kIterate = kforKNN;
    totalAvgAccuracy = zeros([kIterate/2,2]);
    k = 1;
    inc = 1;
    while ( k < kIterate)
        accuracyList = zeros([kFoldSize,1]);
        
        for i=1:kFoldSize
           predictLabel = kelasClassify(dataTesting{i},dataTraining{i},labelClass,k); 
           actualLabels = dataTesting{i};
           actualLabel = actualLabels(:,5);
           accuracyList(i,1) = accuracy(actualLabel,predictLabel);
        end
        totalAvgAccuracy(inc,1) = k;
        totalAvgAccuracy(inc,2) = mean(accuracyList);
        k = k + 2;
        inc = inc + 1;
    end
    
    result = totalAvgAccuracy;
  
end
