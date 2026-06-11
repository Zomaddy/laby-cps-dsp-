function rozwiazanie(;
    fp::Float64 = 233.38,
    t1::Float64 = -4.71,
    N::Int = 637,
)

    Tp = 1.0 / fp

    g(t) = 1 * ((mod(t, 1) > 0 && mod(t, 1) < 0.5) ? 1 : -1)        #bipolarna fala od -1 do 1

    y(t) = 1.2 * g(4.4*t - 3.3)

    suma = 0.0

    for n in 1:N
        tn = t1 + (n - 1) * Tp
        suma += y(tn)
    end

    return suma / N
end

wynik = rozwiazanie()
println(wynik)
