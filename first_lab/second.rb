number = ARGV[0].to_i
#Найти количество делителей числа, не делящихся на 3
count_numbers = 0
number.step(1,-1){
	|a|
	if ((number % a == 0) and (a % 3 != 0)) then count_numbers+=1 end
}
puts ("Колличество делителей не делящихся на 3: #{count_numbers}")

#Найти минимальную нечетную цифру числа.
minimum_odd_digit_of_number = 10
a = number
while (a!= 0 ) do
	if (minimum_odd_digit_of_number>(a%10) and a % 2 != 0) then minimum_odd_digit_of_number = a%10 end
	a = a/10
end
if minimum_odd_digit_of_number == 10 then puts("Минимальная цифра конечно есть, но она не четная...") else
	puts ("Минимальная нечетная цифра числа: #{minimum_odd_digit_of_number}") end

#Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа.

def coprime (a,b)
	flag = true
	a.step(2,-1){
		|w|
		if (a % w == 0 and b % w == 0) then flag = false end
	}
	return flag
end

def summ_digits (a)
	summ = 0
	while (a!=0) do
		summ += a%10
		a /=10  
	end
	return summ
end

def mult_digits (a)
	mult = 1
	while (a!=0) do
		mult *= a%10
		a /=10  
	end
	return mult
end

summ_digits_main_number = summ_digits(number)
mult_digits_main_number = mult_digits(number)
summ_for_third_task = 0

(2..number).each{
	|a|
	if number % a == 0 and coprime(a,summ_digits_main_number) == true and coprime(a,mult_digits_main_number) == false then
		summ_for_third_task += a end
}
puts ("сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: #{summ_for_third_task}")
