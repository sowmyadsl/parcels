class Parcels
  attr_accessor :height
  attr_accessor :width
  attr_accessor :depth
  attr_accessor :weight

  @@parcels = []

  def initialize (height,width,depth,weight)
  self.height = height
  self.width = width
  self.depth = depth
  self.weight = weight
  end

  def volume
    height * width * depth
  end

  def cost_to_ship
    if volume < 500
      10
    elsif volume < 5000
      25
    else
      50
    end
  end

  def gift_wrap_price
    surface_area = (2 * height * width) + (2 * width * depth) + (2 * depth * height)
    surface_area / 10
  end

  def self.all
    @@parcels
  end

  def add_parcel
    @@parcels.push(self)
  end

  def self.clear
    @@parcels = []
  end

end
