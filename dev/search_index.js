var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DatadogAgentClient","category":"page"},{"location":"#DatadogAgentClient","page":"Home","title":"DatadogAgentClient","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DatadogAgentClient.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [DatadogAgentClient]","category":"page"},{"location":"#DatadogAgentClient.DatadogAgent-Tuple{}","page":"Home","title":"DatadogAgentClient.DatadogAgent","text":"DatadogAgent(ip::String=\"127.0.0.1\", port=8125)\nDatadogAgent(ip::IPAddr, port)\n\nCreate a client to send metrics to a local Datadog agent at the given ip and port. Should be created only once and used for all metrics.\n\nExamples\n\njulia> client = DatadogAgent()\njulia> increment(client, \"visits\", \"test:true\", \"env:prod\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.count-Tuple{DatadogAgent, Any, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.count","text":"count(cl::DatadogAgent, metric, value, tags::String...)\n\nIncrement the counter metric by value, optionally with tags.\n\nExamples\n\njulia> count(DatadogAgent(), \"items_sold\", 42)\njulia> count(DatadogAgent(), \"items_sold\", 42, \"source:homepage\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.decrement-Tuple{DatadogAgent, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.decrement","text":"decrement(cl::DatadogAgent, metric, tags::String...)\n\nDecrement the counter metric by 1, optionally with tags.\n\nExamples\n\njulia> decrement(DatadogAgent(), \"available_seats\")\njulia> decrement(DatadogAgent(), \"available_seats\", \"env:prod\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.distribution-Tuple{DatadogAgent, Any, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.distribution","text":"distribution(cl::DatadogAgent, metric, value, tags::String...)\n\nAdds value to distribution metric, optionally with tags.\n\nExamples\n\njulia> distribution(DatadogAgent(), \"response_time\", 25)\njulia> distribution(DatadogAgent(), \"response_time\", 25, \"service:reporting\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.gauge-Tuple{DatadogAgent, Any, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.gauge","text":"gauge(cl::DatadogAgent, metric, value, tags::String...)\n\nSet the gauge metric to value, optionally with tags.\n\nExamples\n\njulia> gauge(DatadogAgent(), \"cpu_load\", 3.9)\njulia> gauge(DatadogAgent(), \"cpu_load\", 3.9, \"instance:dev\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.histogram-Tuple{DatadogAgent, Any, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.histogram","text":"histogram(cl::DatadogAgent, metric, value, tags::String...)\n\nAdds value to histogram metric, optionally with tags.\n\nExamples\n\njulia> histogram(DatadogAgent(), \"shopping_cart_size\", 5)\njulia> histogram(DatadogAgent(), \"shopping_cart_size\", 5, \"promotion:end_of_year\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.increment-Tuple{DatadogAgent, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.increment","text":"increment(cl::DatadogAgent, metric, tags::String...)\n\nIncrement the counter metric by 1, optionally with tags.\n\nExamples\n\njulia> increment(DatadogAgent(), \"visits\")\njulia> increment(DatadogAgent(), \"visits\", \"test:true\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.set-Tuple{DatadogAgent, Any, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.set","text":"set(cl::DatadogAgent, metric, value, tags::String...)\n\nAdds value to set metric, optionally with tags.\n\nExamples\n\njulia> set(DatadogAgent(), \"unique_user\", userId)\njulia> set(DatadogAgent(), \"unique_user\", userId, \"foo:bar\")\n\n\n\n\n\n","category":"method"},{"location":"#DatadogAgentClient.timing-Tuple{DatadogAgent, Any, Any, Vararg{String}}","page":"Home","title":"DatadogAgentClient.timing","text":"timing(cl::DatadogAgent, metric, value, tags::String...)\n\nSend a timing value for metric, optionally with tags.\n\nExamples\n\njulia> timing(DatadogAgent(), \"processing_time\", 23.5)\njulia> timing(DatadogAgent(), \"processing_time\", 23.5, \"foo:bar\")\n\n\n\n\n\n","category":"method"}]
}
