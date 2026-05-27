function rozwiazanie(;
    zz::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.5486235627212649 - 0.7882251454803554im, 0.25747565138583617 + 0.9182450433366205im, 0.5486235627212649 + 0.7882251454803554im, 0.25747565138583617 - 0.9182450433366205im, 0.4821431931863473 - 0.7498841831265627im, 0.27815210655758893 + 0.8334048638096841im, 0.4821431931863473 + 0.7498841831265627im, 0.27815210655758893 - 0.8334048638096841im, 0.4059454726296323 - 0.7434042296839787im, 0.3326775334087432 + 0.7719554834438328im, 0.4059454726296323 + 0.7434042296839787im, 0.3326775334087432 - 0.7719554834438328im],
    k::Float64 = 1.443472778288582e-5,
    F::Vector{Float64} = [0.21, 0.3, 0.36],
)
    suma_wzm = 0.0

    for f in F      # iteracja po wybranych f
        z = exp(im*2*pi*f)      #zamiana częstotliwości na punkt na okręgu jednostkowym płaszczyzny zespolonej f -> z
        
        il_zer = 1.0 + 0.0*im

        for zero in zz
            il_zer *= (z - zero)        #obliczenie licznika ze wzoru na H(z)
        end

        il_bieg = 1.0 + 0.0*im

        for pole in pp
            il_bieg *= (z - pole)       #obliczanie mianownika ze wzoru na H(z)
        end

        Hz = k*il_zer/il_bieg          #obliczanie transmitancji

        suma_wzm += abs(Hz)             #moduł z Hz to amplituda odpowiedzi filtru
    end
        return suma_wzm / length(F)
    
end
