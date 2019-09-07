class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        old = @parent
        @parent = parent
        
        if parent != nil && !@parent.children.include?(self)
            @parent.children << self
            old.children.delete_at(old.children.index(self)) if old != nil && old.children.include?(self)
        end
         
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Node is not a child" if child_node.parent == nil
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value
        @children.each do |child|
            res = child.dfs(target_value)
            return res if !res.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            node = queue.shift
            return node if node.value == target_value
            node.children.each { |child| queue << child}
        end
        nil
    end

end