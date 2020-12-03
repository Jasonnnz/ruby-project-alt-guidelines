class Order < ActiveRecord::Base

    belongs_to :user
    has_many :product_orders
    has_many :products, through: :product_orders
    

    def total_price 
        self.products.sum(:price)
    end 


end 