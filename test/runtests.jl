using DatadogAgentClient
using Test
using Sockets

@testset "jl" begin

# test server
function setup_DatadogAgent()
    svr = UDPSocket()
    if bind(svr, ip"127.0.0.1", 2376)
        # configure client with server address
        client = DatadogAgent("127.0.0.1", 2376)
        (svr, client)
    else
        println(stderr, "Error binding to port 2376")
    end
end

c = Condition()
function test_DatadogAgent(svr, expected)
    @async begin
        data = String(copy(recv(svr)))
        println("expected: ", expected, ", received: ", data)
        @test data == expected
        notify(c)
    end
end

function test_increment()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.increment:1|c")
    increment(client, "test.increment")
    wait(c)
    close(svr)
    true
end

function test_increment_tags()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.increment:1|c|#test:true,test2:false")
    increment(client, "test.increment", "test:true", "test2:false")
    wait(c)
    close(svr)
    true
end

function test_increment_tags2()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.increment:1|c|#test:true,test2:true")
    increment(client, "test.increment", ["test:true", "test2:true"]...)
    wait(c)
    close(svr)
    true
end

function test_decrement()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.decrement:-1|c")
    decrement(client, "test.decrement")
    wait(c)
    close(svr)
    true
end

function test_count()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.count:412|c")
    DatadogAgentClient.count(client, "test.count", 412)
    wait(c)
    close(svr)
    true
end

function test_timing()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.timing:38.5|ms")
    timing(client, "test.timing", 38.5)
    wait(c)
    close(svr)
    true
end

function test_gauge()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.gauge:123|g")
    gauge(client, "test.gauge", 123)
    wait(c)
    close(svr)
    true
end

function test_set()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.set:7623|s")
    set(client, "test.set", "7623")
    wait(c)
    close(svr)
    true
end

function test_histogram()
    svr, client = setup_DatadogAgent()
    test_DatadogAgent(svr, "test.histogram:345|h")
    histogram(client, "test.histogram", "345")
    wait(c)
    close(svr)
    true
end

@test test_increment()
@test test_increment_tags()
@test test_increment_tags2()
@test test_decrement()
@test test_count()
@test test_timing()
@test test_gauge()
@test test_set()
@test test_histogram()

end
