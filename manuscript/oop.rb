# ООП лексика
#
class Car
  def initialize
    @state = :closed
  end

  def open
    @state = :open
  end

  def how_are_you
    puts "My state is #{@state}"
  end

end

class Monkey
  # определяет метод state возвращающий значение переменной state
  attr_reader :state
  # определяет метод state назначающий значение arg переменной state
  #   закомментированный метод означает невозможность записи в переменную state
  #attr_writer :state

  def initialize
    @state = rand(0..1) == 0 ? run : stop
  end

  def how_are_you
    # состояние меняется посредством закрытых методов
    @state = rand(0..1) == 0 ? run : stop
    puts "I am #{@state}"
  end

  protected

  def run
    @state = :running
  end

  def stop
    @state = :stopped
  end
end

