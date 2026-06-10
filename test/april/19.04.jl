function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.16754786621527892 - 0.565129947645677im, 1.421236677730713 + 4.7937549275982985im, 0.12632937844610825 - 0.0im],
    k::Float64 = 0.23688676182270338,
)
    if all(abs.(p) .< 1.0)
        return 1.0
    else
        return -1.0
    end
end

wynik = rozwiazanie()
println(wynik)
