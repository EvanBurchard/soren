require_relative "soren"
class Toy
  def self.class_nil_returner
    return nil
  end
  def nil_returner
    return nil
  end
  prepend Soren
end


