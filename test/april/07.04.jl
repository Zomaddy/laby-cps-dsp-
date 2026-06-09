function rozwiazanie(;
    fp::Float64 = 166.69,
    t1::Float64 = 0.75,
    N::Int = 770,
)

   Tp = 1.0 / fp        #okres próbkowania, 1.0 bo w treści okres = 1 sekunda

   g(t) = 2.0 * (mod(t + 0.5, 1.0) - 0.5)        #mod ... daje piłę od -0.5 do 0.5

   y(t) = 5.2 * g(3.0 * t - 2.9)        #funkcja z treścia zadania

   suma = 0.0

   for n in 1:N
        tn = t1 + (n-1) * Tp        #czas tn dla n-tej próbki, n-1 przez indeksowanie w Julii
        suma += y(tn)
   end

   average = suma / N

   return average
end

wynik = rozwiazanie()
println(wynik)

