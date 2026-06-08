function rozwiazanie(;
    fp::Int = 476,
    x::Vector{ComplexF64} = ComplexF64[0.35 - 0.52im, 0.31 + 0.8im, 0.02 - 0.14im, -0.67 + 1.32im, -0.17 + 0.05im, 1.0 + 0.17im, 0.2 - 1.22im, -0.42 - 0.18im, -1.19 - 0.78im, 1.37 - 0.06im, -0.91 - 0.68im, 0.65 - 0.84im, -0.42 + 0.76im, 0.97 - 0.75im, 1.13 - 0.54im, -0.9 + 0.65im, 0.52 + 0.91im, -0.71 - 0.36im, 0.78 - 0.59im, -0.44 + 0.74im, -0.12 - 0.68im, -0.34 - 1.0im, 0.33 - 1.61im, 0.82 - 0.36im, 0.27 - 0.04im, 0.03 + 0.95im, -0.02 - 0.13im, 0.04 - 0.22im],
    f::Vector{Int} = [-187, -153, -136, 0],
)

    sum_phase = 0.0
    N = length(x)       #liczba próbek
    df = fp / N    #rozdzielczość częstotliwościowa

    for freq in f
        k = mod(round(Int, freq / df), N)      #zamiana częstotliwości na indeks DFT; freq/delta_f zamienia częstotliwość na indeks widma
                                                    #round(Int, ...) zaokrągla liczbę do liczby całkowitej
                                                    #obsługa ujemnych częstotliwości (są mapowane do odpowiednich indeksów)
        X_k = 0.0 + 0.0*im

        for n in 1:N
            X_k += x[n] * exp(-2.0 * im * pi * (n-1) * k / N)       #wzór na DFT, n-1 bo Julia indeksuje tablice od 1 a nie od 0
        end

        sum_phase += angle(X_k)
    end

    return sum_phase
end

wynik = rozwiazanie()
println(wynik)

        

