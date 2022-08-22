clc
clear

%import data dari excel ke matlab
DataSurvei = xlsread('D:\Coding Matlab\Data Saham Teuku Alif Rafi (version 1).xlsx','Lembar1','B3:L1204','');
W = DataSurvei;

normalisasi=normc(W);
y = normalisasi(1:500,1); %fren normalisasi
x1 = normalisasi(1:500,2); %tlkm normalisasi
x2 = normalisasi(1:500,3); %GG normalisasi
x3 = normalisasi(1:500,4); %Garuda normalisasi
x4 = normalisasi(1:500,5); %BCA normalisasi
x5 = normalisasi(1:500,6); %Indofood normalisasi
x6 = normalisasi(1:500,7); %Agung Podomoro normalisasi
x7 = normalisasi(1:500,8); %Astra Int. normalisasi
x8 = normalisasi(1:500,9); %BSD normalisasi
x9 = normalisasi(1:500,10); %Krakatau normalisasi
x10 = normalisasi(1:500,11); %ADARO normalisasi

p1 = (exp(x1.^x1)).*x2;
p2 = exp(x2.^x4);
p3 = x3;
p4 = x4;
p5 = (exp(x5)).^2;
p6 = exp(x6.^2);
p7 = x7.^2;
p8 = log(x8.^x5);
p9 = log(x9.^x10);
p10 = log(x10.^x5);

w = [p1 p2 x3 p4 p5 p6 p7 p8 p9 p10 ones(length(x1),1)];
z = inv(w'*w)*w'*y; 
a = z(1);
b = z(2);
c = z(3);
d = z(4);
e = z(5);
f = z(6);
g = z(7);
h = z(8);
i = z(9); 
j = z(10);
k = z(11);

yprediksi = a*p1 + b*p2 + c*p3 + d*p4 + e*p5 + f*p6 + g*p7 + h*p8 + i*p9 + j*p10 + k;
korelasi = corr(y,yprediksi);
sse = sum((y-yprediksi).^2);