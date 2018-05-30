class CopyProductPrice < ActiveRecord::Migration[5.1]
  def change
    LineItem.all.each do |li|
      li.price = li.product.price
    end
  end
end
