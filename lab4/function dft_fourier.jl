function dft_fourier(x)
    N = length(x)

    k = 0:(N-1)
    n = (0:(N-1))'

    W = exp.((-2*im*pi*k*n)/N)

    return W * x

end


    