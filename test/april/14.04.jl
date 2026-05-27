function rozwiazanie(;
    a::Float64 = -3.5,
    b::Float64 = 4.2,
    x::Vector{Float64} = [-3.032, -3.29722, 4.23755, 3.97233, 3.7071, 3.44188, 3.17666, 2.91143, 2.64621, 2.38098, 2.11576, 1.85053, 1.58531, 1.32009, 1.05486, 0.78964, 0.52441,  0.25919, -0.00603, -0.27126, -0.53648, -0.80171, -1.06693, -1.33215, -1.59738, -1.8626, -2.12783, -2.39305, -2.65828, -2.9235, -3.18872, -3.45395, 4.08083, 3.8156, 3.55038, 3.28516, 3.01993, 2.75471, 2.48948, 2.22426, 1.95904, 1.69381, 1.42859, 1.16336, 0.89814, 0.63291, 0.36769, 0.10247, -0.16276, -0.42798, -0.69321, -0.95843, -1.22365, -1.48888, -1.7541, -2.01933, -2.28455, -2.54977, -2.815, -3.08022, -3.34545, 4.18933, 3.92411, 3.65888, 3.39366, 3.12843, 2.86321],
)
    n = 8       #liczba bitów użytych do zapisu jednej próbki
    poziomy_kwant = 2^n         #liczba poziomów kwantyzacji
    q = (b-a)/(poziomy_kwant - 1)       # krok kwantyzacji (rozdzielczość) = wartość jednego poziomu, czyli najmniejsza różnica między dwiema wartościami
                                        # (poziomy_kwant - 1) to liczba przedziałów na jakie dzielony jest zakres sygnału
    
    suma_blad_kw = 0.0
    N = length(x)

    for i in 1:N
        value = max(a, min(b, x[i]))    #ograniczenie wartości do przedziału [a,b], czyli jeśli x[i] wyjdzie poza zakres to zostanie przycięte
                                        #min obcina wartości od góry (nie pozwala przekroczyć b), a max od dołu (nie przekroczy a)
        index = round((value-a)/q)      #indeks poziomu kwantyzacji; obliczenie, do którego poziomu jest najbliżej
        index = max(0.0, min(Float64(poziomy_kwant-1), index))      #index nie może być mniejszy niż 0 oraz większy niż liczba przedziałów
        
        x_q = a + index*q       #wartości x po kwantyzacji

        e = x_q - x[i]          #błąd kwantyzacji (różnica między wartością przybliżoną a oryginalną)

        suma_blad_kw += e^2     #dodajemy kwadrat błędu do sumy

    end

    moc_bledu = suma_blad_kw / N    #średnia moc błędu
    return moc_bledu
end
