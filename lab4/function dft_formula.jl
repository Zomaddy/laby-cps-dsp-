function dft_formula(x)

    N = length(x)
    sum = 0

    for n in 0:N-1
        for k in 0:N-1
            W = exp.((-2*im*pi*k*n)/N)
            sum = sum .+ (x * W)
        end
    end
    return sum
end

