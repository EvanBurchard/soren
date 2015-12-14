require_relative "soren"
class NilFree
  def nil_returner
    return nil
  end
  def self.class_nil_returner
    return nil
  end
  def addition(x, y)
    if (x && y)
      return x + y
    else
      return nil
    end
  end
  def self.class_addition(x, y)
    if (x && y)
      return x + y
    else
      return nil
    end
  end
  prepend Soren
end
