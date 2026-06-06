function rozwiazanie(;
    order::Int = 86,
    fp::Float64 = 190.0,
    f0::Float64 = 28.5,
    z::Vector{Int} = [31, 16, 12],
)

    R = 86      #rząd filtru
    M = R/2     #środek filtru

    fc = f0 / fp        #znormalizowana częstotliwość odcięcia

    sum_h = 0.0

    for i in z

        n = i - 1 - M

        if n == 0.0

            h_ideal = 2.0 * fc

        else

            h_ideal = sin(2.0 * pi * fc * n) / (pi * n)

        end

        w = 1.0 - abs(n) / M      #wzór na okno trójkątne

        h = h_ideal * w           #nałożenie okna

        sum_h += h

    end

    return sum_h

end

wynik = rozwiazanie()
println(wynik)

