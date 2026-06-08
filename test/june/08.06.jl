function rozwiazanie(;
    b::Vector{Float64} = [0.0318663252694087, 0.057042269075136556, 0.05704226907513657, 0.031866325269408705],
    a::Vector{Float64} = [1.0, -1.86681540044199, 1.6177697389253982, -0.5731371497943178],
    x::Vector{Float64} = [-0.79, 0.36, -0.25, -0.58, 0.07, 0.73, 0.62, 0.95, -0.06, -0.03, -0.78, 0.84, -0.39, -0.5, -0.5, -0.17, -0.63, 0.69, -0.36, -0.78, -0.95, 0.9, 0.18, 0.96, 0.29, -0.69, -0.28, -0.33, -0.98, -0.66, 0.11, -0.78, -0.4, 0.95, 0.1, 0.02, 0.74, 0.12, 0.7, 0.09],
    L::Int = 74,
)
#a to współczynniki części wejściowej filtru, b to współczynniki sprzężenia zwrotnego, x to sygnał wejściowy, L to ilość próbek
    y = zeros(Float64, L)       #tworzenie sygnału wyjściowego

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

    N = length(y)
    power = sum(y .^ 2)/N
            
    return power

end

wynik = rozwiazanie()
println(wynik)      #wynik 0.046532158743308225 poprawny
