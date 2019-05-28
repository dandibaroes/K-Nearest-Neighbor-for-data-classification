function label = kNNClassify( dataTest, dataTrain, labels, k )
    %fungsi ini digunakan untuk mencari tetangga terdekat untuk nantinya
    %dibandingkan antara data test dan data train
    
    
    labelOutput = [ 0 ; 1]; %membuat matrix untuk output label

    [row,cols] = size(dataTrain);
    col = cols - 1; % batasi kolom hanya sampai 4 karena kolom 5 merupakan label
    check = zeros(row,col);
    for i = 1:row
        for j = 1:col
            check(i,j) = (dataTrain(i,j)-dataTest(1,j))^2;  
        end
    end
    dist = sqrt(sum(check,2));  % untuk menghitung euclidean distace
    [~,index] = sort(dist); % sorting jarak/distance secara ascending,return index baris

    for i=1:k
        klabels(i) = labels(index(i)); % beri label ke baris sesuai nilai k
    end

    sortedClass = tabulate(klabels'); % cari class yang mendominasi menggunakan sintaks/fungsi tabulate untuk mendapatkan frekuensi
    [~,i] = max(sortedClass(:,2));  % untuk mendapatkan index dari class yang mendominasi
    label = labelOutput(i);
end