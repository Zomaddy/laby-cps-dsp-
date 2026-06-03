function rozwiazanie(;
    b::Vector{Float64} = [0.28976096234731447, -1.4536532969459592, 4.365840827359733, -8.741411185050369, 13.117013994235188, -14.870157783859483, 13.117013994235188, -8.741411185050367, 4.365840827359731, -1.4536532969459586, 0.28976096234731435],
    a::Vector{Float64} = [1.0, -3.8464017493362634, 8.671844466981186, -13.283440770129834, 15.335207193205632, -13.404949034554452, 9.013757626429358, -4.464955118342143, 1.5253620745465175, -0.2605400754894299, -0.0009397932782392532],
    F::Vector{Float64} = [0.06, 0.08, 0.28, 0.29, 0.5],
)

#a to wektor współczynników licznika filtru, a b to wektor współczynników mianowanika filtru, F to częstotliwości znormalizowane

suma_wzm = 0.0

    for f in F

        z_inv = exp(-2*im*pi*f)     #obliczanie punktu na okręgu jednostkowym

        licznik = 0.0 + 0.0*im
        mianownik = 0.0 + 0.0*im

        for l in 1:length(b)
            
            licznik += b[l]*z_inv^(l-1)

        end

        for m in 1:length(a)

        mianownik += a[m]*z_inv^(m-1)       #stosujemy przesunięcie m-1 oraz l-1 ponieważ indeksy w Julii zaczynają się od 1, a nasze potęgi mają zaczynać się od 0

        end

        suma_wzm += abs(licznik/mianownik)          #H(z) = licznik/minownik a wartość bezwzględna z tego to A(f)

    end

    return suma_wzm/(length(F))

end

wynik = rozwiazanie()

println(wynik)





