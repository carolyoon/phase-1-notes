class Cart
  attr_reader :items, :total_price

  def initialize
    @items = []
    @max_capacity = 10
    @total_price = price_sum
  end

  def add_item(item)
    if full?
      puts "Your cart is full"
    else
      @items << item
    end
  end

  def remove_item(string) #remove anything with string in the item.name
    @items = @items.reject { |item| item.name.include?(string) }
  end
    # @items.each do |item|
    #   if item.name.include?(string)
    #     @items.delete(item)
    #   end
    # end

  def add_multiple_items(items_array)
    items_array.each { |item| add_item(item)}
  end

  def most_expensive_item
    @items.max_by { |item| item.price }
  end
  #   expensivest_item = @items[0]
  #   @items.each do |item|
  #     if item.price > expensivest_item.price
  #       expensivest_item = item
  #     end
  #   end
  #   expensivest_item
  # end

  def three_cheapest
    @items.min(3) { |item| item.price}
  end
    # item_prices = @items.map { |item| item.price }
    # sorted_prices = item_prices.sort
    # sorted_prices[0..2]

  def apply_coupon(coupon)
    discount = 1 - coupon.discount_rate
    @items.each do |item|
      item.price *= discount
    end
  end
  # discounted_prices = @items.map! { |item| item.price * discount }

  def full?
    @items.count >= @max_capacity
  end

  private

  def price_sum
    @items.reduce(0) { |sum, item| sum + item.price }
  end

end
