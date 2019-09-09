require_relative "00_tree_node"

class KnightPathFinder 
    
    attr_reader :considered_positions, :start_pos, :root_node, :move_tree
    def self.valid_moves(pos)
        x, y = pos
        valid_positions = []
        if (0..7).include?(x + 2)
            valid_positions << [x + 2, y + 1] if (0..7).include?(y + 1)
            valid_positions << [x + 2, y - 1] if (0..7).include?(y - 1)
        end
        if (0..7).include?(x + 1)
            valid_positions << [x + 1, y + 2] if (0..7).include?(y + 2)
            valid_positions << [x + 1, y - 2] if (0..7).include?(y - 2)
        end
        if (0..7).include?(x - 2)
            valid_positions << [x - 2, y + 1] if (0..7).include?(y + 1)
            valid_positions << [x - 2, y - 1] if (0..7).include?(y - 1)
        end
        if (0..7).include?(x - 1)
            valid_positions << [x - 1, y + 2] if (0..7).include?(y + 2)
            valid_positions << [x - 1, y - 2] if (0..7).include?(y - 2)
        end
        valid_positions
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree
    end

    def new_move_positions(pos) # returns an array of considereted_position
        valid = KnightPathFinder.valid_moves(pos).reject {|p| @considered_positions.include?(p)}
        @considered_positions += valid
        valid
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            current_node = queue.shift
            positions = new_move_positions(current_node.value)
            positions.each {|pos| current_node.add_child(PolyTreeNode.new(pos))}
            queue += current_node.children
        end
    end


    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        node = end_node
        path = [node.value]
        
        while !node.parent.nil?
            path << node.parent.value
            node = node.parent
        end
        path.reverse
    end
    
end
a = KnightPathFinder.new([0,0])
p a.find_path([3,3])
p a.find_path([7, 6])
p a.find_path([6, 2])
