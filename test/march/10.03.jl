function rozwiazanie(;
    order::Int = 44,
    fp::Float64 = 197.0,
    f0::Float64 = 74.86,
    z::Vector{Int} = [10, 40, 18, 7, 22, 41],
)

    R = 44      #rząd filtru
    M = R / 2   #środek filtru

    fc = f0 / fp    #znormalizowana częstotliwość odcięcia

    sum_h = 0.0

    for i in z

        n = i - 1 - M       #w Julii indeksujemy od 1, więc robimy -1 aby indeksy zaczynały się od 0, -M pozwala wyznaczyć pozycję próbki względem środka filtru

        if n == 0.0
            
            h_ideal = 2.0*fc
        
        else

            h_ideal = sin(2.0 * pi * fc * n)/(pi * n)

        end

            k = i - 1
            w = 0.42 - 0.5*cos(2.0 * pi * k / R) + 0.08*cos(4.0 * pi * k / R)       #wzór na okno Blackmana

            h = h_ideal * w

            sum_h += h

    end

    return sum_h

end

wynik = rozwiazanie()
println(wynik)


    
