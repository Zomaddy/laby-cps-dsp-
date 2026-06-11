function rozwiazanie(;
    b::Vector{Float64} = [0.30239179203701394, -1.2095671681480558, 1.8143507522220836, -1.2095671681480558, 0.30239179203701394],
    a::Vector{Float64} = [1.0, -1.7292574926054733, 1.4460876718527116, -0.5712628798611925, 0.0916606282728463],
    x::Vector{Float64} = [0.04, 0.7, 0.31, -0.42, 0.61, -0.34, -0.15, -0.95, -0.54, 0.94, -0.02, -0.19, 0.82, 0.68, 0.89, 0.23, -0.92, 0.38, 0.79, -0.83, 0.6, 0.36, -0.99, -0.01, 0.09, 0.43, 0.86, 0.02, -0.71, 0.31, -0.31, -0.04, 0.3, -0.72, -0.53, 0.62, -0.87, -0.63, -0.32, 0.95],
    L::Int = 71,
)
    y = zeros(Float64, L)

    for n in 1:L
        sum_x = 0.0

        for m in 1:length(b)
            idx_x = n - m + 1
        
            if 1 <= idx_x <= length(x)
                sum_x += b[m] * x[idx_x]
            end
        end

        sum_y = 0.0

        for k in 2:length(a)
            idx_y = n - k + 1
        
            if 1 <= idx_y
                sum_y += a[k] * y[idx_y]
            end
        end

        y[n] = (sum_x - sum_y) / a[1]

    end

    rms = sqrt(sum(y .^ 2) / L)
    return rms
end

wynik = rozwiazanie()
println(wynik)
