require_relative "00_tree_node"

class KnightPathFinder # 8x8
    # idx 0-7

    # x + 2, y + 1 # x + 1, y + 2
    # x + 2, y - 1 # x + 1, y - 2
    # x - 2, y + 1 # x - 1, y + 2
    # x - 2, y - 1 # x - 1, y - 2

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
        if (0..7).include?(x + 2)
            valid_positions << [x - 2, y + 1] if (0..7).include?(y + 1)
            valid_positions << [x - 2, y - 1] if (0..7).include?(y - 1)
        end
        if (0..7).include?(x - 1)
            valid_positions << [x - 1, y + 2] if (0..7).include?(y + 2)
            valid_positions << [x - 1, y - 2] if (0..7).include?(y - 2)
        end
        return true if valid_positions.include?(pos)
        false
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        # build_move_tree
        @considered_positions = [start_pos]
    end

    def new_move_positions(pos)
        if KnightPathFinder.valid_moves(pos) && !@considered_positions.includes?(pos)
            @considered_positions << pos
            return @considered_positions
        end
        nil
    end

    
end


    