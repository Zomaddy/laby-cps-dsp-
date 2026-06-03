function rozwiazanie(;
    fp::Int = 960,
    x::Vector{ComplexF64} = ComplexF64[-0.09 - 0.07im, -0.45 - 0.43im, 0.89 - 0.63im, -0.26 + 0.76im, 0.67 - 0.22im, -0.95 + 0.47im, 0.93 - 0.61im, 0.53 - 0.07im, 1.32 + 0.34im, -0.18 - 0.76im, 0.07 + 0.13im, -0.01 + 0.64im, 0.06 + 0.1im, 0.34 - 0.12im, -0.09 + 0.94im, 0.3 + 0.71im, -0.3 - 0.87im, 0.46 - 0.72im, 1.05 - 0.24im, -1.08 - 0.09im, 0.92 - 0.67im, -0.72 + 0.8im, 0.56 - 0.31im, -1.17 + 0.74im, 0.95 + 0.64im, 0.53 - 0.76im, 0.06 + 0.61im, 1.03 + 0.0im, 0.15 - 0.32im, -1.09 + 1.2im, -0.96 - 0.69im, 0.2 + 1.24im, -0.73 - 0.59im, 0.34 - 0.16im, -1.52 - 0.38im, -1.52 - 0.79im, 0.39 + 1.68im, -0.76 + 1.17im, 1.12 + 0.79im, 0.32 - 0.14im, -0.42 - 0.28im, 0.48 - 1.26im, -0.85 - 1.14im, 0.23 - 1.18im, -0.24 - 0.31im, 0.46 - 0.86im, 0.54 - 0.0im, 0.29 - 1.61im],
    f::Vector{Int} = [-360, -300, -240, -200, -120, -100],
)

    suma_ampl = 0.0
    
    N = length(x) #liczba próbek

    delta_f = fp/N #rozdzielczość częstotliwościowa

    for freq in f
        k = mod(round(Int, freq/delta_f),N) #zamiana częstotliwości na indeks DFT; freq/delta_f zamienia częstotliwość na indeks widma
                                            #round(Int, ...) zaokrągla liczbę do liczby całkowitej
                                            #obsługa ujemnych częstotliwości (są mapowane do odpowiednich indeksów)

        X_k = 0.0 + 0.0*im

        for n in 0:(N-1)
            X_k += x[n+1]*exp(-2*im*pi*k*n / N)     #wzór na DFT

        end

        suma_ampl += abs(X_k)/N

    end

    return suma_ampl

end

wynik = rozwiazanie()
println(wynik)




    
