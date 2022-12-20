function ddx = turunanke(f,n,x)
%----inisialisasi h----
format long
h = 10^(-12/n)	;
%----inisialisasi hasil turunan----
k = (-1)^n*f(x);
%----dapatkan turunan ke-0----
if n == 0;
    ddx = k;
else
    %----dapatkan turunan ke -n ----
for i = 1:n;
    k = k+((-1)^(n-i)*faktorial(n)/(faktorial(i)*faktorial(n-i))*f(x+i*h));
end
ddx = k/h^(n);
end