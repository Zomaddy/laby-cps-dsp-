using CairoMakie

function pulse_wave(t,p)
    T = 1

    return (mod(t,T) < p) ? 1 : 0

end

    t = range(0.0, 3.0, step = 0.01)
    p = 0.7

    pulse_wave.(t,p)
    lines(t, pulse_wave.(t,p))