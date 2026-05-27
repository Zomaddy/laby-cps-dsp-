function rozwiazanie(;
    fp::Int = 760,
    x::Vector{ComplexF64} = ComplexF64[1.73 + 0.39im, 0.05 + 0.34im, -0.65 + 0.03im, -0.58 + 0.05im, 0.41 - 0.44im, 0.22 - 0.32im, -0.83 + 0.05im, 0.26 + 0.47im, -0.56 + 0.31im, -0.91 - 0.0im, 0.05 + 0.5im, -0.61 - 0.06im, 0.15 - 0.46im, 1.0 + 0.22im, 0.03 + 1.23im, 0.45 - 0.29im, 0.95 + 0.71im, 0.83 + 0.23im, 0.11 + 0.25im, 0.39 + 0.51im, -1.58 + 1.09im, 0.51 + 0.79im, -0.72 - 0.14im, 0.55 + 0.36im, 0.46 - 0.07im, 0.54 + 0.5im, 0.3 + 0.18im, -0.81 - 0.79im, -0.86 + 1.1im, 0.61 - 0.09im, -0.75 + 0.99im, 0.37 + 0.27im, -0.79 - 0.09im, -1.47 - 0.09im, 0.19 + 1.27im, -0.04 - 0.27im, 0.3 - 0.08im, -0.12 + 0.57im],
    f::Vector{Int} = [-320, -220, -60, 0, 80, 120, 320],
)
    suma_ampl = 0.0

    N = length(x)

    delta_f = fp/N

    for freq in f
        k = mod(round(Int, freq/delta_f),N)

        X_k = 0.0 + 0.0*im

        for n in 1:(N-1)
            X_k += x[n+1]*exp(-2*im*pi*k*n/N)
        end

        suma_ampl += abs(X_k)
    end

    return suma_ampl/N

end


 