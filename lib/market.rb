require 'pry'
require 'pry-nav'
require 'thread'

class Market

  attr_accessor :basket, :mutex

  def initialize
    @basket = 0
    @mutex = Mutex.new
  end

  def lazy_farmer
    loop do
      temp = @basket
      sleep(rand(1..5))
      if temp < 50
        temp += 1
        @basket = temp
        puts "Lazy farmer put 1 apples in the basket. Basket is now #{@basket}"
      else
        puts "Basket is full!"
      end
    end
  end

  def caffeinated_farmer
    loop do
      temp = @basket
      sleep(2)
      if temp < 50
        temp += 10
        @basket = temp
        puts "Caffeinated farmer put 10 apples in the basket. Basket is now #{@basket}"
      else
        puts "Basket is full!"
      end
    end
  end

  def retail_eater
    loop do
      temp = @basket
      sleep(rand(1..5))
      if temp > 0
        # make a higher number to make tests fail faster
        temp -= 1
        @basket = temp
      end
      raise "Basket empty!" if @basket < 0
      puts "Retail eater took 1 apples from the basket. Basket is now #{@basket}"
    end
  end

  def enterprise_eater
    loop do
      temp = @basket
      sleep(5)
      if temp > 0
        temp -= 1
        @basket = temp
      end
      raise "Basket empty!" if @basket < 0
      puts "Enterprise eater took 1 apples from the basket. Basket is now #{@basket}"
    end
  end

  def run_threads
    threads = []
    threads << Thread.new { retail_eater }
    threads << Thread.new { caffeinated_farmer }
    threads << Thread.new { enterprise_eater }
    threads << Thread.new { lazy_farmer }
    threads.each { |thr| thr.join }
  end

  # market = Market.new

  # market.run_threads
end
