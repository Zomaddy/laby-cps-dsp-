function rozwiazanie(;
    order::Int = 58,
    fp::Float64 = 194.0,
    f1::Float64 = 29.1,
    f2::Float64 = 56.26,
    z::Vector{Int} = [19, 42, 7, 39, 3, 49],
)
    R = order
    M = R / 2
    fc1 = f1 / fp
    fc2 = f2 / fp
    sum_h = 0.0

    for i in z
            n = i - 1 - M

            if n == 0.0
                h_ideal = 1.0 - 2.0 * (fc2 - fc1)
            else
                h_ideal = (sin(2.0 * pi * fc1 * n) - sin(2.0 * pi * fc2 * n)) / (pi * n)
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

