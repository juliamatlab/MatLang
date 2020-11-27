using CompileBot

botconfig = BotConfig(
  "MatLang";
  yml_path = "SnoopCompile.yml",
)

snoop_bot(
  botconfig,
  "$(@__DIR__)/example_script.jl",
)
