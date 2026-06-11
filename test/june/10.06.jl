function rozwiazanie(;
    order::Int = 48,
    fp::Float64 = 194.0,
    f0::Float64 = 50.44,
    z::Vector{Int} = [6, 7, 24, 23, 27, 33],
)
    R = order
    M = R / 2
    fc = f0 / fp
    sum_h = 0.0

    for i in z
        n = i - 1 - M

        if n == 0
            h_ideal = 1.0 - 2.0*fc
        else
            h_ideal = -sin(2.0 * pi * fc * n) / (pi * n)
        end

        k = i - 1
        w = 0.42 - 0.5 * cos(2.0 * pi * k / R) + 0.08 * cos(4.0 * pi * k / R)
        h = h_ideal * w

        sum_h += h
    end

    return sum_h
end

wynik = rozwiazanie()
println(wynik)

