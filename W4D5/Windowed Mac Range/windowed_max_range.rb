# Phase 1: Naive Solution
# O(n^2)
def windowed_max_range(arr, size)
    current_max_range = nil
    arr.each_with_index do |num, i|
        upper = i + size - 1
        if arr[upper] != nil
            window = arr[i..upper]
            diff = window.max - window.min 
            current_max_range = diff if current_max_range == nil || diff > current_max_range
        end
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8

# Optimized Solution
# Phase 2: MyQueue

class MyQueue
    def initialize
        @store = []
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(el)
        @store << el
    end

    def dequeue
        @store.shift
    end

    def peek
        @store.first
    end
end

# Phase 3: MyStack

class MyStack
    def initialize
        @store = []
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(el)
        @store.push(el)
    end

    def peek
        @store.last
    end
end

# Phase 4: StackQueue

class StackQueue 
    def initialize
        @store1 = MyStack.new
        @store2 = MyStack.new
    end

    def size
        @store1.size + @store2.size
    end

    def empty?
        @store1.empty? && @store2.empty?
    end

    def enqueue(el)
        @store1.push(el)
    end

    def dequeue
        if @store2.empty?
            @store2.push(@store1.pop) until @store1.empty?  
        end
        @store2.pop
    end
end

# Phase 5: MinMaxStack

