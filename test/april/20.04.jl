function rozwiazanie(;
    order::Int = 46,
    fp::Float64 = 200.0,
    f1::Float64 = 64.0,
    f2::Float64 = 84.0,
    z::Vector{Int} = [35, 38, 46],
    )

    R = order       #rząd filtru
    M = R / 2       #środek filtru
    fc1 = f1 / fp
    fc2 = f2 / fp       #normalizacja częstotliwości
    sum_h = 0.0

    for i in z
        n = i - 1 - M           

        if n == 0.0
            h_ideal = 1.0 - 2.0 * (fc2 - fc1)
        else
            h_ideal = (sin(2.0 * pi * fc1 * n) - sin(2.0 * pi * fc2 * n)) / (pi * n)
        end

        w = 1.0 - abs.(n / M)     #okno trójkątne (Bartletta)

        h = h_ideal * w         #nałożenie okna
        sum_h += h
    end

        return sum_h
end

wynik = rozwiazanie()
println(wynik)

