class User < ActiveRecord::Base

    has_many :reviews
    has_many :orders
    has_many :products, through: :reviews 
    has_many :product_orders, through: :orders

    @@prompt = TTY::Prompt.new
    @@sym = @@prompt.decorate('🤫')

    def self.login_a_user
        puts "Please enter your username"
        username = gets.chomp
        password = @@prompt.mask("Please enter your password:", mask: @@sym)
        user = User.find_by(username: username, password: password)
        if user.nil?
            puts "Sorry there's no one with that username or password"
        else 
            user 
        end
    end

    def self.register_a_user
        username = @@prompt.ask("Please enter a username")
        password = @@prompt.mask("Please enter a password", mask: @@sym)
        name = @@prompt.ask("Please enter your name")
        user = User.find_by(username: username)
        if user 
            message = "Sorry that username already exists"
        else
            User.create(username: username, password: password, name: name)
        end

    end

    def past_orders
        past_order = self.orders.where(checked_out: true)
        if past_order.nil?
        end 
    end

    def current_cart
        orders.find_or_create_by(checked_out: false)
    end

    def display_cart
        
        self.current_cart.product_orders.each do |product_order|
            puts "Product Order ID: #{product_order.id}) #{product_order.product.name} Quantity: #{product_order.quantity}"
        end
        @total_price = self.current_cart.product_orders.sum do |product_order|
            (product_order.quantity * product_order.product.price) 
        end
        puts "Your total is: #{sprintf("$%2.2f",(@total_price.to_d/100))}"
    end
        
    def self.all_product_names
        all_names = Product.all.map {|product| product.name}
        all_names
    end

    def self.all_product_instances
        Product.all
    end

    def update_quantity(product_order_id, new_quantity) #current_cart -> Order Instance
        product_order = self.current_cart.product_orders.find(product_order_id)
        product_order.update(quantity: new_quantity)
    end

    def delete_product_order_by_id(product_order_id_num)
        self.current_cart.product_orders.find(product_order_id_num).destroy
    end

    def add_to_cart(product_instance, quantity)
        ProductOrder.create(order: self.current_cart, product: product_instance, quantity: quantity)
    end

    def add_review
        puts "Please write a review description, press Enter when done. (in a single line)"
        review = gets.chomp
        puts "Please add a rating (1-5)"
        rating = gets.chomp.to_i
        new_review = Review.create(rating: rating, description: review, product_id: $selection.id, user_id: self.id)
    end
    
    def see_my_review_instances
        self.reviews
    end 
    
    def my_reviewed_products
        all_reviews = see_my_review_instances.map {|review| review.product}
        if all_reviews.nil?
        end
    end

    def reviews_for_product
        # $selection = product instance we chose
        $selection.reviews.map do |review|
            puts "#{review.description}, I give it a #{review.rating} out of 5! -#{review.user.name}" 
        end
    end

    def self.categories #Array of Pairing instances
        Pairing.all
    end
    
    def check_out_cart
        self.display_cart
        self.current_cart.update(checked_out: true)
        puts "Thanks for the ez money"
    end
end