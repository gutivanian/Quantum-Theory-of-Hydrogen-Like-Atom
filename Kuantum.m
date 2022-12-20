function Probabilitas = Kuantum(n,l,m,A,Z)
%----inisialisasi konstanta----
format long
hbar =1;%1.0545718e-34; konstanta planck tereduksi
me = 1;%9.1093e-31; massa elektron
e =1;%1.602e-19; muatan elektron
k = 1;%9*1e9; konstanta coulomb
a0 =(hbar^2)/(me*k*e^2*Z);%jari-jari Bohr
%---inisialisasi integran normalisasi----
Integran_Azimuth = @(x) ((abs(Harmonicc(m,x)))^2);
Integran_Orbital = @(x) ((Legendre(l,m,cos(x)))^2*sin(x));
Integran_Radial = @(x) (exp(-(x/(n*a0)))*(2*x/(n*a0))^(l)*Laguerre(n-l-1,2*l+1,(2*x)/(n*a0))^2*x^2);
%----hasil integral normalisasi----
Integral_Azimuth = simpson8_3_mod(Integran_Azimuth,0,2*pi);
Integral_Orbital = simpson8_3_mod(Integran_Orbital,0,pi);
Integral_Radial = simpson8_3_mod(Integran_Radial,0,100);
%----dapatkan koefisien normalisasi----
Koefisien_normalisasi = sqrt(1/(Integral_Radial*Integral_Azimuth*Integral_Orbital));
%----dapatkan radial probability----
h = 1e-4;
r = 0:h:10;
N = length(r);
for i = 1:N;
    probabilitas(i) = Integran_Radial(r(i))*Koefisien_normalisasi^2*Integral_Orbital*Integral_Azimuth;
end
ev = -13.6*Z^2/n^2;
%----plotting radial probability----
subplot(2,2,1)
plot(r,probabilitas);
title(['Distribusi Probabilitas Elektron pada Kulit ke-',num2str(n),' orbit ke- ',num2str(l),' dengan orientasi- ',num2str(m)])
xlabel('Jarak dari inti : r/a_{0}','fontsize',12)
ylabel('Probabilitas Radial : C_{nlm}R_{n,l}^{2}r^{2}','fontsize',12)
annotation('textbox','string',['Kuantisasi Energi = ',num2str(ev),'eV'],'FitBoxToText','on')
%----plotting fungsi gelombang azimuthal----
fi = 0:h:2;
F = length(fi);
for i = 1:F;
    Azimuth(i) = Harmonicc(m,fi(i)*pi);
end
subplot(2,2,2)
plot(fi,Azimuth);title(['Fungsi Gelombang Azimuthal Pada Momen Magnet - ',num2str(m)])
xlabel('Sudut Azimuthal 0 \leq \phi \leq 2\pi','fontsize',12)
ylabel('Fungsi Gelombang Azimuthal = \Phi_{m}(\phi) ','fontsize',12)
%----plotting fungsi gelombang orbital----
thetha = 0:h:1;
T = length(thetha);
for i = 1:T;
    Orbital(i) = Legendre(l,m,cos(thetha(i)*pi));
end
subplot(2,2,3)
plot(thetha,Orbital);
title(['Fungsi Gelombang Orbital Pada Orbit ke- ',num2str(l)])
xlabel('Sudut Orbital 0 \leq \theta \leq \pi','fontsize',12)
ylabel('Fungsi Gelombang Orbital = \Theta_{lm}(\theta)','fontsize',12)
%----plotting fungsi gelombang radial----
for i = 1:N;
    Radial(i) = exp(-(r(i)/(n*a0)))*(2*r(i)/(n*a0))^(l)*Laguerre(n-l-1,2*l+1,(2*r(i))/(a0*n));
end
subplot(2,2,4)
plot(r,Radial);
title(['Fungsi Gelombang Radial Pada Kulit ke-',num2str(n)])
xlabel('Jarak dari inti r/a_{0}','fontsize',12)
ylabel('Fungsi Gelombang Radial = R_{nl}(r)','fontsize',12)
%----harmonik bola----
figure
harmonikbola(l,m)