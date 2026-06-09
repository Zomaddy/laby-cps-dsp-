function rozwiazanie(;
    fp::Float64 = 118.72,
    t1::Float64 = -7.2,
    N::Int = 186,
)
    Tp = 1.0 / fp   #okres próbkowania

    g(t) = -2.0 * (mod(t + 0.5, 1.0) - 0.5)     # Funkcja g(t) - fala piłokształtna o opadającym zboczu mod(t + 0.5, 1.0) - 0.5 daje wartości od -0.5 do 0.5
                                                # Mnożymy przez -2.0, aby amplituda wynosiła 1 (zakres -1 do 1) i zachować ujemne nachylenie (pochodna -2 w zerze)
    y(t) = 1.5 * g(2.2 * t - 4.9)       #funkcja z polecenia

    suma = 0.0
    
    for n in 1:N
        tn = t1 + (n - 1) * Tp
        suma += y(tn)
    end

    return suma / N
end

wynik = rozwiazanie()
println(wynik)
