function int =  simpson8_3_mod(f,a,b)
%----inisialisasi N dan h----
N = 1e5;
format long;
h=(b-a)/N;
x=a:h:b;
%----inisialisasi iterasi----
D=0;
for i=1:N;
    %----inisialisasi syarat penjumlahan----
    if i==1;
        D=D+f(x(1));
    elseif mod(i,3)==1; 
        D=D+3*(f(x(i)));
    elseif mod(i,3)==2;
        D = D+3*f(x(i));
    elseif mod(i,3)==0;
        D = D+2*f(x(i));
    elseif i == N;
        D = D+f(x(N));
        %----akhiri syarat jumlahan----
    end
    %----akhiri iterasi----
end
%----dapatkan hasil integral----
int=3*h*D/8