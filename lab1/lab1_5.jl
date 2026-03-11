    function reverse_vector(s)
    n = length(s)
    r = Vector{Any}(undef,n) #undef - tworzę wektor długości n, który na razie jest jeszcze pusty

    for i in 1:n
        r[i] = s[n-i + 1]
    end 

    return r
end





    