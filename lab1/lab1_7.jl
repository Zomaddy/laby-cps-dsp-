function sierpinski_triangle(n)
    p = zeros(1,n)
    p[1] = 1.0
    for i in 2:n
        p[i] = (p[i-1]/4)*3
    end
    return p[n]
end




