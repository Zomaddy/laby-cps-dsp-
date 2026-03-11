fs = 2048 #częstotliwość próbkowania Ae^(i(2pift + fi))
Ts = 1/fs #okres próbkowania
A = 0.25 #amplituda
f = pi/2 #częstotliwość oscylacji
fi = pi #przesunięcie fazowe
t0 = 5.0 #czas pierwszej próbki
tn = 10.0 #czas ostatniej próbki

N = (tn - t0)*fs + 1 #liczba próbek, +1 jest bo dodajemy obie skrajne próbki czyli 5s i 10s

t = t0 .+ (0:N-1) .* Ts #wektor czasów próbek

x = A .* exp.(im .* (2*pi .* f .* t .+ fi))

