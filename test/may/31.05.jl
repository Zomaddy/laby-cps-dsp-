function rozwiazanie(;
    order::Int = 60,
    fp::Float64 = 190.0,
    f1::Float64 = 31.35,
    f2::Float64 = 52.25,
    z::Vector{Int} = [30, 9, 22, 43],
)
    R = order
    M = R / 2
    fc1 = f1 / fp
    fc2 = f2 / fp
    sum_h = 0.0

    for i in z
        n = i - 1 - M

        if n == 0
            h_ideal = 1.0 - 2.0 * (fc2 - fc1)
        else
            h_ideal = (sin(2.0 * pi * fc2 * n) - sin(2.0 * pi * fc1 * n)) / (pi * n)
        end

        w = 1.0 - abs(n) / M
        h = h_ideal * w
        sum_h += h
    end

    return sum_h
end

wynik = rozwiazanie()
println(wynik)

