function powellsg_radnlp(; n::Int = 100, type::Val{T} = Val(Float64), kwargs...) where {T}
    n = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
    function f(x)
        n = length(x)
        return sum(
            -(1 / (1 + (x[i] - x[i+1])^2)) - sin((π * x[i+1] + x[i+2]) / 2) -
            exp(-((x[i] + x[i+2]) / x[i+1] - 2)^2) for i = 1:n-2
        )
    end
    x0 = 3 * ones(T, n)
    return RADNLPModel(f, x0, name = "powellsg_radnlp"; kwargs...)
end

function powellsg_autodiff(;
    n::Int = 100,
    type::Val{T} = Val(Float64),
    kwargs...,
) where {T}
    n = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
    function f(x)
        n = length(x)
        return sum(
            -(1 / (1 + (x[i] - x[i+1])^2)) - sin((π * x[i+1] + x[i+2]) / 2) -
            exp(-((x[i] + x[i+2]) / x[i+1] - 2)^2) for i = 1:n-2
        )
    end
    x0 = 3 * ones(T, n)
    return ADNLPModel(f, x0,  name = "powellsg_autodiff"; kwargs...)
end
