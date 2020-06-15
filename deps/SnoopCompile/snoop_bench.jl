using SnoopCompile

botconfig = BotConfig(
  "MatLang";
  yml_path = "SnoopCompile.yml",
  blacklist = [],
)

println("Benchmarking the inference time of `using MatLang`")
snoop_bench(
  botconfig,
  :(using MatLang),
)


println("Benchmarking the inference time of `using MatLang` and runtests")
snoop_bench(
  botconfig,
  "$(@__DIR__)/example_script.jl",
)
