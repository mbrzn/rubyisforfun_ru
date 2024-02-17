# Роботы, собаки и человек
#
# классы конкретные и классы абстрактные связаны наследованием
# наследованием не смысловым, сущностным, а материальным -
# абстрактный класс предоставляет унифицированные шестиренки и
# болты лего для произвольных композиций
#
# Класс Player
#
class Player
  # Акцессоры — чтобы можно было узнать координаты снаружи
  attr_accessor :x, :y

  # Конструктор, принимает хеш. Если не задан — будет пустой хеш.
  # В хеше мы ожидаем два параметра — начальные координаты робота,
  # если не заданы, будут по умолчанию равны нулю.
  def initialize(options={})
    @x = options[:x] || 0
    @y = options[:y] || 0
  end

  def right
    self.x += 1
  end

  def left
    self.x -= 1
  end

  def up
    self.y += 1
  end

  def down
    self.y -= 1
  end
  
  def label
    "#"
  end

end
# Класс робота
class Robot < Player

  def label
    "*"
  end

end

# Класс Собаки 
class Dog < Player

  def left
  end

  def up
  end

  def label
    "@"
  end
end

# Класс «Командир», который будет командовать и двигать роботов
class Commander
  # Дать команду на движение робота. Метод принимает объект
  # и посылает (send) ему случайную команду.
  def move(who)
    m = [:right, :left, :up, :down].sample
    who.send(m)
  end
end

# Создать объект командира,
# командир в этом варианте программы будет один
commander = Commander.new

# Массив из 10 роботов
arr = Array.new(10) { Robot.new }
1.upto(4) { |i| arr.push(Dog.new(x: -12, y: 12)) }

# В бесконечном цикле (для остановки программы нажмите ^C)
loop do
  # Хитрый способ очистить экран
  puts "\e[H\e[2J"

  # Рисуем воображаемую сетку. Сетка начинается от -12 до 12 по X
  # и от 12 до -12 по Y
  (12).downto(-12) do |y|
    (-12).upto(12) do |x|
      # Проверяем, есть ли у нас в массиве робот с координатами x и y
      found = arr.find { |somebody| somebody.x == x && somebody.y == y }

      # Если найден, рисуем звездочку, иначе точку
      if found
        print found.label
      else
        print '.'
      end
    end

    # Просто переводим строку:
    puts
  end

  # Проверка столкновения. Если есть два объекта с одинаковыми
  # координатами и их «label» не равны, то, значит, робот поймал собаку.
  game_over = arr.combination(2).any? do |a, b|
    a.x == b.x && \
    a.y == b.y && \
    a.label != b.label
  end

  if game_over
    puts 'Game over'
    exit
  end

  # Проверка удачного прохода всех собак
  # Если все четыре собаки пересекли финишныe линии
  game_win = arr.combination(4).any? do |a, b, c, d|
    (a.x >= 12 || a.y <= -12) && a.label == "@" && \
    (b.x >= 12 || b.y <= -12) && b.label == "@" && \
    (c.x >= 12 || c.y <= -12) && c.label == "@" && \
    (d.x >= 12 || d.y <= -12) && d.label == "@" 
  end
  if game_win
    puts "Win!"
    exit
  end 

  # Каждый объект двигается в случайном направлении
  arr.each do |somebody|
    commander.move(somebody)
  end

  # Задержка в полсекунды
  sleep 0.5
end
