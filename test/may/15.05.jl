function rozwiazanie(;
    b::Vector{Float64} = [0.0003998430463974403, 0.0023990582783846416, 0.0059976456959616046, 0.007996860927948806, 0.0059976456959616046, 0.0023990582783846416, 0.0003998430463974403],
    a::Vector{Float64} = [1.0, -4.049162471897339, 7.719397428839857, -8.639695211922534, 5.936208639530886, -2.3683768634636913, 0.43034088063328574],
    x::Vector{Float64} = [0.78, -0.68, 0.75, -0.65, -0.79, -0.35, 0.15, -0.71, -0.19, -0.04, 0.81, 0.14, 0.94, -0.34, -0.56, 0.04, 0.32, 0.76, 0.85, -0.12, -0.96, -0.9],
    L::Int = 54,
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
end

wynik = rozwiazanie()
println(wynik)
