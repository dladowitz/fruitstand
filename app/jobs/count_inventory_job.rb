class CountInventoryJob < ActiveJob::Base
  queue_as :medium

  def perform(*args)
    inventory_count = Fruit.all.count
    puts "\n--------------Starting Inventory---------------"
    puts "Today we have #{inventory_count} items of fruit in stock."
    puts "--------------Ending   Inventory---------------"
    puts "\n"
  end
end
