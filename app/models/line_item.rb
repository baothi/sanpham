class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  include CurrentCart
  # before_action :set_cart, only: [:create]
  # before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  def total_price
    product.price * quantity
  end
end
