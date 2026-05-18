function rozwiazanie(;
    order::Int = 80,
    fp::Float64 = 193.0,
    f1::Float64 = 28.95,
    f2::Float64 = 55.97,
    z::Vector{Int} = [39, 13, 11],
)
    R = order
    M = R/2

    w1 = f1/fp
    w2 = f2/fp      #znormalizowane częstotliwości odcięcia

    suma_h = 0.0

    for i in z
        n = i - 1 - M       #przesunięcie względem środka filtru

        if n == 0           #wartość idealnego filtru pasmowozaporowego
            h_ideal = 1.0 - 2.0*(w2 - w1)
        else
            h_ideal = (sin(2.0*pi*w1*n) - sin(2.0*pi*w2*n))/(pi*n)
        end

        w = 0.5*(1 - cos((2*pi*i)/(R-1)))       #wzór na okno Hanninga

        h = h_ideal*w
        suma_h += h
    end

    return suma_h

end         #wynik 0.23049965695343425 poprawny
