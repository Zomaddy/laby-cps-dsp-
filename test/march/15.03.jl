function rozwiazanie(;
    b::Vector{Float64} = [0.07821836782384287, -0.21540851659086, 0.29221154907893215, -0.21540851659085994, 0.07821836782384281],
    a::Vector{Float64} = [1.0, 0.6759769123089231, 0.6682001243049736, 0.14365604247594752, 0.03089814838823525],
    F::Vector{Float64} = [0.07, 0.27, 0.4, 0.45],
)
   
#b - współczynniki licznika transmitancji filtru, a - współczynniki mianownika, F - częstotliwości znormalizowane dla których chcemy policzyć fazę


    sum_phase = 0.0

    for f in F

        num = 0.0 + 0.0*im

        for l in 1:length(b)

            num += b[l] * exp(-2.0 * im * pi * f * (l-1))       #obliczanie licznika transmitancji ze wzoru: B(z) = b0 + b1*z^(-1) + b2*z^(-2) + b3*z^(-3) + ... gdzie z = -j2pif

        end

        denum = 0.0 + 0.0*im

        for m in 1:length(a)

            denum += a[m] * exp(-2.0 * im * pi * f * (m-1))     #obliczanie mianownika transmitancji ze wzoru: A(z) = a0 + a1*z^(-1) + a2*z^(-2) + a3*z^(-3) + ... gdzie z = -j2pif

        end

        H_z = num / denum       #obliczanie transmitancji

        sum_phase += angle(H_z)

    end

    return sum_phase / length(F)

end

wynik = rozwiazanie()
println(wynik)

        
