using CairoMakie
function ramp_wave(t)
    A = 1
    T = 1
    c = 0
    a = 2

    return mod.(a .* (t .+ 0.5*T), 2A) .- A .+ c

end

    t = range(0.0, 3.0, step = 0.01)

    ramp_wave(t)
    lines(t,ramp_wave(t))


