function blackman(N)
    if N <= 1
        error("N musi być większe od 1!")
    end
        x = zeros(N)
        alfa = 0.16
        a0 = (1-alfa)/2
        a1 = 0.5
        a2 = alfa/2

        for n in 1:N
            x[n] = a0 - a1*cos((2*pi*(n-1))/(N-1)) + a2*cos((4*pi*(n-1))/(N-1)) #mam n-1 zamiast n bo indeksy w Julii zaczynają się od 1 a nie od 0
        end

        return x

end
