puts("Hello world!")

username = ARGV[0]
 
  puts "Как тебя зовут?"
  puts "Привет, #{username} \nКакой твой любимый язык программирования?"
  answer = STDIN.gets.chop.downcase
  case answer
  when 'ruby'
    puts "Подлиза!"
  when 'python'
    puts "..."
  when 'c++'
    puts "Указатели твои эти ну вообще не впечатляют.."
  else
    puts 'Скоро будет Ruby!!!!'
  end

ruby = "puts 'Hello!'"
eval ruby

cmd = "ls"
system cmd

testasd