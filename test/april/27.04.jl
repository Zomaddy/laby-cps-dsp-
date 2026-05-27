function rozwiazanie(;
    order::Int = 82,
    fp::Float64 = 191.0,
    f0::Float64 = 80.22,
    z::Vector{Int} = [41, 76, 16, 80])

    R = order       #rząd filtru
    M = R + 1       #liczba współczynników

    h = zeros(Float64, M)       #tworzenie wektora współczynników

    w0 = 2*pi*f0 / fp       #normalizacja częstotliwości

    alfa = R/2.0            #środek symetrii filtru (faza zmienia się liniowo)

    for i in 1:M
        n = i - 1
        w = 0.42 - 0.5*cos(2*pi*n/R) + 0.08*cos(4*pi*n/R)       #wzór na okno Blackmana

        if n == alfa
            h_s = 1.0 - w0/pi

        else
            m = n - alfa
            h_s = -sin(w0*m) / (pi*m)       #ze wzoru na odpowiedź filtru górnoprzepustowego
        end

        h[i] = h_s*w        #nałożenie okna

    end

    return sum(h[z])

end
