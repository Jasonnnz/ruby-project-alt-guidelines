class Product < ActiveRecord::Base

    belongs_to :pairing
    has_many :reviews
    has_many :product_orders
    has_many :users, through: :reviews 
    has_many :orders, through: :product_orders
    
end 