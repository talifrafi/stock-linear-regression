% x merupakan matriks 1 x n yang berisi persentase perubahan saham yang
% mau dicek berdasarkan threshold
nilaithreshold = 2; %masukan nilai threshold yang dipilih
n = 1;
a = length(x);
while n<a
    if x(n)<nilaithreshold
        x(n) = 0 ;
    else x(n) = 1;
        
        
    end
    n = n+1;
end