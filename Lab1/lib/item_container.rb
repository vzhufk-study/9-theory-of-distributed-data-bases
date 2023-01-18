module ItemContainer



  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.extend(InstanceMethods)
  end

  module ClassMethods

  end

  module InstanceMethods

    @@items = []

    def initialize() 
      @@items = []
    end

    def add_item(item)
      @@items.push(item)
    end

    def remove_item(item)
      @@items.delete(item) 
    end

    def delete_items()
      @@items = []
    end

    def method_missing(m, *args, &block) 
      @@items.send(m, *args, &block)
    end
  

  end
  
end