function rozwiazanie(;
    z::Vector{ComplexF64} = ComplexF64[0.9553304732062662 + 0.29553965379199404im, 0.9553304732062662 - 0.29553965379199404im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.3505914002665185 + 0.5355253575778629im, 0.3505914002665185 - 0.5355253575778629im, 0.2826350808841338 + 0.0im],
    k::Float64 = 0.3461684097169351,
)
    if all(abs.(p) .< 1.0)
        return 1.0
    else
        return -1.0
    end
end

wynik = rozwiazanie()
println(wynik)
