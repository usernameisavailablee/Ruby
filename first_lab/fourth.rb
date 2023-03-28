
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



