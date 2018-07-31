class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vender(vender)
    @vendors << vender
  end

  def vendor_names
    names_of_venders = []
    @vendors.each do |vender|
     names_of_venders << vender.name
    end
    names_of_venders
  end

  def vendors_that_sell(item)
    @vendors.keep_if do |vender|
    vender.inventory.keys.include?(item)
    end
  end
  

  def sorted_item_list
    sort_list = []
    @vendors.each do |vender|
    sorted_items = vender.inventory.keys.sort
    sort_list << sorted_items
    end
    not_uniq_list = sort_list.flatten.sort
    not_uniq_list.uniq
  end 

  def total_inventory
    @vendors.each do |vender|
      binding.pry
    end
  end
end
