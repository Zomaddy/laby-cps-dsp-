function silnia_iter(n)
    silnia = 1;
    if n == 0
        return 1
    else 
        for i in 1:n
            silnia = silnia*i
        end
        @show silnia
    end
end

