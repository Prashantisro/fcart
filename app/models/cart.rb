class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  # def add_item(product_id)
  #       line_item = line_items.where('product_id = ?', product_id).first
  #   if line_item
  #       # increase the quantity of product in cart
  #       line_item.quantity + 1
  #       save
  #   else
  #       # product does not exist in cart
  #       product = Product.find(product_id)
  #       line_items << product
  #   end
  #   save
  # end

  # def total_price
  #   line_items.to_a.sum(&:full_price)
  # end
  def sub_total
  sum = 0
    self.line_items.each do |line_item|
      sum+= line_item.total_price
    end
  return sum
  end
end
