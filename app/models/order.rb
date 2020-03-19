# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :string
#  email      :string
#  name       :string
#  phone      :string
#  tax_code   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  has_many :cart_items


  def sub_total
    sum = 0
    self.cart_items.each do |c|
      sum += c.total_price
    end
    return  sum.round(2)
  end
end
