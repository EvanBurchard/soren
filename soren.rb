module Soren
  def self.prepended(base)
    Object.const_set("NullObject", Class.new)

    (base.instance_methods(false)).each do |method_name|
      old_method = base.instance_method(method_name)
      self.send(:define_method, method_name) do |*args|
        result = old_method.bind(self).(*args)
        if(result.nil?)
          return NullObject
        else
          return result
        end
      end
    end

    (base.methods - Object.methods).each do |method_name|
      old_method = base.method(method_name).unbind
      base.send(:define_singleton_method, method_name) do |*args|
        result = old_method.bind(base).(*args)
        if(result.nil?)
          return NullObject
        else
          return result
        end
      end
    end

  end
end
