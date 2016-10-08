class CountApplesJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    apple_count =  Fruit.all.where(name:"Apple").count

    puts "\n--------------Starting Apple Inventory---------------"
    puts "Today we have #{apple_count} apples in stock."
    puts "--------------Ending Apple  Inventory---------------"
    puts "\n"
  end
end
