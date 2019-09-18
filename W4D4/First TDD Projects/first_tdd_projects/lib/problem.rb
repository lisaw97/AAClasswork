class Array
  def my_unique
    res = Hash.new(0)
    self.each do |el|
      res[el] += 1
    end
    res.keys
  end

  def two_sum
  
    result = []

    self.each_with_index do |el,i|
      self.each_with_index do |el2,j| 
        result << [i,j] if el + el2 == 0 && i < j
      end
    end
    result
  end

  def my_transpose
    self.transpose
  end

  def stock_picker
    synergy_idx = []
    max = 0
    self.each_with_index do |el, i|
      self.each_with_index do |el1, j|
        if (max == 0 || (el1 - el) > max) && j > i
          max = el1 - el
          synergy_idx = [i, j]
        end
      end
    end
    synergy_idx
  end

  

end