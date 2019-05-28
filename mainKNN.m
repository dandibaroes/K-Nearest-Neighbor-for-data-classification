filename_train = '(2019) DataTrain Tugas 2 AI.xlsx'; 
dataTraining = xlsread(filename_train); % load data train dan masukkan ke variabel dataTraining
labelClass = dataTraining(:,5); %isi variabel labelClass dengan colom ke 5 dari file yang diupload

result = validation(dataTraining,labelClass,10,100); % proses k fold cross validation

plot(result(:,1),result(:,2)) % visualisasi k dan akurasi yang didapat

%mendapatkan nilai bestK dan akurasinya serta menampilkannya
[ nilai_max , index_max ] = max(result(:,2));
bestK = result(index_max,1);
output = sprintf('Nilai terbaik adalah %d and akurasi yang didapat adalah %f persen',bestK,nilai_max*100);
disp(output);

%load data test
filename_test ='(2019) DataTest Tugas 2 AI.xlsx';
dataTesting = xlsread(filename_test);

%isi variabel resultTesting dengan hasil prediksi label class dari fungsi
%kelasClassify
resultTesting = kelasClassify(dataTesting,dataTraining,labelClass,bestK);

%simpan hasil prediksi label class ke dalam file csv
newFileName = 'Prediksi_Tugas2AI.csv ';
csvwrite(newFileName,resultTesting);
