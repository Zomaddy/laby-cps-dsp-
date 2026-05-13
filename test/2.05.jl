function rozwiazanie(;
    fp::Int = 774,
    x::Vector{ComplexF64} = ComplexF64[0.18 + 0.9im, 0.29 + 0.8im, -0.23 - 0.45im, -0.66 + 0.22im, 0.45 + 1.02im, 1.66 - 0.17im, 0.99 - 0.99im, 0.19 + 0.33im, -0.71 - 0.13im, 0.68 - 0.78im, 0.29 + 1.22im, 0.27 - 0.71im, -0.57 + 0.73im, -0.3 - 1.12im, 0.13 - 0.1im, 0.37 + 0.7im, -1.02 + 0.38im, 0.4 - 1.09im, 0.62 - 0.38im, 0.5 + 1.0im, -0.48 + 0.24im, 0.31 - 1.02im, 0.01 + 0.34im, -0.22 + 0.33im, -0.21 + 0.22im, -1.81 - 0.64im, 1.2 + 1.12im, 0.34 - 0.65im, -0.4 + 0.22im, -0.94 - 1.68im, -0.32 + 0.58im, -1.53 - 0.16im, -0.12 + 0.79im, 0.6 - 0.37im, -0.33 + 0.53im, -0.11 - 1.21im, -0.02 - 1.25im, -0.98 - 0.2im, -0.39 - 0.49im, -0.13 - 0.58im, 0.06 - 0.3im, -0.22 + 0.46im, 1.18 + 1.77im],
    f::Vector{Int} = [-306, -108, -54, 126, 216, 324, 342],
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
