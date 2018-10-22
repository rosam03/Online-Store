class Order < ApplicationRecord
  # delete data related to this order when destroyed
  has_many :line_items, dependent: :destroy
  belongs_to :shop

  # display most recent orders first
  scope :sorted, lambda { order("created_at DESC") }

  validates :total, :presence => true

end
