function P = Legendre(l,m,x)
%----inisiasi fungsi yang diperlukan----
f = @(x) (x^2-1)^l;
g = @(x) (1-x^2)^(m/2);
%----batasi nilai l dan m----
if mod(l,1) ~= 0;
    return
end
if mod(m,1) ~= 0 ;
    return
end
if abs(m)>l;
    return
    %----dapatkan hasil polinom Legendre untuk m positif----
elseif l>=m && m >= 0;
    P = (-1)^m/(2^l*faktorial(l))*g(x)*turunanke(f,m+l,x);
    %----dapatkan hasil polinom Legendre untuk m negatif----
elseif -l<=m && m<0;
    P = faktorial(l-m)/faktorial(l+m)*1/(2^l*faktorial(l))*g(x)*turunanke(f,m+l,x);
end