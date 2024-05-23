using JuMP
using CPLEX
using CheckSolve

model = Model(CPLEX.Optimizer)
set_silent(model)
@variable(model, x >= 1, Int)
@variable(model, y >= 1, Int)
@variable(model, t >= 0)
e = exp(1)
@constraint(model, x - e*y >= -t)
@constraint(model, x - e*y <= t)
@objective(model, Min, t)
optimize!(model)
println("x: $(value(x))") #49170.99999499567
println("x int: $(isinteger(value(x)))") #false
println("y: $(value(y))") #18089.0
println("y int: $(isinteger(value(y)))") #true
println("t: $(value(t))") #0.0
println("e = x/y: $(e == value(x)/value(y))") #false
println("e rational: $(value(t) == 0)") #true
println("Check result: $(check_result(model))")
println(termination_status(model)) # OPTIMAL
println()


println("Parameters:")
println("\tCPXPARAM_MIP_Tolerances_Integrality = 0")
model = Model(CPLEX.Optimizer)
set_silent(model)
@variable(model, x >= 1, Int)
@variable(model, y >= 1, Int)
@variable(model, t >= 0)
e = exp(1)
@constraint(model, x - e*y >= -t)
@constraint(model, x - e*y <= t)
@objective(model, Min, t)
set_optimizer_attributes(model, "CPXPARAM_MIP_Tolerances_Integrality" => 0)
optimize!(model)
println("x: $(value(x))") #1.084483e6
println("x int: $(isinteger(value(x)))") #true
println("y: $(value(y))") #398959.0
println("y int: $(isinteger(value(y)))") #true
println("t: $(value(t))") #0.0
println("e = x/y: $(e == value(x)/value(y))") #false
println("e rational: $(value(t) == 0)") #true
println("Check result: $(check_result(model))")
println(termination_status(model)) # OPTIMAL
println()


println("Parameters:")
println("\tCPXPARAM_MIP_Tolerances_Integrality = 0")
println("\tCPXPARAM_Simplex_Tolerances_Feasibility = 1e-9")
model = Model(CPLEX.Optimizer)
set_silent(model)
@variable(model, x >= 1, Int)
@variable(model, y >= 1, Int)
@variable(model, t >= 0)
e = exp(1)
@constraint(model, x - e*y >= -t)
@constraint(model, x - e*y <= t)
@objective(model, Min, t)
set_optimizer_attributes(model, "CPXPARAM_MIP_Tolerances_Integrality" => 0)
set_optimizer_attributes(model, "CPXPARAM_Simplex_Tolerances_Feasibility" => 1e-9) # smallest possible value
optimize!(model)
println("x: $(value(x))") #1.084483e6
println("x int: $(isinteger(value(x)))") #true
println("y: $(value(y))") #398959.0
println("y int: $(isinteger(value(y)))") #true
println("t: $(value(t))") #1.9208528101444244e-7
println("e = x/y: $(e == value(x)/value(y))") #false
println("e rational: $(value(t) == 0)") #false
println("Check result: $(check_result(model))")
println(termination_status(model)) # OPTIMAL
println()


println("Parameters:")
println("\tCPXPARAM_MIP_Tolerances_Integrality = 0")
println("\tCPXPARAM_Simplex_Tolerances_Feasibility = 1e-9")
println("\tCPXPARAM_Simplex_Tolerances_Optimality = 1e-9")
model = Model(CPLEX.Optimizer)
set_silent(model)
@variable(model, x >= 1, Int)
@variable(model, y >= 1, Int)
@variable(model, t >= 0)
e = exp(1)
@constraint(model, x - e*y >= -t)
@constraint(model, x - e*y <= t)
@objective(model, Min, t)
set_optimizer_attributes(model, "CPXPARAM_MIP_Tolerances_Integrality" => 0)
set_optimizer_attributes(model, "CPXPARAM_Simplex_Tolerances_Feasibility" => 1e-9) # smallest possible value
set_optimizer_attributes(model, "CPXPARAM_Simplex_Tolerances_Optimality" => 1e-9) # smallest possible value
optimize!(model)
println("x: $(value(x))") #1.084483e6
println("x int: $(isinteger(value(x)))") #true
println("y: $(value(y))") #398959.0
println("y int: $(isinteger(value(y)))") #true
println("t: $(value(t))") #1.9208528101444244e-7
println("e = x/y: $(e == value(x)/value(y))") #false
println("e rational: $(value(t) == 0)") #false
println("Check result: $(check_result(model))") #0
println(termination_status(model)) # OPTIMAL
println()


println("Parameters:")
println("\tCPXPARAM_MIP_Tolerances_Integrality = 0")
println("\tCPXPARAM_Simplex_Tolerances_Feasibility = 1e-9")
println("\tCPXPARAM_Simplex_Tolerances_Optimality = 1e-9")
println("\tCPXPARAM_MIP_Tolerances_AbsMIPGap = 0")
model = Model(CPLEX.Optimizer)
set_silent(model)
@variable(model, x >= 1, Int)
@variable(model, y >= 1, Int)
@variable(model, t >= 0)
e = exp(1)
@constraint(model, x - e*y >= -t)
@constraint(model, x - e*y <= t)
@objective(model, Min, t)
set_optimizer_attributes(model, "CPXPARAM_MIP_Tolerances_Integrality" => 0)
set_optimizer_attributes(model, "CPXPARAM_Simplex_Tolerances_Feasibility" => 1e-9) # smallest possible value
set_optimizer_attributes(model, "CPXPARAM_Simplex_Tolerances_Optimality" => 1e-9) # smallest possible value
set_optimizer_attributes(model, "CPXPARAM_MIP_Tolerances_AbsMIPGap" => 0)
optimize!(model)
println("x: $(value(x))") #2.8245729e7
println("x int: $(isinteger(value(x)))") #true
println("y: $(value(y))") #1.0391023000000002e7
println("y int: $(isinteger(value(y)))") #false
println(abs(value(y) - round(value(y)))) #1.862645149230957e-9
println("t: $(value(t))") #0.0
println("e = x/y: $(e == value(x)/value(y))") #false
println("e rational: $(value(t) == 0)") #true
println("Check result: $(check_result(model))") #7.450580596923828e-9
println(termination_status(model)) # OPTIMAL
println()
