function rozwiazanie(;
    fp::Int = 828,
    x::Vector{ComplexF64} = ComplexF64[0.61 - 0.58im, 0.12 + 0.07im, 0.13 + 0.96im, 0.21 + 0.81im, -0.95 + 0.58im, -0.51 - 0.52im, -1.21 - 0.49im, -0.49 + 0.1im, -0.52 + 0.49im, 0.83 + 0.91im, 0.01 + 0.53im, 0.54 + 0.85im, -0.23 - 0.39im, 1.33 - 0.27im, -0.33 - 0.04im, -0.22 + 0.24im, 0.57 - 1.18im, -0.26 - 0.85im, -1.36 + 0.03im, 0.0 + 0.03im, 0.9 - 0.21im, -0.34 + 0.63im, -0.51 + 1.08im, 1.18 - 1.12im, 0.29 + 1.36im, -0.07 - 0.11im, 0.13 + 0.13im, -0.11 + 1.01im, -0.8 + 1.28im, 0.14 + 0.73im, -0.34 - 0.11im, -2.23 - 0.66im, 0.8 - 0.82im, 0.71 - 0.4im, 0.4 - 0.96im, -0.04 - 0.47im, -1.12 + 0.07im, -0.69 - 0.94im, -0.58 - 0.32im, -0.39 - 0.94im, 0.02 - 1.31im, 0.46 + 0.31im, 0.89 - 0.01im, 0.21 + 1.76im, -0.55 + 0.75im, -0.0 - 1.2im],
    f::Vector{Int} = [-360, -108, 18, 72, 180, 216, 360],
)
    suma_faz = 0.0

    N = length(x)
    delta_f = fp/N

    for freq in f
        k = mod(round(Int, freq/delta_f), N)

        X_k = 0.0 + 0.0*im

        for n in 1:N
            X_k += x[n]*exp(-2*im*pi*k*(n-1)/N)

        end

        suma_faz += angle(X_k)

    end

    return suma_faz #wynik -5.835798500802858 poprawny
end
