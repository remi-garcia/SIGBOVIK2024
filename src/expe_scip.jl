using JuMP
using SCIP

model = Model(SCIP.Optimizer)
set_silent(model)
@variable(model, x >= 1, Int)
@variable(model, y >= 1, Int)
@variable(model, t >= 0)
e = exp(1)
@constraint(model, x - e*y >= -t)
@constraint(model, x - e*y <= t)
@objective(model, Min, t)
optimize!(model) # error
