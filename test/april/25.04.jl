function rozwiazanie(;
    fp::Int = 987,
    x::Vector{ComplexF64} = ComplexF64[0.17 + 0.07im, 0.59 + 0.57im, -0.61 + 0.32im, 0.08 - 0.54im, 0.3 - 0.17im, 1.13 - 0.71im, 1.76 - 0.81im, 0.42 + 0.32im, 0.22 + 0.52im, -0.89 - 0.28im, 1.04 + 0.29im, -0.51 + 0.51im, -0.43 + 0.06im, -0.12 + 0.11im, 0.28 + 0.71im, -0.18 + 1.16im, -0.0 + 0.26im, -0.82 - 0.78im, 0.46 - 0.23im, -0.19 - 0.86im, 0.73 - 0.66im, -2.36 - 1.12im, -0.16 + 0.59im, 0.84 - 1.32im, 1.09 + 0.15im, -0.41 - 0.03im, 0.59 - 1.19im, -0.63 - 0.73im, -1.39 - 1.27im, -0.58 - 0.36im, 0.04 - 0.46im, 0.64 + 0.36im, -0.81 + 0.67im, 0.43 + 0.91im, -0.97 - 0.5im, 0.57 + 0.04im, -0.88 + 0.79im, 0.66 - 0.35im, -0.34 + 0.67im, -1.0 - 0.88im, -0.84 + 0.1im, 0.25 - 0.56im, 0.77 - 0.66im, 0.04 + 0.72im, -0.61 + 0.12im, 0.5 + 0.43im, 0.06 + 1.67im],
    f::Vector{Int} = [-336, -273, 189, 210, 294, 357, 378, 441],
)
    suma_ampl = 0.0

    N = length(x)       #liczba próbek

    delta_f = fp/N      #rozdzielczość częstotliwościowa

    for freq in f
        k = mod(round(Int, freq/delta_f),N)     #zamiana częstotliwości na indeks DFT; freq/delta_f zamienia częstotliwość na indeks widma
                                                #round(Int, ...) zaokrągla liczbę do liczby całkowitej
                                                #obsługa ujemnych częstotliwości (są mapowane do odpowiednich indeksów)
        X_k = 0.0 + 0.0*im
    
        for n in 1:(N-1)
            X_k += x[n+1]*exp(-2*im*pi*k*n / N)     #wzór na DFT
        end

        suma_ampl += abs(X_k)                       #amplituda liczby zespolonej
    end
    
    return suma_ampl/N
end
