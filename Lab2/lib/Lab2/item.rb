class Item

  include Comparable

  attr_accessor :price, :id, :name, :link, :oldprice 
  def initialize(id, name, price, link, oldprice)
    @id = id
    @name = name
    @price = price
    @link = link
    @oldprice = oldprice
  end

  def info()

  end

  def to_s() 
    return "%{id} - %{name} - %{price}(%{oldprice}) - %{link}" % { id: @id, name: @name, price: @price, oldprice: @oldprice, link: @link}
  end

  def to_h()
    h = { id: @id, name: @name,  price: @price, oldprice: @oldprice, link: @link }
    return h.to_h
  end

  def <=>(other_profile)
    @price <=> other_profile.price
  end

end