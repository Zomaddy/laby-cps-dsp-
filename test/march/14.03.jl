function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.9991904439068744 - 0.00303656209555583im, 0.75223049232341 + 0.4452077715025346im, 0.9991904439068744 + 0.00303656209555583im, 0.75223049232341 - 0.4452077715025346im, 0.9977787856167044 - 0.0022413392147192447im, 2.753071250455457 + 1.1918887070174058im, 0.9977787856167044 + 0.0022413392147192447im, 0.6254521756322542 - 0.27077736720116613im, 0.9969401674520317 - 0.0008278978507922177im, 0.5703907134763745 + 0.09031530203021945im, 0.9969401674520317 + 0.0008278978507922177im, 0.5703907134763745 - 0.09031530203021945im],
    k::Float64 = 0.00016596727909431446,
)

    if all(abs.(p) .< 1.0)      #warunek aby dyskretny system liniowy był stabilny to: wszystkie bieguny (p) transmitancji H(z) muszą znajdować się wewnątrz jednostkowego okręgu
                                #czyli |p| < 1
        
        return 1.0              #system stabilny

    else

        return -1.0             #system niestabilny

    end

end

wynik = rozwiazanie()
println(wynik)


    
