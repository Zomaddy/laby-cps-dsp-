using CairoMakie

function square_wave(t)
    A = 1
    T = 1
    c = 0

    return A .* sign.(sin.(2*pi .* t ./ T))
end

t = range(0.0, 3.0, step = 0.01)

    square_wave(t)
    lines(t, square_wave(t))
