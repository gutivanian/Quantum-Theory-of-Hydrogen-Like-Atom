function L = Lagrange(x,y,x1)
%----ukur banyak data----
n = length(x);
m = length(y);
%----wajibkan banyak data x dan y sama----
if n ~= m;
    return;
end
%----mulai mencari hasil interpolasinya----
yi = 0;
for i = 1:n;
    %----mulai mencari koefisien interpolasinya----
    kali = 1;
    for j = 1:n;
        if j~=i;
            kali = kali*(x1-x(j))/(x(i)-x(j));
        end
    end
    %----dapatkan koefisien interpolasinuya----
    yi = yi + kali*y(i);
end
%----dapatkan hasil interpolasinya----
L = yi