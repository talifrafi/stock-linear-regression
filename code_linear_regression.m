data=xlsread('TeukuAlifRafi_1806195223_TugasSaham.xlsx',1);
x = data(4:end,3:end);
y = data(4:end,2);
w = inv(x'*x)*x'*y;
y_pred = x*w;
korelasi = corr(y,y_pred);