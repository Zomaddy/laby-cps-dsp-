function rozwiazanie(;
    a::Float64 = -4.0,
    b::Float64 = 5.0,
    x::Vector{Float64} = [-2.132, -1.68575, -1.2395, -0.79326, -0.34701, 0.09924, 0.54549, 0.99174, 1.43798, 1.88423, 2.33048, 2.77673, 3.22298, 3.66923, 4.11547, 4.56172, 5.00797, -3.94578, -3.49953, -3.05329, -2.60704, -2.16079, -1.71454, -1.26829, -0.82205, -0.3758, 0.07045, 0.5167, 0.96295, 1.40919, 1.85544, 2.30169, 2.74794, 3.19419, 3.64043, 4.08668, 4.53293, 4.97918, -3.97457, -3.52832, -3.08208, -2.63583, -2.18958, -1.74333, -1.29708, -0.85084, -0.40459, 0.04166, 0.48791, 0.93416, 1.3804, 1.82665, 2.2729, 2.71915, 3.1654, 3.61164, 4.05789, 4.50414, 4.95039, -4.00336, -3.55711, -3.11087, -2.66462, -2.21837, -1.77212, -1.32587, -0.87963, -0.43338, 0.01287, 0.45912, 0.90537, 1.35161, 1.79786, 2.24411, 2.69036, 3.13661, 3.58285, 4.0291, 4.47535, 4.9216, -4.03215, -3.58591, -3.13966, -2.69341, -2.24716, -1.80091, -1.35466, -0.90842, -0.46217, -0.01592, 0.43033, 0.87658],
)
    n = 10       #liczba bitów użytych do zapisu jednej próbki
    poziomy_kwant = 2^n      ##liczba poziomów kwantyzacji
    q = (b-a) / (poziomy_kwant - 1)      #krok kwantyzacji (rozdzielczość) = wartość jednego poziomu, czyli najmniejsza różnica między dwiema wartościami
                                        # (poziomy_kwant - 1) to liczba przedziałów na jakie dzielony jest zakres sygnału
    suma_bl_kwant = 0.0
    N = length(x)

    for i in 1:N
        value = max(a, min(b, x[i]))    #ograniczenie wartości do przedziału [a,b], czyli jeśli x[i] wyjdzie poza zakres to zostanie przycięte
                                        #min obcina wartości od góry (nie pozwala przekroczyć b), a max od dołu (nie przekroczy a)
        index = round((value - a) / q)  #indeks poziomu kwantyzacji; obliczenie, do którego poziomu jest najbliżej
        index = max(0.0, min(Float64(poziomy_kwant - 1), index))    #index nie może być mniejszy niż 0 oraz większy niż liczba przedziałów
        xq = a + index*q    #wartość x po kwantyzacji
        e = xq - x[i]       #błąd kwantyzacji (różnica między wartością przybliżoną a oryginalną)
        suma_bl_kwant += e^2
    end
    
    rms = sqrt(suma_bl_kwant / N)
    
    return rms
end

wynik = rozwiazanie()
println(wynik)
    
