function rozwiazanie(;
    fp::Int = 814,
    x::Vector{ComplexF64} = ComplexF64[-0.34 + 0.47im, -0.44 - 0.22im, -0.52 + 0.11im, -0.17 - 0.65im, -0.04 + 1.74im, 0.38 - 1.02im, 0.99 + 0.17im, 0.3 + 0.19im, 0.56 - 1.12im, -0.46 + 0.43im, 0.55 + 0.24im, -0.87 + 0.38im, 0.29 - 0.18im, 0.95 - 0.71im, 0.29 + 0.43im, 0.85 - 0.05im, -0.65 + 0.77im, 0.45 - 0.42im, 0.93 - 0.38im, 0.43 + 0.97im, 0.1 - 0.3im, -0.12 - 0.25im, -0.52 + 1.38im, 0.68 - 0.96im, -0.37 - 1.09im, -1.01 + 0.9im, 0.24 - 0.37im, -0.71 + 1.26im, 0.15 + 0.09im, -0.33 - 0.22im, 0.02 - 0.3im, 1.62 + 0.46im, -0.57 + 0.25im, -0.45 - 0.16im, -1.02 + 0.43im, 0.11 - 0.38im, 0.04 - 0.24im],
    f::Vector{Int} = [-220, 44, 132],
)

    sum_amp = 0.0
    N = length(x)       #liczba próbek
    df = fp / N         #rozdzielczość częstotliwościowa

    for freq in f
        k = mod(round(Int, freq / df), N)   #zamiana częstotliwości na indeks DFT; freq/delta_f zamienia częstotliwość na indeks widma
                                            #round(Int, ...) zaokrągla liczbę do liczby całkowitej
                                            #obsługa ujemnych częstotliwości (są mapowane do odpowiednich indeksów)
        X_k = 0.0 + 0.0*im

        for n in 1:N
            X_k += x[n] * exp(-2.0 * im * pi * k * (n-1) / N)       #wzór na DFT
        end

        sum_amp += abs(X_k) / N
    end

    return sum_amp
end

wynik = rozwiazanie()
println(wynik)
