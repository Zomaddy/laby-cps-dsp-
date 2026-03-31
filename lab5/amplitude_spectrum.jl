function amplitude_spectrum(x,w)
    N = length(x)
    A = zeros(N)

    sum_w = sum(w)

    for k in 0:N-1
        Xk = 0.0 + 0.0im
        for n in 0:N-1
            Xk += x[n+1] *exp(-2im*pi*k*n/N)
        end
        A[k+1] = abs(Xk)/sum_w
    end
    
    return A
end
