function rozwiazanie(;
    b::Vector{Float64} = [0.16255645338442562, -0.6612848488621007, 1.2033069414780484, -1.2033069414780484, 0.6612848488621007, -0.16255645338442562],
    a::Vector{Float64} = [1.0, -1.1894474835899507, 1.5702136600279872, -0.372279433138221, 0.17929844322948113, 0.2569425325364882],
    x::Vector{Float64} = [-0.58, -0.71, -0.4, 0.61, 0.11, 0.16, 0.23, -0.72, -0.45, 0.48, -0.23, 0.0, -0.24, 0.67, -0.01, -0.53, 0.01, -0.19, -0.64, -0.86, -0.66, 0.16, 0.64, 0.37, 0.2, -0.01, -0.69, 0.58, -0.37, -0.43, -0.79, -0.56, -0.19, -0.61, 0.83, -0.77, 0.74, 0.08, -0.94, 0.09, 0.82, 0.88, -0.7, 0.02, 0.63, 0.77, -0.7, -0.17],
    L::Int = 96,
)
#a to współczynniki części wejściowej filtru, b to współczynniki sprzężenia zwrotnego, x to sygnał wejściowy, L to ilość próbek

    y = zeros(Float64, L)       #tworzenie sygnału wyjściowego
    
    for n in 1:L
        sum_x = 0.0
        
        for m in 1:length(b)
            idx_x = n - m + 1       #+1 bo w Julii indeksujemy od 1 a nie od 0
            
            if 1 <= idx_x <= length(x)      #sprawdzamy, żeby nie odwołać się do indeksów które nie istnieją
                sum_x += b[m] * x[idx_x]
            end
        end

        sum_y = 0.0
    
        for k in 2:length(a)        #zaczynamy od 2, bo a[1] = a0
            idx_y = n - k + 1

            if idx_y >= 1
                sum_y += a[k] * y[idx_y]
            end
        end

        y[n] = (sum_x - sum_y) / a[1]

    end

    energy = sum(y .^ 2)

    return energy

end

wynik = rozwiazanie()
println(wynik)

