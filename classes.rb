require_relative "soren"
class NilFree
  def self.class_nil_returner
    return nil
  end
  def nil_returner
    return nil
  end
  def addition(x, y)
    if (x && y)
      return x + y
    else
      return nil
    end
  end
  prepend Soren
end
