def bubble_sort(arr)
  arr.length.times do |x|
    switch = false
    for y in (0..(arr.length - 2))
      if arr[y] > arr[y+1]
        switch = true
        arr[y], arr[y+1] = arr[y+1], arr[y]
      end
      return arr if switch == false
    end
  end
  return arr
end

bubble_sort([9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 11, 12])