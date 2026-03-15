using CairoMakie
function triangular_wave(t)
    A = 1
    T = 1
    c = 0
    a = 4

    return A .* (1 - a .* abs.(mod(t ./ T + 0.25, A)-0.5)) .+ c

end

    t = range(0.0, 3.0, step = 0.01)

    triangular_wave.(t)
    lines(t, triangular_wave.(t))
