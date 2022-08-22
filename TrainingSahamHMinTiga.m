data=xlsread('Data H-123.xlsx');
normalisasi=normc(data);

y = normalisasi(449:1199,2); %fren hari-h normalisasi

A1 = normalisasi(449:1199,7); %unvr h-1 normalisasi
A2 = normalisasi(449:1199,8); %unvr h-2 normalisasi
A3 = normalisasi(449:1199,9); %unvr h-3 normalisasi

B1 = normalisasi(449:1199,10); %tlkm h-1 normalisasi
B2 = normalisasi(449:1199,11); %tlkm h-2 normalisasi
B3 = normalisasi(449:1199,12); %tlkm h-3 normalisasi

C1 = normalisasi(449:1199,13); %bsde h-1 normalisasi
C2 = normalisasi(449:1199,14); %bsde h-2 normalisasi
C3 = normalisasi(449:1199,15); %bsde h-3 normalisasi

D1 = normalisasi(449:1199,16); %giaa h-1 normalisasi
D2 = normalisasi(449:1199,17); %giaa h-2 normalisasi
D3 = normalisasi(449:1199,18); %giaa h-3 normalisasi

E1 = normalisasi(449:1199,19); %elsa h-1 normalisasi
E2 = normalisasi(449:1199,20); %elsa h-2 normalisasi
E3 = normalisasi(449:1199,21); %elsa h-3 normalisasi

F1 = normalisasi(449:1199,22); %indf h-1 normalisasi
F2 = normalisasi(449:1199,23); %indf h-2 normalisasi
F3 = normalisasi(449:1199,24); %indf h-3 normalisasi

G1 = normalisasi(449:1199,25); %asri h-1 normalisasi
G2 = normalisasi(449:1199,26); %asri h-2 normalisasi
G3 = normalisasi(449:1199,27); %asri h-3 normalisasi

H1 = normalisasi(449:1199,28); %isat h-1 normalisasi
H2 = normalisasi(449:1199,29); %isat h-2 normalisasi
H3 = normalisasi(449:1199,30); %isat h-3 normalisasi

I1 = normalisasi(449:1199,31); %bmri h-1 normalisasi
I2 = normalisasi(449:1199,32); %bmri h-2 normalisasi
I3 = normalisasi(449:1199,33); %bmri h-3 normalisasi

J1 = normalisasi(449:1199,34); %bbca h-1 normalisasi
J2 = normalisasi(449:1199,35); %bbca h-2 normalisasi
J3 = normalisasi(449:1199,36); %bbca h-3 normalisasi

p1 = log(A3.*A1.*A2);
p2 = log(B3.*B1.^);
p3 = log(C3.*C1.^2);
p4 = log(D3.*D1.^2);
p5 = log(E3.*E1.^2);
p6 = log(F3.*F1.^2);
p7 = log(G3.*G1.^2);
p8 = log(H3.*H1.^2);
p9 = log(I3.*I1.^2);
p10 = log(J3.*J1.^2);
p11 = ones(length(p1),1);

w = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11];
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

training = [p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11];

%Plotting
N=(449:1199);
N = N';
scatter(N,y);
hold on;
plot (N,yprediksi);