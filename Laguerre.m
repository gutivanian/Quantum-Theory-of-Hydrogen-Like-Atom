function Ass_Laguerre = Laguerre(n,k,x);
%----inisiasi fungsi-fungsi yang dibutuhkan----
f = @(x) (exp(-x)*x^(n+k));
u = @(x) (exp(x)*x^(-k));
%----batasi nilai n dan k----
if mod(n,1) ~= 0;
    return
end
if mod(k,1) ~= 0 ;
    return
end
if n<0;
    return
end
if k<0;
    return
end
%----dapatkan nilai Assosiasi Laguerre-----
Ass_Laguerre = u(x)/faktorial(n)*turunanke(f,n,x);
%----dapatkan nilai Assosiasi Laguerre pada x=0----
if x ==0;
    Ass_Laguerre = Lagrange(kecualinol(3),Laguerre2(n,k),0);
end