function rozwiazanie(;
    fp::Int = 660,
    x::Vector{ComplexF64} = ComplexF64[0.4 - 0.84im, 1.01 + 0.17im, 1.03 + 0.06im, -1.05 + 0.53im, 1.26 - 0.19im, 0.29 - 1.14im, 1.47 + 0.48im, -0.19 - 0.63im, -0.76 + 0.31im, -0.63 - 0.27im, -0.44 - 1.26im, -0.88 - 0.76im, 0.01 - 0.78im, 0.13 + 0.31im, -1.14 - 0.57im, -0.65 - 0.12im, 0.79 + 0.23im, -1.17 - 0.14im, 0.78 + 0.85im, 0.8 + 1.26im, -0.6 - 0.43im, 0.49 - 0.64im, 1.25 - 0.24im, -0.37 - 0.07im, -0.24 + 1.14im, -1.1 + 1.06im, -0.23 + 1.2im, 1.16 + 0.05im, -0.62 + 0.47im, 0.16 + 0.44im, -0.05 - 0.08im, -0.24 - 0.06im, 0.36 - 0.71im],
    f::Vector{Int} = [-300, -80, 80, 160, 180, 220, 300],
)

    N = length(x)       #ilość próbek sygnału

    df = fp / N         #rozdzielczość częstotliwościowa

    sum_ampl = 0.0

    for freq in f

        k = mod(round(Int, freq/df), N)     #zamiana częstotliwości na indeks DFT

        X_k = 0.0 + 0.0*im

        for n in 1:N

            X_k += x[n] * exp(-2.0 * im * pi * (n-1) * k / N)

        end

        sum_ampl += abs(X_k)

    end

    return sum_ampl/N

end

wynik = rozwiazanie()
println(wynik)

        
