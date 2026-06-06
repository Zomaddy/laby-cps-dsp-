function rozwiazanie(;
    order::Int = 26,
    fp::Float64 = 193.0,
    f0::Float64 = 67.55,
    z::Vector{Int} = [12, 4, 10, 2, 16],
)

    R = 26      #rząd filtru
    M = R/2     #środek filtru

    sum_h = 0.0

    fc = f0 / fp

    for i in z

        n = i - 1 - M
        
        if n == 0.0

            h_ideal = 1.0 - 2.0*fc

        else

            h_ideal = -sin(2.0 * pi * fc * n)/(pi * n)      #wzór na indealną odpowiedź impulsową filtru high-pass

        end

        k = i - 1
        w = 0.42 - 0.5*cos(2.0 * pi * k / R) + 0.08*cos(4.0 * pi * k / R)       #wzór na okno Blackmana

        h = h_ideal * w     #nałożenie okna

        sum_h += h

    end

    return sum_h

end

wynik = rozwiazanie()
println(wynik)
