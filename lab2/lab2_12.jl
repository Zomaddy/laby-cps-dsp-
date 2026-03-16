function mean(x)
    N = length(x)
    total_sum = 0

    if N == 0
        error("Can't divide by 0!")
    end

    for n in 1:N
        total_sum = total_sum + x[n]
    end

    return total_sum/N

end
