function palindrom(s)
    n = length(s)
    
    for i in 1:div(n,2)
        (s[i] == s[n-i+1]) ? (return 1) : (return 0)
    end
end
