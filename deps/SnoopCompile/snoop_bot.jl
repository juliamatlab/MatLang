using SnoopCompile

botconfig = BotConfig(
  "MatLang";
  yml_path = "SnoopCompile.yml",
  blacklist = [],
)

snoop_bot(
  botconfig,
  "$(@__DIR__)/example_script.jl",
)
