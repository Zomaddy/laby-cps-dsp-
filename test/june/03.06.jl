function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[0.2058416896528308 - 0.9785853048155115im, 0.2058416896528308 + 0.9785853048155115im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.821011471251782 - 0.23914764168851735im, 0.821011471251782 + 0.23914764168851735im, 0.7152550203844386 - 0.0im],
    k::Float64 = 0.007998205033878386,
)
    if all(abs.(p) .< 1.0)
        return 1.0
    else
        return -1.0
    end
end

wynik = rozwiazanie()
println(wynik)
