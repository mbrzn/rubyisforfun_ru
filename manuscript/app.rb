number=rand(1..1000000)
print 'Привет! Я загадал число от до 1000000, попробуйте угадать:'

loop do
  input=gets.to_i

  if input == number
    puts 'Правильно!'
    exit
  else
    if input > number
      print'Неправильно, искомое число меньше, попробуйте еще раз:'
    else
      print'Неправильно, искомое число больше, попробуйте еще раз:'
    end
  end
end
