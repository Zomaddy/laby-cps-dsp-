function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.8355535581884107 - 0.5036400604745099im, 0.8355535581884107 + 0.5036400604745099im, 0.6756671011966945 - 0.5799530872937684im, 0.6756671011966945 + 0.5799530872937684im, 0.09267706472046934 - 0.5317035354050372im, 0.09267706472046934 + 0.5317035354050372im],
    k::Float64 = 0.20876931375485788,
)
    if all(abs.(p) .< 1.0)
        return 1.0
    else
        reurn -1.0
    end
end

wynik = rozwiazanie()
println(wynik)
