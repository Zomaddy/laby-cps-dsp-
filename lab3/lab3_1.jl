L2 = [1.0, 0.0, -1.0]


function quantize(L)
    return x -> begin
    l = argmin(abs2.(x .- L))
    return L[l]
end
end

fl = quantize(L2)

fl(3.1)








    


