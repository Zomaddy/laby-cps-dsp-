function rozwiazanie(;
    b::Vector{Float64} = [0.009579297601814234, 0.001426479944444266, 0.001426479944444268, 0.009579297601814236],
    a::Vector{Float64} = [1.0, -2.391858389490774, 1.9557469775946488, -0.5418770330113579],
    x::Vector{Float64} = [-0.97, -0.48, -0.15, 0.37, -0.51, 0.43, 0.02, 0.24, 0.71, -0.7, 0.75, -0.97, -0.13, -0.57, -0.25, 0.14, 0.84, -0.96, 0.57, -0.78, -0.93, 0.22, 0.96, -0.6, -0.58, 0.67, -0.56, -0.38, -0.16, 0.48, -0.66, -0.94, -0.3],
    L::Int = 67,
)

    y = zeros(Float64, L)       #przygotowanie wektora wynikowego
    
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

    power = sum(y .^ 2) / L

    return power
end

wynik = rozwiazanie()
println(wynik)
    
