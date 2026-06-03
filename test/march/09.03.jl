function rozwiazanie(;
    order::Int = 20,
    fp::Float64 = 196.0,
    f1::Float64 = 13.72,
    f2::Float64 = 33.32,
    z::Vector{Int} = [3, 4, 7],
)

    R = order       #rząd filtru
    M = R/2         #środek filtru
    
    fc1 = f1/fp
    fc2 = f2/fp     #znormalizowane częstotliwości odcięcia

    sum_h = 0.0

    for i in z

        n = i - 1 - M

        if n == 0.0

            h_ideal = 1.0 - 2.0 * (fc2 - fc1)

        else

            h_ideal = (sin(2.0 * pi * fc1 * n) - sin(2.0 * pi * fc2 * n)) / (pi * n)        #wzór na idealną odpowiedź impulsową filtru pasmowozaporowego

        end

        k = i - 1
        w = 0.42 - 0.5 * cos(2.0 * pi * k / R) + 0.08 * cos(4.0 * pi * k / R)               #wzór na okno Blackmana

        h = h_ideal * w     #nałożenie okna
        sum_h += h

    end

    return sum_h

end

wynik = rozwiazanie()
println(wynik)




