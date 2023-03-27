digit = ARGV[0].to_i

count_digits = 0
digit.step(1,-1){
	|a|
	if ((digit % a == 0) and (a % 3 != 0)) then count_digits+=1 end
}
puts ("Колличество делителей не делящихся на 3: #{count_digits}")

#Найти минимальную нечетную цифру числа.
minimum_odd_digit_of_numbers = 10
a = digit
while (a!= 0 ) do
	if (minimum_odd_digit_of_numbers>(a%10) and a % 2 != 0) then minimum_odd_digit_of_numbers = a%10 end
	a = a/10
end
if minimum_odd_digit_of_numbers == 10 then puts("Минимальная цифра конечно есть, но она не четная...") else
	puts ("Минимальная нечетная цифра числа: #{minimum_odd_digit_of_numbers}") end