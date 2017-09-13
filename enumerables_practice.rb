module EnumerablesPractice

  class Box
    attr_accessor :length,
                  :width,
                  :height,
                  :weight,
                  :color

    def initialize(args = {})
      @length = args[:length]
      @width  = args[:width]
      @height = args[:height]
      @weight = args[:weight]
      @color  = args[:color]
    end

    def volume
        @length * @width * @height
    end 
  end

  class << self

    # Basic enumerables practice
    def max_using_each(array)
      max_value = array[0]
      array.each do |value|
        if value > max_value
          max_value = value
        end
      end
      max_value 
    end

    def max_using_max(array)
      array.max
    end

    def min_using_each(array)
      min_value = array[0]
      array.each do |value|
        if value < min_value
          min_value = value
        end
      end
      min_value
    end

    def min_using_min(array)
      array.min
    end

    def sort_using_sort(array)
      array.sort
    end

    # More advanced enumerables practice
    def sum_using_each(array)
      total_sum = 0
      array.each { |value| total_sum += value }
      total_sum
    end

    def sum_using_reduce(array)
      array.reduce(:+)
    end

    def product_using_each(array)
      total_product = 1
      array.each { |value| total_product *= value}
      total_product
    end

    def product_using_reduce(array)
      array.reduce(:*)
    end

    def symbol_versions_using_each(array)
      new_array = []
      array.each do |number|
        new_array << number.to_s.to_sym
      end 
      new_array
    end

    def symbol_versions_using_map(array)
      array.map { |number| number.to_s.to_sym }
    end

    def multiply_by_two_with_each(array)
      new_array = []
      array.each { |value| new_array << value * 2 }
      new_array
    end

    def multiply_by_two_with_map(array)
      array.map { |value| value * 2 }
    end

    def largest_box_by_weight_using_each(boxes)
      heaviest_box = boxes[0]
      boxes.each do |box|
        if box.weight > heaviest_box.weight
          heaviest_box = box
        end
      end
      heaviest_box
    end

    def largest_box_by_weight_using_max_by(boxes)
      boxes.max_by { |box| box.weight }
    end

    def smallest_box_by_weight_using_each(boxes)
      smallest_box = boxes[0]
      boxes.each do |box|
        if box.weight < smallest_box.weight
          smallest_box = box
        end 
      end 
      smallest_box
    end

    def smallest_box_by_weight_using_min_by(boxes)
      boxes.min_by { |box| box.weight }
    end

    def find_red_boxes_using_each(boxes)
      red_boxes = []
      boxes.each do |box|
        if box.color == "red"
          red_boxes << box 
        end 
      end 
      red_boxes 
    end

    def find_red_boxes_using_select(boxes)
      boxes.select { |box| box.color == "red" }
    end

    def sum_box_weights_using_each(boxes)
      sum_weight = 0
      boxes.each do |box|
        sum_weight += box.weight 
      end 
      sum_weight 
    end

    def sum_box_weights_using_reduce(boxes)
        # weights = []
        # boxes.select { |box| weights << box.weight }
        boxes.reduce(0) { |sum, box| sum + box.weight }
    end

    def generate_array_of_box_colors_using_each(boxes)
        box_colors = []
        boxes.each  { |box| box_colors << box.color }
        box_colors       
    end

    def generate_array_of_box_colors_using_map(boxes)
        boxes.map { |box| box.color }
    end

    def sort_boxes_in_descending_order_by_weight(boxes)
        boxes.sort { |box1, box2| box2.weight <=> box1.weight }
    end

    # Stretch Challenges


    def largest_box_by_volume_using_max_by(boxes)
        boxes.map { |box| box.volume }.max 
    end

    def largest_box_by_volume_using_each(boxes)
        largest_box = boxes[0]
        boxes.each do |box|
            if box.volume > largest_box.volume 
                largest_box = box
            end 
       end 
       largest_box 
    end

    def largest_box_by_volume_using_max_by(boxes)
        boxes.max_by { |box| box.volume }
    end

    def sort_ascending_without_sort(array)

    end

    def sort_descending_without_sort(array)
    end

    def sort_boxes_by_color(boxes)
    end

    def same_color(box1)
      boxes.delete(box1)
      box_check = boxes.select 
      if box_check.empty?
        print "no other boxes have a color #{box1.color}"
      else 
        
    end

    def reverse_boxes_array(boxes)
        counter = boxes.length - 1 
        reverse_array = []
        while counter > -1
            reverse_array << boxes[counter]
            counter -= 1 
        end 
        reverse_array 
    end
  end
end


#COUNTER 

# i = 0 iterate thru an array, counting up
# while i < array.length 
#     i += 1 
# end 

# i = array.length - 1 iterate through an array in reverse order (counting down)
# while i >= 0 
#     i -= 1 
# end

SMART CART PRACTICE 
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
    @items.each do |item|
      if item.name.include?(string)
        @items.delete(item)
      end 
    end 
    @items = @items.reject { |item| item.name.include?(string) }
  end 
  
  def add_multiple_items(items_array)
    items_array.each { |item| add_item(item)}
  end 
  
  def most_expensive_item
    expensivest_item = @items[0]
    @items.each do |item|
      if item.price > expensivest_item.price
        expensivest_item = item 
      end  
    end
    expensivest_item 
  end
  
  def three_cheapest
    # item_prices = @items.map { |item| item.price }
    # sorted_prices = item_prices.sort 
    # sorted_prices[0..2]
    @items.min(3) { |item| item.price} 
  end 
  
  def apply_coupon(coupon)
    discount = 1 - coupon.discount_rate
    discounted_prices = @items.map! { |item| item.price * discount }
    @items.each do |item|
      item.price *= discount 
    end 
  end 
  
  def full?
    @items.count >= @max_capacity
  end
  
  private 
  
  def price_sum
    @items.reduce(0) { |sum, item| sum + item.price }
  end
end 
