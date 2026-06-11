function rozwiazanie(;
    order::Int = 18,
    fp::Float64 = 199.0,
    f0::Float64 = 19.9,
    z::Vector{Int} = [14, 2, 13],
)
    R = order
    M = R / 2
    fc = f0 / fp
    sum_h = 0.0

    for i in z
        n = i - 1 - M

        if n == 0
            h_ideal = 2.0*fc
        else
            h_ideal = sin(2.0 * pi * fc * n) / (pi * n)
        end

        alfa = 0.53
        beta = 0.46

        w = alfa - beta * cos(2.0 * pi * (i - 1) / R)

        h = h_ideal * w
        sum_h += h
    end

    return sum_h
end

wynik = rozwiazanie()
println(wynik)

