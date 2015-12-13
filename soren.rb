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
    (base.instance_methods(false)).each do |method_name|
      old_method = base.instance_method(method_name)
      self.send(:define_method, method_name) do |*args|
        x = old_method.bind(self).()
        if(x.nil?)
          return NullObject
        else
          return x
        end
      end
    end
    (base.methods - Object.methods).each do |method_name|
      base.class.class_exec do
        define_method(method_name) do
          return NullObject
        end
      end
    end
  end
end
