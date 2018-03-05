using FileIO, CSVFiles, DataFrames, CSV, BenchmarkTools, TextParse

df = DataFrame(package=String[],missing=Bool[],timing=Float64[])

t = @benchmark DataFrame(load("df_fileio.csv"))
push!(df, ("CSVFiles", false, time(minimum(t))/1e9))
t = @benchmark CSV.read("df_fileio.csv", weakrefstrings=true)
push!(df, ("CSV (weakrefstrings)", false, time(minimum(t))/1e9))
t = @benchmark CSV.read("df_fileio.csv", weakrefstrings=false)
push!(df, ("CSV", false, time(minimum(t))/1e9))
t = @benchmark csvread("df_fileio.csv")
push!(df, ("TextParse", false, time(minimum(t))/1e9))

t = @benchmark DataFrame(load("df_fileio2.csv"))
push!(df, ("CSVFiles", true, time(minimum(t))/1e9))
t = @benchmark CSV.read("df_fileio2.csv", weakrefstrings=true, null="NA")
push!(df, ("CSV (weakrefstrings)", true, time(minimum(t))/1e9))
t = @benchmark CSV.read("df_fileio2.csv", weakrefstrings=false, null="NA")
push!(df, ("CSV", true, time(minimum(t))/1e9))
t = @benchmark csvread("df_fileio2.csv")
push!(df, ("TextParse", true, time(minimum(t))/1e9))
