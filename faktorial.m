function fakt = faktorial(x)%masukkan nilai yang akan dicari faktorialnya pada x 
	nilai faktorial khusus jika n = 0, maka n! = 1,
if x == 0;
    fakt = 1;
	untuk yang lainnya,
else
fakt = 1; %nilai awal faktorial(1) adalah 1
for i = 1:x; %definisikan nilai i bergerak dari 1 sampai x
    fakt = fakt*i; %looping nilai faktorial
end
fakt; %menampilkan hasil akhir faktorial
end
end