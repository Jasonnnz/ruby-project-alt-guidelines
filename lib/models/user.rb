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
        user = User.find_by(username: username)
        if user 
            puts "Sorry that username already exists"
        else
            User.create(username: username, password: password)
        end

    end

    def past_orders
        self.orders.where(checked_out: true)
    end

    def current_cart
        orders.find_or_create_by(checked_out: false)
    end

    def display_cart
        count = 0
        self.current_cart.product_orders.each do |product_order|
            puts "#{count + 1}) #{product_order.product.name} Quantity: #{product_order.quantity}"
            count += 1
        end
    end

    def self.all_product_names
        all_names = Product.all.map {|product| product.name}
        all_names
    end

    def self.all_product_instances
        Product.all
    end

    def add_to_cart(product_instance)
        self.current_cart
        ProductOrder.create(order: self.current_cart, product: product_instance)
    end

    def add_review
        puts "Please write a review description, press Enter when done. (in a single line)"
        review = gets.chomp
        puts "Please add a rating (1-5)"
        rating = gets.chomp.to_i
        new_review = Review.create(rating: rating, description: review, product_id: $selection.id, user_id: self.id)
    end
    
    def see_all_my_reviews
        self.reviews 
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


end