function rozwiazanie(;
    fp::Int = 567,
    x::Vector{ComplexF64} = ComplexF64[-0.13 - 0.33im, -0.48 + 0.42im, -0.16 - 0.01im, 1.01 + 0.2im, -0.41 + 0.64im, 0.31 - 1.12im, 0.91 + 0.67im, -0.91 + 0.98im, 0.05 + 0.2im, -0.48 - 0.76im, -1.12 - 0.69im, -1.06 - 0.22im, -1.42 - 0.59im, -0.18 - 1.87im, -0.29 + 0.17im, 0.69 + 0.46im, -0.03 - 0.15im, -0.3 + 0.17im, 0.52 + 1.3im, -0.09 + 0.47im, 0.43 + 2.01im, -0.48 + 1.16im, -0.01 + 0.11im, -0.46 - 0.42im, -0.05 + 0.87im, 0.91 + 0.71im, 0.02 - 0.74im],
    f::Vector{Int} = [-189, -168, -105, -42, 84, 147],
)

#x - wektor próbek sygnału, fp - częstotliwość próbkowania, f - lista częstotliwości które chcemy analizować

    N = length(x)       #ilość próbek sygnału
    df = fp / N         #rozdzielczość częstotliwościowa (odległość między kolejnymi prążkami widma)

    sum_ampl = 0.0

    for freq in f

        k = mod(round(Int, freq/df), N)     #zamiana częstotliwości na indeks DFT, mod obsługuje ujemne częstotliwości

        X_k = 0.0 + 0.0*im

        for n in 1:N

            X_k += x[n] * exp(-2.0 * im * pi * (n-1) * k / N)     #wzór na DFT, x[n+1] bo Julia indeksuje tablice od 1 a nie od 0

        end

    sum_ampl += abs(X_k)

    end

    return sum_ampl/N

end

wynik = rozwiazanie()
println(wynik)




