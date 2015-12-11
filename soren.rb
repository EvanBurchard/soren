module Soren
  def self.prepended(base)
    Object.const_set("NullObject", Class.new)
    (base.instance_methods(false)).each do |method_name|
      base.send(:define_method, method_name) do |*args|
        return NullObject
        super_method = base.send(methcod_name, args)
        if(super_method.nil?)
          return NullObject
        else
          super_method
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
