
class Graph
	
	def initialize
		@g = {}	 
		@nodes = Array.new		 
		@INFINITY = 1 << 64 	 
	end
		
	def add_edge(s,t,w) 		
		if (not @g.has_key?(s))	 
			@g[s] = {t=>w}		 
		else
			@g[s][t] = w         
		end
		

		
		if (not @g.has_key?(t))
			@g[t] = {s=>w}
		else
			@g[t][s] = w
		end

		if (not @nodes.include?(s))	
			@nodes << s
		end
		if (not @nodes.include?(t))
			@nodes << t
		end	
	end
	

	
	def dijkstra(s)
		@d = {}
		@prev = {}
		@nodes.each do |i|
			@d[i] = @INFINITY
			@prev[i] = -1
		end	
		@d[s] = 0
		q = @nodes.compact
		while (q.size > 0)
			u = nil;
			q.each do |min|
				if (not u) or (@d[min] and @d[min] < @d[u])
					u = min
				end
			end
			if (@d[u] == @INFINITY)
				break
			end
			q = q - [u]
			@g[u].keys.each do |v|
				alt = @d[u] + @g[u][v]
				if (alt < @d[v])
					@d[v] = alt
					@prev[v]  = u
				end
			end
		end
	end
	
	
	def print_path(dest)
		if @prev[dest] != -1
			print_path @prev[dest]
		end
		print ">#{dest}"
	end
	
	
	
	def shortest_paths(s)
		@source = s
		dijkstra s
		puts "Source: #{@source}"
		@nodes.each do |dest|
			puts "\nTarget: #{dest}"
			print_path dest
			if @d[dest] != @INFINITY
				puts "\nDistance: #{@d[dest]}"
			else
				puts "\nNO PATH"
			end
		end
	end
end
if __FILE__ == $0
	gr = Graph.new
	gr.add_edge("a","b",5)
	gr.add_edge("b","c",3)
	gr.add_edge("c","d",1)
	gr.add_edge("a","d",10)
	gr.add_edge("b","d",2)
	gr.add_edge("f","g",1)
	gr.shortest_paths("a")
end
