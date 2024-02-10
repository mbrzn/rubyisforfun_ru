# Маятник
#
#  1. Стела летит то в одну сторону
#  2. то в другугую
#  А. Начало движения может быть слева,
#  Б. а может и справа.
#
# Создать два взвода роботов
#
green = Array.new(10,1)
red = Array.new(10,1)

# Определить метод стрельбы
#
def shoot_at( target_arr, \
              l_name, l_health, l_count, \
              r_name, r_health, r_count,
              to_right )
  target = rand(0..9)
  shoot_bar(  l_name, l_health, l_count, \
              r_name, r_health, r_count,\
              to_right )
  if target_arr[ target ] != 0
    target_arr[target] = 0 
    puts "\n  есть попадание на позиции #{target} !"
  else
    puts "\n  промах..."
  end
end
# Определить метод счета действующих роботов
#
def count(arr)
  return arr.count { |element| element != 0 } 
end

def missile
  # тип снарядa
  missile = [ ">", "#","☠","⚕️","✈️","➡️","♂️","♀️","☀","♦","✉","✏","✒"\
              ,"✂","⚒","☢","↗","➡","↘","⬇","↙","⬅","↖","↕","↔","↩"\
              ,"↪","⚛","🕉","✡","☸","☯","✝","☦","☪","☮","▶","◀","✖"\
              ,"◻","▪","▫","☠️" ]
  return missile[ rand(1..missile.length) - 1 ]
end

def shoot_bar(l_name, l_health, l_count, \
              r_name, r_health, r_count, \
              to_right )
  # расчет длины поля левых
  l_health = "100%"                       # здоровье
  l_position = l_name.to_s + " #{l_count.to_s}u " +\
                "#{l_health.to_s}h"
  # ... и правых
  r_health = "100%"                       # здоровье
  r_position = r_name.to_s + " #{r_count.to_s}u " +\
                "#{r_health.to_s}h"
  # расчет дистанции стрельбы
  distance = 80 - ( l_position.size + r_position.size )
  miss_ile = missile                      # тип снаряда

  # полет снаряда
  1.upto(distance) do |i|
    fire = i                              # пламя снаряда
    air = distance - i + 2                # снаряд на два символа

    # атом движения, застывшее мгновение
    case to_right
    when true                             # справа на лево 
      print "#{l_position}" + \
            "="*i + "#{miss_ile}" + ">" + " "*air + \
            "#{r_position}" + "\r"
      sleep rand (0.05..0.09)               # трение переменчиво
    else
      print "#{l_position}" + \
          " "*air + "<" + "#{miss_ile}" + "="*i + \
          "#{r_position}" + "\r"
      sleep rand (0.05..0.09)               # трение переменчиво
    end
  end
end

# Вести войну
#
# Идеальный алгоритм
#
# 0. Определения игры
# 0.1 Размер взвода, одинаков для каждой из сторон
# 0.2 Названия команд, индивидуальные
# 0.3 Здоровье робота: биты или байты? 
#
# 1. жеребьевка первого выстрела
# 2. вызов процедуры 
# 2.1 выстрел
# 2.2 подсчет потерь
# 2.3 вывод о победе
# 2.4 передача хода противнику, п. 2
#
#
loop do
  # Красные слева
  puts " "*28 + "Красные атакуют"
  shoot_at( green, \
              "Красные", 1 , count(red) , \
              "Зеленые", 1 , count(green), \
              true )
  sleep rand(0.5..0.9)
  if  count(green) == 0 
    puts "-"*20 + "\n" + "Конец зеленым!"
    exit
  else 
    # Зеленые справа
    puts " "*28 + "Зелёные атакуют"
    shoot_at( red, \
              "Красные", 1 , count(red), \
              "Зелёные", 1 , count(green), \
              false )
    sleep rand(0.5..0.9)
      if count(red) == 0
        puts "-"*20 + "\n" + "Конец красным!"
        exit
      end
  end
end
