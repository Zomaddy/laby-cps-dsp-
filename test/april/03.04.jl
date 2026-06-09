function rozwiazanie(;
    order::Int = 68,
    fp::Float64 = 194.0,
    f0::Float64 = 54.32,
    z::Vector{Int} = [17, 39, 56, 47],
)

   R = order    #rząd filtru
   M = R / 2    #środek symetrii filtru
   fc = f0 / fp #znormalizowana częstotliwość odcięcia

   sum_h = 0.0

   for i in z
        n = i - 1 - M
        
        if n == 0.0
            h_ideal = 1.0 - 2.0 * fc
        else
            h_ideal = -sin(2.0 * pi * fc * n) / (pi * n)        #wzór na idealną odpowiedź impulsową filtru high-pass
        end

        k = i - 1
        w = 0.5 - 0.5 * cos(2.0 * pi * k / R)       #wzór na okno Hanninga

        h = h_ideal * w     #nałożenie okna

        sum_h += h
    end

    return sum_h
end

wynik = rozwiazanie()
println(wynik)

   
