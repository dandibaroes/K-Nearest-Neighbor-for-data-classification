function conf = useConfusionMatrix( Ytrain , Ypredict)
    % fungis ini untuk membuat confusion matrix yang nantinya akan
    % digunakan untuk menghitung akurasi
    % Ytrain label sebenarnya
    % Ypredict adalah hasil dari training

    listClass = unique(Ytrain);
    numberClass = length(listClass);
    
    conf = zeros(numberClass);
    
    for i = 1 : length(Ytrain)
       conf(Ytrain(i)+1, Ypredict(i)+1) = conf(Ytrain(i)+1,Ypredict(i)+1) + 1 ;
    end
end