function liarwhd_autodiff(; n::Int = 100, type::Val{T} = Val(Float64), kwargs...) where {T}
    n ≥ 2 || error("liarwhd : n ≥ 2")
    function f(x)
        n = length(x)
        return sum(4.0 * (x[i]^2 - x[1])^2 + (x[i] - 1)^2 for i = 1:n)
    end
    x0 = ones(T, n)
    return ADNLPModel(f, x0, name = "liarwhd_autodiff"; kwargs...)
end

liarwhd_meta = Dict(
    :nvar => 100,
    :variable_size => false,
    :ncon => 0,
    :variable_con_size => false,
    :nnzo => 100,
    :nnzh => 5050,
    :nnzj => 0,
    :minimize => true,
    :name => "liarwhd",
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

get_liarwhd_meta(; n::Int=default_nvar) = (liarwhd_meta[:nvar], liarwhd_meta[:ncon])
