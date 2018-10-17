require './lib/room'

class House

  attr_reader :address,
              :rooms

  def initialize(sale_price, address)
    @sale_price = sale_price
    @address = address
    @rooms = []
  end

  def price
    price = @sale_price.delete("$")
    price.to_i
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    areas = @rooms.map do |room|
      room.area
    end
    areas.sum
  end

  def price_per_square_foot
    (price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end

  def rooms_by_category
    sorted = {}
    @rooms.length.times do |i|
      if sorted.has_key?(@rooms[i].category)
        sorted[@rooms[i].category].push(@rooms[i])
      else
        sorted[@rooms[i].category] = [@rooms[i]]
      end
    end
    sorted
  end
end
