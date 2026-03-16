function power(x)
    N = length(x)

    energy = sum(abs2, x)

    return (energy/N)

end
