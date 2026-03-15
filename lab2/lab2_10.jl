function hamming(N)
    if N <= 1
        error("N musi być większe od 1!")
    end
        x = zeros(N)
        alfa = 0.54
        beta = 0.46 #wartości dla typowego okna Hamminga

        for n in 1:N
            x[n] = alfa - beta*cos((2*pi*(n-1)/(N-1))) #mam n-1 zamiast n bo indeksy w Julii zaczynają się od 1 a nie od 0
        end

        return x

end