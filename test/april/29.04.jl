function rozwiazanie(;
    fp::Int = 680,
    x::Vector{ComplexF64} = ComplexF64[0.25 - 1.33im, -0.08 - 0.27im, -0.35 + 0.42im, 0.17 + 0.34im, 0.86 + 0.62im, -0.92 - 0.07im, 0.45 - 0.69im, 0.36 + 0.27im, 0.38 - 0.05im, -0.95 - 1.34im, -1.62 - 0.77im, -0.18 + 0.37im, -0.93 - 1.14im, 0.02 - 0.61im, 0.09 - 0.75im, 0.94 + 0.1im, -0.13 - 0.7im, 0.12 + 1.07im, 0.28 + 0.25im, -0.17 + 1.51im, 0.34 - 0.56im, 1.1 - 0.19im, -0.41 + 0.28im, -0.5 + 0.1im, 0.66 - 0.31im, -0.13 - 0.2im, 0.43 + 0.46im, 0.46 + 0.81im, -0.9 - 0.48im, 0.18 - 0.73im, 0.64 - 0.25im, 0.06 + 0.31im, -0.05 + 0.36im, 0.47 + 0.13im],
    f::Vector{Int} = [-60, -20, 20, 40, 100, 120, 260, 300],
)
    suma_faz = 0.0

    N = length(x)
    delta_f = fp/N

    for freq in f
        k = mod(round(Int, freq/delta_f),N)

        X_k = 0.0 + 0.0*im

        for n in 1:N
            X_k += x[n]*exp(-2*im*pi*k*(n-1)/N)
        end

        suma_faz += angle(X_k)

    end

    return suma_faz


end
