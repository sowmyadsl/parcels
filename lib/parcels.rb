class Parcels
  attr_accessor :height
  attr_accessor :width
  attr_accessor :depth
  attr_accessor :weight

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

end
