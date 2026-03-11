fs = 1000 #częstotliwość próbkowania
Ts = 1/fs #okres próbkowania
N = 256 #liczba próbek
t0 = 0.25 #czas pierwszej próbki
A = 2 #amplituda
f = 25 #częstotliwość oscylacji
fi = pi/4 #przesunięcie fazowe

t = t0 .+ (0:N-1) .* Ts #wektor czasów próbek

x = A .* sin.(2*pi .*f .*t .+ fi)

return x

