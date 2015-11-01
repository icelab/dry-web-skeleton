require "transproc/all"

module Functions
  extend Transproc::Registry

  import Transproc::HashTransformations
  import Transproc::ArrayTransformations

  def self.t(*args)
    self[*args]
  end
end
