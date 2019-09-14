# my_min
# phase 1 - o(n^2)
def my_min(list)
  res = nil
  list.each_with_index do |el, i|
    res = el
    list.each_with_index do |el1, j|
      res = nil if el > el1 && j > i
    end
    return res if res != nil
  end
  res
end

# phase 2 - o(n)
def my_min_2(list)
  res = list[0]
  (0...list.length - 1).each do |i|
    if list[i] < list[i+1] && list[i] < res
      res = list[i]
    end 
  end
  res
end

# phase 1 - o(n^3)
def big_cont_subsum(list)
  max_sum = list[0]
  list.each_with_index do |ele, i|
    list.each_with_index do |ele2, j|
      max_sum = list[i..j].sum if list[i..j].sum > max_sum && j >= i
    end
  end
  max_sum
end

# phase 2 - o(n)
def big_cont_subsum2(list)
  curr_sum = 0
  max_sum = list[0]
  list.each do |num|
    curr_sum += num
    if max_sum < curr_sum
      max_sum = curr_sum
    end
    if curr_sum < 0
      curr_sum = 0
    end
  end
  max_sum
end