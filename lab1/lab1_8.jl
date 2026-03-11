function newton(a; tolerancja = 1e-10, max_iter = 1000)
    if a < 0
        error("a musi być >= 0")
    end

    if a == 0
        return 0.0
    end
    
    x = a

    for i in 1:max_iter
        new_x = 0.5 * (x + a/x) #wzór na metodę Newtona: x(n+1) = x(n) - f(x(n))/f'(x(n))

        if abs(new_x - x) < tolerancja
            return new_x
        end

        x = new_x
    end

    return x
end

