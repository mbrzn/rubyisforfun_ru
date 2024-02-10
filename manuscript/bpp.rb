# Программа игровых автоматов

@x; @y; @z

def rand_emoji
  emoji=rand(0..5)
  case emoji
  when 1; "♠"
  when 2; "♥"
  when 4; "♣"
  when 3; "♦"
  else    "☠"
  end
end

print 'Ваш возраст: '
age = gets.to_i
if age < 18
  puts 'Сожалеем, но вам нет 18'
  exit
end

def generator
  # Индикатор загрузки
  1.upto(2) do |i|
    print "Результат: / | /\r"; sleep 0.3
    print "Результат: - \\ -\r"; sleep 0.3
    print "Результат: \\ - \\\r"; sleep 0.3
    print "Результат: | / |\r"; sleep 0.3
  end
  @x = rand_emoji
  @y = rand_emoji
  @z = rand_emoji

  puts "Результат: #{@x} #{@y} #{@z}"
  sleep 0.8
end

balance = 10
loop do
  puts 'Нажмите Enter, чтобы дернуть ручку...'
  gets
  
  generator
  
  if @x == "☠" && @y == "☠" && @z == "☠"
    balance = 0
    puts 'Ваш баланс обнулен'
  elsif @x == "♠" && @y == "♠" && @z == "♠"
    balance += 10
    puts 'Баланс увеличился на 10 долларов'
  elsif @x == "♥" && @y == "♥" && @z == "♥"
    balance += 40
    puts 'Баланс увеличился на 20 долларов'
  elsif @x == "♣" && @y == "♣" && @z == "♣"
    balance += 20
    puts 'Баланс увеличился на 20 долларов'
  elsif @x == "♦" && @y == "♦" && @z == "♦"
    balance += 30
    puts 'Баланс увеличился на 20 долларов'
  else
    balance -= 0.5
    puts 'Баланс уменьшился на 50 центов'
  end

  puts "Ваш баланс: #{balance} долларов"  
end
