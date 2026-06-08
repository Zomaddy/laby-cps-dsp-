function rozwiazanie(;
    b::Vector{Float64} = [0.006933196130142605, 0.034665980650713024, 0.06933196130142605, 0.06933196130142605, 0.034665980650713024, 0.006933196130142605],
    a::Vector{Float64} = [1.0, -1.9759016164414662, 2.0134730260003075, -1.1026179777777694, 0.32761833400015666, -0.040709489616665206],
    x::Vector{Float64} = [-0.98, 0.25, 0.97, -0.74, 0.59, 0.23, -0.42, 0.74, -0.64, -0.62, -0.45],
    L::Int = 36,
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

    return sum(y) / L
end

wynik = rozwiazanie()
println(wynik)
    
