# DatadogAgentClient

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://ManuelWeiss.github.io/DatadogAgentClient.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://ManuelWeiss.github.io/DatadogAgentClient.jl/dev/)
[![Build Status](https://github.com/ManuelWeiss/DatadogAgentClient.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ManuelWeiss/DatadogAgentClient.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/ManuelWeiss/DatadogAgentClient.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ManuelWeiss/DatadogAgentClient.jl)

This package provides a Julia client for the [Datadog Agent](https://docs.datadoghq.com/agent/). 
It supports sending the following metric types to Datadog:
- Increment/Decrement
- Count
- Gauge
- Timing
- Set
- Histogram
- Distribution

It does support tags.

Simple example:
```julia
using DatadogAgentClient

client = DatadogAgent("127.0.0.1", 8125) # default values, can be left out

increment(client, "visits")
DatadogAgentClient.count(client, "results", 123) # count is exported by `Base`, too
gauge(client, "open_connections", 42, ["region:us-east-1", "env:prod"]...)
timing(client, "query_time", 123.4, "region:us-east-1", "env:prod") # tags can be passed as varargs, too
```

