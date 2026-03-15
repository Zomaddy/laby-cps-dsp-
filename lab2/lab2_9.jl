function hanning(N)
    if N <= 1
        error("N musi być większe od 1!")
    end
        x = zeros(N)

        for n in 1:N
            x[n] = 0.5*(1 - cos((2*pi*(n-1))/(N-1))) #mam n-1 zamiast n bo indeksy w Julii zaczynają się od 1 a nie od 0
        end

        return x

end