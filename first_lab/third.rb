
def min_in_array (a)
	min = 101
	for iterator in a do
		if iterator < min then min = iterator end
	end
	return min
end

def number_first_positive (a)
	iterator = 0
	while iterator != a.length do
		if a[iterator] >= 0 then return iterator end
		iterator +=1	
	end
	return false
end
puts "Сколько изволите элементов в массиве???"
amount_of_array_elements = STDIN.gets.to_i
numbers = amount_of_array_elements.times.map{ Random.rand(-100..100) }


if number_first_positive(numbers) != false then puts ("Индекс первого положительного элемента:#{number_first_positive(numbers)}") else puts("Чет массив какой-то негативный(((") end
puts ("Минимальный элемент в массиве: #{(min_in_array(numbers))}")


if File.exist?(ARGV[1]) 

	file = File.new(ARGV[1],"r:UTF-8")
	array_into_file = file.readlines
	array_into_file = array_into_file.map(&:to_i)

	if ARGV[0] == '2' then if number_first_positive(array_into_file) != false then 
		puts ("Индекс первого положительного элемента из файла:#{number_first_positive(array_into_file)}") else puts("Чет массив из файла какой-то негативный(((") end end

	if ARGV[0] == '1' then puts ("Минимальный элемент в массиве из файла: #{(min_in_array(array_into_file))}") end

	if ARGV[0] == '2' or ARGV[0] == '1' then else puts ("Третьего не дано, лол(в аргумент стоит передать номер метода. 1 - Минимальный элемент 2 - Индекс первого положительного элемента") end
else
  puts "Путь стоит перепроверить"
end
