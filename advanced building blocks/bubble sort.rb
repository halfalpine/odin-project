def bubble_sort(arr)
  arr.length.times do 
    first = 0
    second = 1
    while second < arr.length
      if arr[first] > arr[second]
        arr[first], arr[second] = arr[second], arr[first]
        switch = true
      end
      first +=1
      second += 1
    end
  end
  arr
end


puts bubble_sort([4,3,78,2,0,2])