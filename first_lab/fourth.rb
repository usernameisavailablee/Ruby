
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
	return arr.max == arr[a..b].max

end


a = [1,2,3,4]
k = have_max_in_interval?(a,1,2)
print k

#Дан целочисленный массив и интервал a..b. Необходимо проверить наличие максимального элемента массива в этом интервале.