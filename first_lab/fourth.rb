
def local_min? (arr, index)
	if arr.min  < arr[index] then return false else return true end
end

def swap_min_max(arr)
	min_index = arr.index(arr.min)
	max_index = arr.index(arr.max)
	buff = arr[min_index]
	arr[min_index] = arr[max_index]
	arr[max_index] = buff
	return arr
end

def have_max_in_interval? (arr,a,b)
	arr.max == arr[a..b].max
end

def average_modules (arr)
	(arr.inject(0){ |sum, i| sum + i.abs }.to_f) / arr.size
end

a = [1,-2,3,4]
k = average_modules(a)
print k

