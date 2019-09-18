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

def two_sum?(arr, target_sum)
  hash = {}
  arr.each do |num|
    diff = target_sum - num
    if hash[diff]
      return true
    else
      hash[num] = true
    end
  end
  false
end

def two_sum_with_idx(arr, target_sum)
  hash = {}
  res = []
  arr.each_with_index do |num, i|
    diff = target_sum - num
    if hash[diff]
      res << [hash[diff], i]
    else
      hash[num] = i
    end
  end
  res
end

def two_sum_indices(arr, target_sum)
  complements = {}
  arr.each_with_index do |el, i|
    complement, j = complements[target_sum - el] # these will both be nil if the complement doesn't exist
    return [i, j] if complement

    complements[el] = [el, i]
  end
  nil
end


# [0, 1, 5, 6] , 6 => [1, 2] [0, 3]
# complements = {0 => [0, 0], 1 => [1, 1]} 
# complement = 1
# j = 1


def four_sum?(arr, target_sum)
  
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false