function rms(x)
    N = length(x)

    energy = sum(abs2,x)
    power = energy/N

    return sqrt(power)

end
