function idft_fourier(X::ComplexF64)
    N = length(X)

    k = 0:(N-1)
    n = (0:(N-1))'

    W = exp.((2*im*pi*n*k)/N)

    W_f = W'

    return (X * W_f)/N
    
end





