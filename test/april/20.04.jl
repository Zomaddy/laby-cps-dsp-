function rozwiazanie(;
    order::Int = 46,
    fp::Float64 = 200.0,
    f1::Float64 = 64.0,
    f2::Float64 = 84.0,
    z::Vector{Int} = [35, 38, 46],
    )

    dl_filtru = order + 1       #liczba współczynników, zależność dla filtru FIR

    h = zeros(Float64, dl_filtru)       #tworzenie wektora współczynników

    w1 = 2*pi*f1 / fp
    w2 = 2*pi*f2 / fp       #normalizacja częstotliwości

    alfa = order/2.0        #wyznaczenie środka symetrii filtru (faza ma zmieniać się w sposób liniowy)

    for i in 1:dl_filtru
        n = i - 1           #zmiana indeksowania (od 0 a nie od 1)

        w = 1.0 - abs.((n - alfa)/alfa)     #trójkątne okno Barletta

        if n == alfa
            h_s = 1.0 - (w2-w1)/pi      #idealna odp impulsowa, przypadek środkowego elementu

        else
            h_s = (sin(w1*(n-alfa)) - sin(w2*(n-alfa)))/(pi*(n-alfa))   #dla pozostałych współczynników (idealny filtr pasmowozaporowy)

        end
            h[i] = h_s * w      #nałożenie okna
    end

    suma = sum(h)       #dla filtru FIR suma współczynników = wzmocnienie dla 0 Hz (DC)

    for j in 1:dl_filtru
        h[i] = h[i]/suma        #dzięki temu suma wszystkich współczynników wynosi 1 -> sygnał stały przechodzi bez zmiany amplitudy, filtr ma wzmocnienie 1 w paśmie przepustowym
    end

    suma_final = sum(h[z])      #suma wybranych współczynników

    return suma_final

end







end