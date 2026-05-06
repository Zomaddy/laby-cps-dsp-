function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.6080990809343161 - 0.7300221773765752im, 0.45500421449826733 + 0.8263483309411619im, 0.6080990809343161 + 0.7300221773765752im, 0.45500421449826733 - 0.8263483309411619im, 0.5092740676609484 - 0.7360645315234412im, 0.5092740676609484 + 0.7360645315234412im],
    k::Float64 = 0.001079489822069313,
)
    if all(abs.(p) .< 1.0)      #warunek aby dyskretny system liniowy był stabilny to: wszystkie bieguny (p) transmitancji H(z) znajdowały się wewnątrz jednostkowego okręgu
                                #czyli |p| < 1
        return 1.0              #system stabilny

    else
        return -1.0             #system niestabilny
    end

end
