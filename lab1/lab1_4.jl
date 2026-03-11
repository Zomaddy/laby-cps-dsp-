function prime_numbers(n)
    if (n<2)
        return 0
    end
    for i in 2:(sqrt(n))
        (n % i != 0) ? (return 1) : (return 0)
    end
    return 1
end


