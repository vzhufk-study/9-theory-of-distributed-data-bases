require 'rubygems'
require 'nokogiri' 
require 'restclient'
require 'mechanize'
require_relative 'cart'
require_relative 'item'



class Parser
  @name_exp = /.*/

  def initialize(exp)
    @name_exp = exp
  end

  def parse_item(i)
    price = i.css("div[class='regular-price']")[0]&.text
    old_price = i.css("div[class='old-price']")[0]&.text
    name = i.css("div[class='name-block'] a")[0]['title']
    link = i.css("div[class='name-block'] a")[0]['href']
    id = i.css("div[class='sku-block']")[0]&.text

   
    old_price = old_price ? old_price : price.dup
    

    id["код "] = ""
    price["грн"] = ""
    old_price["грн"] = ""

    return Item.new(id, name, price, link, old_price)
  end

  def parse(url)
    page = Nokogiri::HTML(RestClient.get(url)) 

    items = page.css("div[class='product-inner-block']")

    for i in items do
      item = parse_item(i)
      if (item.name.match(@name_exp))
        Cart.add_item(item)
      end
    end

    return Cart
   
  end

  def go_to_page(url, page)
    a = Mechanize.new{ |agent|
      agent.follow_meta_refresh = true
    }
    
    a.get(url) do |home_page|
      signin_page = a.click(home_page.link_with(:class => /pagination-item/, :text => Regexp.new(page.to_s)))
      
      return signin_page.uri.to_s 
    end
  end

end