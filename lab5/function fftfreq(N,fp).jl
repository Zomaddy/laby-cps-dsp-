function fftfreq(N,fp)
    delta_f = fp/N
    f = zeros(N)

    if N % 2 == 0 
        for k in 0:N-1
            if k <= (N-1)/2
                f[k+1] = k*delta_f
            else
                f[k+1] = (k-N)*delta_f
            end
        end
    end


    return f

end

