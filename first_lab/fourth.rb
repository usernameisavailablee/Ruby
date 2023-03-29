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

puts ("Введите номер метотода где: \n 1 - Проверка на локальный минимум по индексу \n 2 - Поменять минимум и максимум \n 3 - Проверка максимума на интервале (a..b) \n 4 - Сумма модулей структуры \n 5 - Создание нового списка ограниченного средним арифметическим и максимумом")

answer = STDIN.gets.chop.downcase
  case answer
  when '1'
  	puts ('Окей, проверяем. Локален ли минимум?')
  	puts ("Введите колличество элементов, затем массив")
  	n = STDIN.gets.to_i
  	arr = Array.new(n){|index| index = STDIN.gets.to_i}

  	puts ("Введите индекс, для определения локального минимума")
  	indx = STDIN.gets.to_i

  	puts "Ответ: #{local_min?(arr,indx)}"
    
  when '2'
  	puts ('Окей, меняем местами минимум и максимум')
    puts ("Введите колличество элементов, затем массив")
    n = STDIN.gets.to_i
    arr = Array.new(n){|index| index = STDIN.gets.to_i}

    puts "Итог: #{swap_min_max(arr)}"

  when '3'
  	puts ('Окей, проверяем. Есть ли максимум на интервале?')
    puts ("Введите колличество элементов, затем массив")
    n = STDIN.gets.to_i	
    arr = Array.new(n){|index| index = STDIN.gets.to_i}

    puts "Введите интервал(два числа, a,b)"
    a = STDIN.gets.to_i
    b = STDIN.gets.to_i

    puts "Ответ: #{have_max_in_interval?(arr,a,b)}"

  when '4'
  	puts ('Окей, сумма модулей структуры.')
  	puts ("Введите колличество элементов, затем массив")
    n = STDIN.gets.to_i	
    arr = Array.new(n){|index| index = STDIN.gets.to_i}

    puts ("Среднее арифметическое модулей: #{average_modules(arr)}")

  when '5'
  	puts ('Окей, создадим новый список с элементами меньше максимума, но больше среднего арифметического')
  	puts ("Введите колличество элементов, затем массив")
    n = STDIN.gets.to_i	
    arr = Array.new(n){|index| index = STDIN.gets.to_i}

    puts ("Новый список: #{new_list(arr)}")

  else
    puts ("sad")
  end

