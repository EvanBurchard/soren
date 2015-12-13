module Soren
  def nil_returner
    if super().nil?
      return NullObject
    else
      super
    end
  end
  def self.prepended(base)
    Object.const_set("NullObject", Class.new)
    (base.methods - Object.methods).each do |method_name|
      base.class.class_exec do
        define_method(method_name) do
          return NullObject
        end
      end
    end
  end
end
