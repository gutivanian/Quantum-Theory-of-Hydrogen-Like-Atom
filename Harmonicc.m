function solusi_harmonic = Harmonicc(m,x);
f = @(x) exp(sqrt(-1)*m*x);%(exp(sqrt(-1)*m*x));
solusi_harmonic = f(x);