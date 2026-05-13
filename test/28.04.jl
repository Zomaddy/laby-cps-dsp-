function rozwiazanie(;
    fp::Int = 1029,
    x::Vector{ComplexF64} = ComplexF64[-0.23 + 1.11im, -0.39 - 0.44im, 1.0 + 1.02im, 0.22 - 0.43im, 0.49 + 0.79im, 1.19 - 0.18im, -0.02 + 1.0im, -0.49 - 1.05im, 0.07 + 0.64im, -0.32 + 0.1im, -0.46 + 0.08im, -0.3 - 0.32im, -0.07 + 0.08im, 0.93 + 0.92im, 0.03 - 0.49im, 0.77 + 0.54im, -0.05 + 0.14im, -0.43 - 1.25im, 0.21 + 0.69im, -0.19 - 0.01im, -0.12 - 0.56im, 1.17 - 0.38im, -0.4 - 0.42im, -0.56 + 1.09im, 1.08 + 0.91im, -0.62 + 0.76im, -0.89 - 0.46im, -0.77 + 0.69im, -0.81 - 0.25im, 1.25 - 0.27im, -0.08 + 1.01im, -1.27 - 0.09im, -0.71 - 0.34im, 0.74 - 0.99im, -0.4 + 0.38im, 0.36 - 0.06im, 0.43 + 0.67im, 0.32 - 0.46im, 1.37 + 0.54im, -0.5 + 0.83im, -0.81 - 1.75im, 1.18 + 0.61im, -0.13 - 0.09im, 1.45 - 0.75im, 0.06 + 0.1im, 0.07 + 0.16im, 0.33 + 0.71im, -0.67 + 1.49im, -0.47 - 1.01im],
    f::Vector{Int} = [-462, -315, -126, 21, 63, 441],
)
    suma_faz = 0.0

    N = length(x)       #liczba próbek
    delta_f = fp/N      #rozdzielczość częstotliwościowa

    for freq in f
        k = mod(round(Int, freq/delta_f), N)

        X_k = 0.0 + 0.0*im

        for n in 1:N
            X_k += x[n]*exp(-2*im*pi*k*(n-1)/N)
        end

        suma_faz += angle(X_k)
    end

    return suma_faz
end
