require 'json'
require_relative 'item_container'
require 'csv'
require 'yaml'



class Cart
  include ItemContainer
  include Enumerable

  def save_to_file(filename)
    File.write(filename, Cart.join("\n"), mode: 'w')
  end

  def save_to_json(filename)
    data = Cart.map { |o| o.to_h }.to_json

    File.write(filename, data, mode: 'w')
  end

  def save_to_csv(filename)
    hash = Cart[0].to_h
    attributes = hash.keys

    CSV.open(filename, "w") do |csv|
      csv << attributes.map{ |attr| attr }
      Cart.each do |obj|
        csv << attributes.map{ |attr| obj.to_h[attr] }
      end
    end
  end

  def save_to_yml(filename)
    data = Cart.map { |o| o.to_h }.to_yaml

    File.write(filename, data, mode: 'w')
  end

  def each(&block)
    Cart.each do |member|
      block.call(member)
    end
    # or
    # @members.each(&block)
  end

end