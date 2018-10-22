class Shop < ApplicationRecord
  # delete data related to this shop when destroyed
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :email, :presence => true,
                    :length => { :maximum => 50 },
                    :format => EMAIL_REGEX
  validates :name,  :presence => true,
                    :length => { :maximum => 50 },
                    :uniqueness => true
                    
end
