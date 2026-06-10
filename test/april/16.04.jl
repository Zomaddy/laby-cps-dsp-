function rozwiazanie(;
    fp::Float64 = 461.72,
    t1::Float64 = 6.67,
    N::Int = 177,
)
    Tp = 1.0 / fp       #okres próbkowania, korzystamy ze wzoru T = 1/f

    function g(t)       #g(t) to bipolarna fala prostokątna

    m = mod(t, 1.0)     #zwijanie czasu do jednego okresu, czyli wszystkie wartości będą z przedziału (0,1]

    if m < 1e-10 || abs(m - 0.5) < 1e-10 || (1.0 - m) < 1e-10       #obsługa punktów nieciągłości, sprawdzamy czy jesteśmy bardzo blisko 0, 0.5, 1 (miejsca skoków sygnału prostokątne                                                                #go
        return 0.0
    
    elseif m < 0.5      #pierwsza połowa okresu
        return 1.0
    
    else                #druga połowa okresu
        return -1.0
    end
end
    y(t) = 2.8 * g(2.1 * t - 0.2)       #funkcja z treści zadania

    suma = 0.0

    for n in 1:N
        tn = t1 + (n-1)*Tp
        suma += y(tn)
   end

    return suma / N
end

wynik = rozwiazanie()
println(wynik)

        
    


