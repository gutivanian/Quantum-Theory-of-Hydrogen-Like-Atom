function Y32 = harmonikbola(l,m)
%----inisiasi sudut orbital dan azimuthal----
dx = pi/60;
alt = -pi/2:dx:pi/2;
az = 0:dx:2*pi;
%----inisialisasi grid orbital dan azimuthal----
[theta, phi] = meshgrid(alt,az);
%----ukur alt az----
h = length(alt)     
t = length(az);
%----hitung fungsi gelombang orbitalnya----
for i = 1:h;
    Pjk(1,i) = Legendre(l,m,cos(alt(i)));
end
%----kopi hingga berukuran sama dengan grit thetha----
for i = 1:t;
    Plm(i,:) = Pjk(1,:);
end
%----buat integran untuk normalisasi----
Integran_Azimuth = @(x) ((abs(Harmonicc(m,x)))^2);
Integran_Orbital = @(x) ((Legendre(l,m,cos(x)))^2*sin(x));
%----hitung hasil integralnya-----
Integral_Azimuth = simpson8_3_mod(Integran_Azimuth,0,2*pi);
Integral_Orbital = simpson8_3_mod(Integran_Orbital,0,pi);
%----dapatkan koefisien normalisasinya----
C = sqrt(1/(Integral_Azimuth*Integral_Orbital));
%----dapatkan fungsi harmonik bolanya----
Y32 = C.*Plm .* Harmonicc(m,phi);
%---ubah dari bola ke kartesian----
[Xm,Ym,Zm] = sph2cart(phi, theta, real(Y32));
[Xn,Yn,Zn] = sph2cart(phi, theta, imag(Y32));
%---plot permukaan----
surf(Xm,Ym,Zm)
hold on
surf(Xn,Yn,Zn)
title('Y_l^m Harmonik Bola')