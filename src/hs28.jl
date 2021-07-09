function hs28_autodiff(; n::Int = 100, type::Val{T} = Val(Float64), kwargs...) where {T}
    return ADNLPModel(
        x -> (x[1] + x[2])^2 + (x[2] + x[3])^2,
        [-4.0, 1.0, 1.0],
        x -> [x[1] + 2 * x[2] + 3 * x[3] - 1],
        [0.0],
        [0.0],
        name = "hs28_autodiff";
        kwargs...,
    )
end

hs28_meta = Dict(
    :nvar => 3,
    :variable_size => false,
    :ncon => 1,
    :variable_con_size => false,
    :nnzo => 3,
    :nnzh => 6,
    :nnzj => 3,
    :minimize => true,
    :name => "hs28",
    :optimal_value => NaN,
    :has_multiple_solution => missing,
    :is_infeasible => missing,
    :objtype => :other,
    :contype => :general,
    :origin => :unknown,
    :deriv => typemax(UInt8),
    :not_everywhere_defined => missing,
    :has_cvx_obj => false,
    :has_cvx_con => false,
    :has_equalities_only => true,
    :has_inequalities_only => false,
    :has_bounds => false,
    :has_fixed_variables => false,
    :cqs => 0,
)

get_hs28_meta(; n::Int=default_nvar) = (hs28_meta[:nvar], hs28_meta[:ncon])
