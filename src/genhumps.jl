function genhumps_radnlp(; n::Int = 100, type::Val{T} = Val(Float64), kwargs...) where {T}
    function f(x)
        n = length(x)
        ζ = 20
        return sum(
            (sin(ζ * x[i])^2 * sin(ζ * x[i+1])^2 + (x[i]^2 + x[i+1]^2) / ζ) for i = 1:n-1
        )
    end

    x0 = -506.2 * ones(T, n)
    x0[1] = -506
    return RADNLPModel(f, x0, name = "genhumps_radnlp"; kwargs...)
end

function genhumps_autodiff(; n::Int = 100, type::Val{T} = Val(Float64), kwargs...) where {T}
    function f(x)
        n = length(x)
        ζ = 20
        return sum(
            (sin(ζ * x[i])^2 * sin(ζ * x[i+1])^2 + (x[i]^2 + x[i+1]^2) / ζ) for i = 1:n-1
        )
    end

    x0 = -506.2 * ones(T, n)
    x0[1] = -506
    return ADNLPModel(f, x0, name = "genhumps_autodiff"; kwargs...)
end

genhumps_meta = Dict(
    :nvar => 100,
    :variable_size => false,
    :ncon => 0,
    :variable_con_size => false,
    :nnzo => 100,
    :nnzh => 5050,
    :nnzj => 0,
    :minimize => true,
    :name => "genhumps",
    :optimal_value => NaN,
    :has_multiple_solution => missing,
    :is_infeasible => false,
    :objtype => :other,
    :contype => :unconstrained,
    :origin => :unknown,
    :deriv => typemax(UInt8),
    :not_everywhere_defined => missing,
    :has_cvx_obj => false,
    :has_cvx_con => false,
    :has_equalities_only => false,
    :has_inequalities_only => false,
    :has_bounds => false,
    :has_fixed_variables => false,
    :cqs => 0,
)
