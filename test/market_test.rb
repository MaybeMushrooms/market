require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vender'
require './lib/market'
require 'pry'

class MarketTest < Minitest::Test

  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

  def test_market_has_name
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", market.name
  end

  def test_it_holds_vendors
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal [], market.vendors
  end

  def test_it_can_add_vendors
    vender_1 = Vender.new("Rocky Mountain Fresh")
    vender_1.stock("Peaches", 35)
    vender_1.stock("Tomatoes", 7)
    vender_2 = Vender.new("Ba-Nom-a-Nom")
    vender_2.stock("Banana Nice Cream", 50)
    vender_2.stock("Peach-Raspberry Nice Cream", 25)
    vender_3 = Vender.new("Palisade Peach Shack")
    vender_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vender(vender_1)
    market.add_vender(vender_2)
    market.add_vender(vender_3)
    expected = [vender_1, vender_2, vender_3]
    assert_equal expected, market.vendors
  end

  def test_vendors_names
    vender_1 = Vender.new("Rocky Mountain Fresh")
    vender_1.stock("Peaches", 35)
    vender_1.stock("Tomatoes", 7)
    vender_2 = Vender.new("Ba-Nom-a-Nom")
    vender_2.stock("Banana Nice Cream", 50)
    vender_2.stock("Peach-Raspberry Nice Cream", 25)
    vender_3 = Vender.new("Palisade Peach Shack")
    vender_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vender(vender_1)
    market.add_vender(vender_2)
    market.add_vender(vender_3)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    assert_equal expected, market.vendor_names
  end

 def test_find_vendors_that_sell
  vender_1 = Vender.new("Rocky Mountain Fresh")
  vender_1.stock("Peaches", 35)
  vender_1.stock("Tomatoes", 7)
  vender_2 = Vender.new("Ba-Nom-a-Nom")
  vender_2.stock("Banana Nice Cream", 50)
  vender_2.stock("Peach-Raspberry Nice Cream", 25)
  vender_3 = Vender.new("Palisade Peach Shack")
  vender_3.stock("Peaches", 65) 
  market = Market.new("South Pearl Street Farmers Market")
  market.add_vender(vender_1)
  market.add_vender(vender_2)
  market.add_vender(vender_3)
  expected = [vender_1, vender_3]
  assert_equal expected, market.vendors_that_sell("Peaches")
  end

  def test_find_vendors_that_sell_something_different
    vender_1 = Vender.new("Rocky Mountain Fresh")
    vender_1.stock("Peaches", 35)
    vender_1.stock("Tomatoes", 7)
    vender_2 = Vender.new("Ba-Nom-a-Nom")
    vender_2.stock("Banana Nice Cream", 50)
    vender_2.stock("Peach-Raspberry Nice Cream", 25)
    vender_3 = Vender.new("Palisade Peach Shack")
    vender_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vender(vender_1)
    market.add_vender(vender_2)
    market.add_vender(vender_3)
    expected = [vender_2]
    assert_equal expected, market.vendors_that_sell("Banana Nice Cream")
  end

  def test_it_can_sort_uniq_list
    vender_1 = Vender.new("Rocky Mountain Fresh")
    vender_1.stock("Peaches", 35)
    vender_1.stock("Tomatoes", 7)
    vender_2 = Vender.new("Ba-Nom-a-Nom")
    vender_2.stock("Banana Nice Cream", 50)
    vender_2.stock("Peach-Raspberry Nice Cream", 25)
    vender_3 = Vender.new("Palisade Peach Shack")
    vender_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vender(vender_1)
    market.add_vender(vender_2)
    market.add_vender(vender_3)
    expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]
    assert_equal expected, market.sorted_item_list
  end

  def test_total_market_inventory
    vender_1 = Vender.new("Rocky Mountain Fresh")
    vender_1.stock("Peaches", 35)
    vender_1.stock("Tomatoes", 7)
    vender_2 = Vender.new("Ba-Nom-a-Nom")
    vender_2.stock("Banana Nice Cream", 50)
    vender_2.stock("Peach-Raspberry Nice Cream", 25)
    vender_3 = Vender.new("Palisade Peach Shack")
    vender_3.stock("Peaches", 65) 
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vender(vender_1)
    market.add_vender(vender_2)
    market.add_vender(vender_3)
    expected = {"Peaches"=>100, "Tomatoes"=>7, "Banana Nice Cream"=>50, "Peach-Raspberry Nice Cream"=>25}
    assert_equal expected, market.total_inventory
  end
end