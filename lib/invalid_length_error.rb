class InvalidLengthError
  attr_accessor :min, :max, :current
  private :min=, :max=, :current=

  CODE = "INVALID_LENGTH"
  DESCRIPTION = "Invalid length"

  def initialize(min, max, current)
    self.min = min
    self.max = max
    self.current = current
  end

  def code
    CODE
  end

  def description
    DESCRIPTION
  end

  def empty?
    false
  end
end
