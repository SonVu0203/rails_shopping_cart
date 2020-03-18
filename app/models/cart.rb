# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def sub_total
    sum = 0
    self.cart_items.each do |c|
      sum += c.total_price
    end
    return  sum.round(2)
  end

  def count_item
    return self.cart_items.count
  end
end
