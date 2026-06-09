function rozwiazanie(;
    b::Vector{Float64} = [0.15704537558097117, -0.6289713606967544, 1.1370016882066123, -1.1370016882066125, 0.6289713606967546, -0.1570453755809712],
    a::Vector{Float64} = [1.0, -1.0098233508496246, 1.4741171183117325, -0.30770374237850595, 0.25583960213116463, 0.20144696470235185],
    F::Vector{Float64} = [0.26, 0.31, 0.43],
)

    sum_phase = 0.0

    for f in F
        num = 0.0 + 0.0*im

        for l in 1:length(b)
            num += b[l] * exp(-2.0 * im * pi * f * (l-1))        #obliczanie licznika transmitancji ze wzoru: B(z) = b0 + b1*z^(-1) + b2*z^(-2) + b3*z^(-3) + ... gdzie z = -j2pif
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

