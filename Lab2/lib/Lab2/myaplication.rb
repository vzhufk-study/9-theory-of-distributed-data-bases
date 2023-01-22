require_relative 'item'
require_relative 'cart'
require_relative 'item_container'
require_relative 'parser'

module MyApplictionZhufiak
  Item = ::Item
  Cart = ::Cart
  ItemContainer = ::ItemContainer
  Parser = ::Parser


  class User 
    attr_accessor: :login, :password;

    def initialize(login, password)
      @login = login
      @password = password
    end

    def send()

    end
  end

  class Singletone
    @instance = new


    attr_accessor :web_address, :validator, :file_ext, :parse_item, :user 

    private_class_method :new
  
    # The static method that controls the access to the singleton instance.
    #
    # This implementation let you subclass the Singleton class while keeping just
    # one instance of each subclass around.
    def self.instance
      @instance
    end
  end
end