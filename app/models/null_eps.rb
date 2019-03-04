# Null eps for params[:eps]
class NullEps
  attr_accessor :eps
  def initialize
    self.eps = "0"
  end
end
