using DatadogAgentClient
using Documenter

DocMeta.setdocmeta!(DatadogAgentClient, :DocTestSetup, :(using DatadogAgentClient); recursive=true)

makedocs(;
    modules=[DatadogAgentClient],
    authors="Manuel Weiss <manuel@weiss.io> and contributors",
    repo="https://github.com/ManuelWeiss/DatadogAgentClient.jl/blob/{commit}{path}#{line}",
    sitename="DatadogAgentClient.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://ManuelWeiss.github.io/DatadogAgentClient.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ManuelWeiss/DatadogAgentClient.jl",
    devbranch="main",
)
