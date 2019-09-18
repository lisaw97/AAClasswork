class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num) 
    unless include?(num)
      num = num.hash
      self[num].push(num)
      @count += 1
    end
    resize! if @count >= num_buckets
  end

  def remove(num)
    if include?(num)
      num = num.hash
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    num = num.hash
    self[num].include?(num)
  end

  private

  def [](num)
    num = num.hash
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    num = num.hash
    @store += Array.new(num_buckets) { Array.new }
    @store.each_with_index do |bucket, i|
      bucket.each do |num|
        if num % num_buckets != i
          insert(num)
          bucket.delete(num)
          @count -= 1
        end
      end
    end
  end

end
