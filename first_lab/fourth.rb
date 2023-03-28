
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

def new_list (arr)
	averange = (arr.inject(0){ |sum, i| sum + i }.to_i) / arr.size
	max = arr.max
	return Array.new(arr.length){|index| index = Random.rand(averange+1..max-1)}
end

a = [1,-2,3,4,100,-23,122]
k = new_list(a)
print k

