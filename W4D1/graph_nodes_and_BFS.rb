class GraphNode

    attr_reader :val, :neighbors

    def initialize(val)
        @val = val 
        @neighbors = []
    end

    def add_neighbors(neighbor) 
        self.neighbors.concat(neighbor)
    end

    def bfs(starting_node, target_value)
        queue = [starting_node]
        visited = []
        until queue.empty?
            node = queue.shift
            unless visited.include?(node)
                return node.val if node.val == target_value
                visited << node 
                queue += node.neighbors 
            end
        end
        return nil
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')

a.add_neighbors([b, c, e])
c.add_neighbors([b, d])
e.add_neighbors([a])
f.add_neighbors([e])

p a
p a.bfs(a, 'b')
p a.bfs(a, 'f')
p e.bfs(e, 'a')