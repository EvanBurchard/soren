module Soren

  def self.prepended(base)
    create_null_object_class!
    assign_instance_methods!(base)
    assign_class_methods!(base)
  end

  def self.create_null_object_class!
    Object.const_set("NullObject", Class.new)
  end

  def self.assign_instance_methods!(base)
    (base.instance_methods(false)).each do |method_name|
      old_method = base.instance_method(method_name)
      self.send(:define_method, method_name) do |*args, &block|
        result = old_method.bind(self).(*args, &block)
        if(result.nil?)
          return NullObject
        else
          return result
        end
      end
    end
  end

  def self.assign_class_methods!(base)
    (base.methods - Object.methods).each do |method_name|
      old_method = base.method(method_name).unbind
      base.send(:define_singleton_method, method_name) do |*args, &block|
        result = old_method.bind(base).(*args, &block)
        if(result.nil?)
          return NullObject
        else
          return result
        end
      end
    end
  end

end
