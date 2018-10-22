class Product < ApplicationRecord
  # delete data related to this product when destroyed
  has_many :line_items, dependent: :destroy
  belongs_to :shop

  # price should have 2 or fewer decimal places
  PRICE_REGEX = /\A\d+(?:\.\d{0,2})?\z/

  validates :name,  :presence => true,
                    :length => { :maximum => 30 }
  validates :price, :presence => true,
                    :format => PRICE_REGEX

end
