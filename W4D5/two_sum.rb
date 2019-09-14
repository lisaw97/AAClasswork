def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |ele, i|
    arr.each_with_index do |ele2, j|
      return true if ele + ele2 == target_sum && i < j
    end
  end
  false
end


def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  (0...sorted.length).each do |i|
    return true if b_search(sorted[i + 1..-1], target_sum - sorted[i])
  end
  false
end

def b_search(arr, target_sum)
  return false if arr.length < 1
  mid = arr.length / 2
  left = arr.take(mid)
  right = arr.drop(mid + 1)
  case arr[mid] <=> target_sum
  when 0
    return true
  when 1
    b_search(left, target_sum)
  when -1
    b_search(right, target_sum)
  end
end

def three_two_sum?(arr, target_sum)

end


def four_two_sum?(arr, target_sum)
  
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false