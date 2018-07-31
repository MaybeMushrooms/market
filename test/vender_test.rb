require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vender'
require 'pry'

class VendorTest < Minitest::Test

  def test_it_exists
    vender = Vender.new("Rocky Mountain Fresh")
    assert_instance_of Vender, vender
  end

  def test_can_hold_inventory
    vender = Vender.new("Rocky Mountain Fresh")
    expected = {}
    assert_equal expected, vender.inventory
  end
  
  def test_it_can_store_stock
    vender = Vender.new("Rocky Mountain Fresh")
    assert_equal 0, vender.check_stock("Peaches")
    vender.stock("Peaches", 30)
    vender.stock("Peaches", 25)
    assert_equal 55, vender.check_stock("Peaches")
  end

  def test_it_can_stock_different_items
    vender = Vender.new("Rocky Mountain Fresh")
    assert_equal 0, vender.check_stock("Peaches")
    vender.stock("Peaches", 30)
    vender.stock("Peaches", 25)
    vender.stock("Tomatoes", 12)
    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, vender.inventory
  end

  def test_something
    vender_1 = Vender.new("Rocky Mountain Fresh")
    vender_1.stock("Peaches", 35)
    vender_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vender_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65) 
  end
end