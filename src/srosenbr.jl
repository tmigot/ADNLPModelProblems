function srosenbr_radnlp(; n::Int = 100, type::Val{T} = Val(Float64), kwargs...) where {T}
    n = 2 * max(1, div(n, 2))  # number of variables adjusted to be even
    function f(x)
        n = length(x)
        return sum(100 * (x[2*i] - x[2*i-1]^2)^2 + (x[2*i-1] - 1)^2 for i = 1:div(n, 2))
    end

    x0 = ones(T, n)
    x0[2*(collect(1:div(n, 2))).-1] .= -1.2

    return RADNLPModel(f, x0, name = "srosenbr_radnlp"; kwargs...)
end

function srosenbr_autodiff(;
    n::Int = 100,
    type::Val{T} = Val(Float64),
    kwargs...,
) where {T}
    n = 2 * max(1, div(n, 2))  # number of variables adjusted to be even
    function f(x)
        n = length(x)
        return sum(100 * (x[2*i] - x[2*i-1]^2)^2 + (x[2*i-1] - 1)^2 for i = 1:div(n, 2))
    end

    x0 = ones(T, n)
    x0[2*(collect(1:div(n, 2))).-1] .= -1.2

    return ADNLPModel(f, x0,  name = "srosenbr_autodiff"; kwargs...)
end
