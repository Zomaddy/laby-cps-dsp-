function rozwiazanie(;
    b::Vector{Float64} = [0.03935944640129429, 0.11807833920388286, 0.11807833920388286, 0.03935944640129429],
    a::Vector{Float64} = [1.0, -1.487325412272018, 1.2503417556289758, -0.44814077214660336],
    F::Vector{Float64} = [0.22, 0.44, 0.47],
)
    sr_wzm = 0.0

    for f in F
        licznik = 0.0 + 0.0*im

        for l in 1:length(b)
            licznik += b[l]*exp(-2*im*pi*f*(l-1))
        end

        mianownik = 0.0 + 0.0*im

        for m in 1:length(a)
            mianownik += a[m]*exp(-2*im*pi*f*(m-1))
        end

        H_f = licznik/mianownik

        sr_wzm += abs(H_f)

    end

    return sr_wzm/length(F)


end
