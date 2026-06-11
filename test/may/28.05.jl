function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.285962687071967 - 0.6869094151306008im, 1.9216478340820715 + 4.615979809506069im, 0.210092173744168 - 0.3118978162820004im, 0.210092173744168 + 0.3118978162820004im, 0.1907602022185668 - 0.0im],
    k::Float64 = 0.12351374019247903,
)
    if all(abs.(p) .< 1.0)
        return 1.0
    else
        return -1.0
    end
    
end

wynik = rozwiazanie()
println(wynik)

