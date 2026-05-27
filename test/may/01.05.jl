function rozwiazanie(;
    fp::Int = 920,
    x::Vector{ComplexF64} = ComplexF64[0.07 + 1.51im, -0.47 - 0.4im, -0.28 + 0.46im, -0.38 - 1.12im, 0.02 + 0.15im, -0.14 - 0.12im, -0.24 + 0.5im, -0.66 + 1.05im, -1.01 + 0.55im, 0.25 - 0.38im, 0.39 + 0.33im, 0.97 + 1.62im, 1.3 + 0.05im, 0.47 + 0.92im, 0.06 - 0.73im, 0.75 - 0.49im, 0.56 - 1.43im, -0.22 - 0.09im, -0.8 + 0.04im, 0.57 - 0.34im, -0.7 - 0.17im, -0.98 - 1.08im, -0.09 + 0.4im, -0.17 + 0.3im, 1.14 - 0.98im, 0.16 + 0.26im, 1.08 - 0.2im, 0.16 + 0.52im, 0.44 + 1.05im, 0.93 + 0.27im, -0.81 - 0.21im, 0.21 + 0.57im, 0.21 - 0.43im, -0.07 + 0.7im, -0.02 - 0.2im, 0.19 - 0.54im, 0.45 + 0.71im, -0.41 + 0.66im, -1.1 - 1.49im, 0.54 - 1.11im, 0.11 + 0.66im, 1.06 + 0.35im, 1.35 + 0.81im, 0.55 - 1.15im, -0.59 + 0.8im, 0.92 + 1.46im],
    f::Vector{Int} = [-360, -220, -120, 40, 180, 440],
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
