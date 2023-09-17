module DatadogAgentClient

export increment, decrement, count, gauge, timing, set, histogram, distribution, DatadogAgent

using Sockets

struct DatadogAgent
    agent_address::IPAddr
    agent_port::Int
    send_msg::Function
    DatadogAgent(ip::IPAddr, port) = new(ip, port, _make_send(ip, port))
end

"""
    DatadogAgent(ip::String="127.0.0.1", port=8125)
    DatadogAgent(ip::IPAddr, port)

Create a client to send metrics to a local Datadog agent at the given `ip` and `port`.
Should be created only once and used for all metrics.

# Examples
```julia-repl
julia> client = DatadogAgent()
julia> increment(client, "visits", "test:true", "env:prod")
```
"""
DatadogAgent() = DatadogAgent("127.0.0.1", 8125)
DatadogAgent(ip::String, port=8125) = DatadogAgent(getaddrinfo(ip), port)

import Base.show
show(io::IO, client::DatadogAgent) = print(io, string("Datadog Agent: ", client.agent_address, ":", client.agent_port))

function _make_send(ip, port)
    sock = UDPSocket()
    function _send(metrics::String, tags...)
        tagString = if isempty(tags) "" else string("|#", join(tags, ",")) end
        data = string(metrics, tagString)
        send(sock, ip, port, data)
    end
end

"""
    increment(cl::DatadogAgent, metric, tags::String...)

Increment the counter `metric` by 1, optionally with tags.

# Examples
```julia-repl
julia> increment(DatadogAgent(), "visits")
julia> increment(DatadogAgent(), "visits", "test:true")
```
"""
increment(cl::DatadogAgent, metric, tags::String...) = count(cl, metric, 1, tags...)

"""
    decrement(cl::DatadogAgent, metric, tags::String...)

Decrement the counter `metric` by 1, optionally with tags.

# Examples
```julia-repl
julia> decrement(DatadogAgent(), "available_seats")
julia> decrement(DatadogAgent(), "available_seats", "env:prod")
```
"""
decrement(cl::DatadogAgent, metric, tags::String...) = count(cl, metric, -1, tags...)

"""
    count(cl::DatadogAgent, metric, value, tags::String...)

Increment the counter `metric` by `value`, optionally with tags.

# Examples
```julia-repl
julia> count(DatadogAgent(), "items_sold", 42)
julia> count(DatadogAgent(), "items_sold", 42, "source:homepage")
```
"""
count(cl::DatadogAgent, metric, value, tags::String...) = cl.send_msg(string(metric, ":", value, "|c"), tags...)

"""
    timing(cl::DatadogAgent, metric, value, tags::String...)

Send a timing `value` for `metric`, optionally with tags.

# Examples
```julia-repl
julia> timing(DatadogAgent(), "processing_time", 23.5)
julia> timing(DatadogAgent(), "processing_time", 23.5, "foo:bar")
```
"""
timing(cl::DatadogAgent, metric, value, tags::String...) = cl.send_msg(string(metric, ":", value, "|ms"), tags...)

"""
    gauge(cl::DatadogAgent, metric, value, tags::String...)

Set the gauge `metric` to `value`, optionally with tags.

# Examples
```julia-repl
julia> gauge(DatadogAgent(), "cpu_load", 3.9)
julia> gauge(DatadogAgent(), "cpu_load", 3.9, "instance:dev")
```
"""
gauge(cl::DatadogAgent, metric, value, tags::String...) = cl.send_msg(string(metric, ":", value, "|g"), tags...)

"""
    set(cl::DatadogAgent, metric, value, tags::String...)

Adds `value` to set `metric`, optionally with tags.

# Examples
```julia-repl
julia> set(DatadogAgent(), "unique_user", userId)
julia> set(DatadogAgent(), "unique_user", userId, "foo:bar")
```
"""
set(cl::DatadogAgent, metric, value, tags::String...) = cl.send_msg(string(metric, ":", value, "|s"), tags...)

"""
    histogram(cl::DatadogAgent, metric, value, tags::String...)

Adds `value` to histogram `metric`, optionally with tags.

# Examples
```julia-repl
julia> histogram(DatadogAgent(), "shopping_cart_size", 5)
julia> histogram(DatadogAgent(), "shopping_cart_size", 5, "promotion:end_of_year")
```
"""
histogram(cl::DatadogAgent, metric, value, tags::String...) = cl.send_msg(string(metric, ":", value, "|h"), tags...)

"""
    distribution(cl::DatadogAgent, metric, value, tags::String...)

Adds `value` to distribution `metric`, optionally with tags.

# Examples
```julia-repl
julia> distribution(DatadogAgent(), "response_time", 25)
julia> distribution(DatadogAgent(), "response_time", 25, "service:reporting")
```
"""
distribution(cl::DatadogAgent, metric, value, tags::String...) = cl.send_msg(string(metric, ":", value, "|d"), tags...)

end
