return function(LocalPath)
    local function Lerp(a,b,t)
        return a * (1-t) + b * t
    end
    return Lerp
end