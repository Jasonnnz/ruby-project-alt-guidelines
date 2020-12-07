class Application

    attr_reader :prompt 
    attr_accessor :user

    @@prompt = TTY::Prompt.new

    def welcome                 
        @main_menu_display = """
    ███▄ ▄███▓ ▄▄▄       ██▓ ███▄    █     ███▄ ▄███▓▓█████  ███▄    █  █    ██    
    ▓██▒▀█▀ ██▒▒████▄    ▓██▒ ██ ▀█   █    ▓██▒▀█▀ ██▒▓█   ▀  ██ ▀█   █  ██  ▓██▒   
    ▓██    ▓██░▒██  ▀█▄  ▒██▒▓██  ▀█ ██▒   ▓██    ▓██░▒███   ▓██  ▀█ ██▒▓██  ▒██░   
    ▒██    ▒██ ░██▄▄▄▄██ ░██░▓██▒  ▐▌██▒   ▒██    ▒██ ▒▓█  ▄ ▓██▒  ▐▌██▒▓▓█  ░██░   
    ▒██▒   ░██▒ ▓█   ▓██▒░██░▒██░   ▓██░   ▒██▒   ░██▒░▒████▒▒██░   ▓██░▒▒█████▓    
    ░ ▒░   ░  ░ ▒▒   ▓▒█░░▓  ░ ▒░   ▒ ▒    ░ ▒░   ░  ░░░ ▒░ ░░ ▒░   ▒ ▒ ░▒▓▒ ▒ ▒    
    ░  ░      ░  ▒   ▒▒ ░ ▒ ░░ ░░   ░ ▒░   ░  ░      ░ ░ ░  ░░ ░░   ░ ▒░░░▒░ ░ ░    
    ░      ░     ░   ▒    ▒ ░   ░   ░ ░    ░      ░      ░      ░   ░ ░  ░░░ ░ ░    
           ░         ░  ░ ░           ░           ░      ░  ░         ░    ░    
    """            
      shef_logo = """
                                                                                               
                   ___                  .-.                    ./#&@@@@@@@@%’*  
                  (   )                /   `.         ,@@@@@@/‘            @@
           .--.    | | .-.     .--.    | .`. |      .@@@.                  @@   
         /  _  `   | |/   |   /    `.  | |(___)    @@@                    /@%    
        . .' `. ;  |  .-. .  |  .-. ;  | |_       @@           ,         /@@  
        | '   | |  | |  | |  |  | | | (   __)    @@/        .#          @@*
        _`_`.(___) | |  | |  |  |/  |  | |       @@      .@            @@@
       (   ). '.   | |  | |  |  ' _.'  | |       @@&  #@%             @@@  
        | |  `| |  | |  | |  |  .'.-.  | |        @@@@              @@@.   
        ; '._,' '  | |  | |  '  `-' /  | |       (@@@@@(        (@@@@
         '.___.'  (___)(___)  `.__.'  (___)    .@@#    `@@@@@@@@‘		
                                            
    -------------------------------------------------------------------------                                                                                                                                                                                              
                                                                                                                                            
                    ╔═╗╔═╗╦╔═╗╔═╗╔═╗  ╦ ╦╔═╗╦═╗╔╗ ╔═╗             
                    ╚═╗╠═╝║║  ║╣ ╚═╗  ╠═╣║╣ ╠╦╝╠╩╗╚═╗             
                    ╚═╝╩  ╩╚═╝╚═╝╚═╝  ╩ ╩╚═╝╩╚═╚═╝╚═╝             
             ┬   ╔═╗╦  ╦╔═╗╦═╗╦ ╦╔╦╗╦ ╦╦╔╗╔╔═╗  ╔═╗╦╔╗╔╔═╗
            ┌┼─  ║╣ ╚╗╔╝║╣ ╠╦╝╚╦╝ ║ ╠═╣║║║║║ ╦  ╠╣ ║║║║║╣ 
            └┘   ╚═╝ ╚╝ ╚═╝╩╚═ ╩  ╩ ╩ ╩╩╝╚╝╚═╝  ╚  ╩╝╚╝╚═╝                                                                                                                                                                                                                                                                                                                                                                                                                    
      """
        puts shef_logo.green
    end
    
    #LOGIN AND REGISTER HELPER METHODS#

    def register
        User.register_a_user
    end

    def login
        User.login_a_user
    end

    def login_or_register
        @@prompt.select("Would you like to register or login?".blue, symbols: { marker: "🍑"}) do |menu|
            menu.choice "Register", -> {register}
            menu.choice "Login", -> {login}
        end
    end
    
    #CART METHODS AND HELPER METHODS# 
    
    def checkout_helper
        user.check_out_cart
        main_menu
    end
    
    def cart_helper
        if user.current_cart.product_orders.count == 0
            puts "You don't have any products in your cart currently😡"
            main_menu
        else
            user.display_cart
            @@prompt.select("Would you like to checkout?".blue, symbols: { marker: "💰"}) do |menu|
                menu.choice "Check out", -> {checkout_helper}
                menu.choice "Go back to main menu", -> {main_menu}
            end
        end
    end
    
    def past_orders_helper
        past_orders = user.past_orders
        if past_orders.count == 0
            puts "There are no past orders. Would you like to hear about our loyalty rewards program?🤑"
            main_menu
        end 
        choices = Hash[past_orders.map {|order| [order.updated_at, order]}]
        @past_order = @@prompt.select("Which past order would you like to view?".blue, choices, symbols: { marker: "📁"})
        choices = Hash[past_orders.map {|order| [order.updated_at, past_cart]}]
    end
    
    def order_again_helper
        new_order_product = @past_order.product_orders.map {|product_order| product_order}
        new_order_product.each do |product_order|
            user.add_to_cart(product_order.product, product_order.quantity)
        end 
        main_menu
    end
    
    def past_cart
        names = @past_order.product_orders.map {|product_order| "#{product_order.product.name} with Quantity of #{product_order.quantity}"}
        puts "#{names}"
        @@prompt.select("What would you like to do?".blue, symbols: { marker: "📂"}) do |menu| 
            menu.choice "Order again", -> {order_again_helper}
            menu.choice "Go back to main menu", -> {main_menu}
        end
    end
    
    #PRODUCT METHODS AND HELPER METHODS#
    
    def view_all_products
        arr_of_products = User.all_product_instances #Array of Product INSTANCES
        choices = Hash[arr_of_products.map {|product| [product.name, product]}] #HASH: product = NAME OF PRODUCT, VALUE = PRODUCT INSTANCE           
        $selection = @@prompt.select("Which product would you like to view?".blue, choices, symbols: { marker: "‍🍽"}) #$ means global var. 
        choices = Hash[arr_of_products.map {|product| [product, item_options]}]
    end 
    
    def view_all_category_products
        arr_of_cat_products = User.all_product_instances.select {|product| product.pairing == $category}.map {|product| product}
        choices = Hash[arr_of_cat_products.map {|product| [product.name, product]}]
        $selection = @@prompt.select("Which product would you like to view?".blue, choices, symbols: { marker: "🔪"})
        choices = Hash[arr_of_cat_products.map {|product| [product.name, item_options]}]
    end
    
    def view_by_pairings 
        arr_of_pairings = User.categories 
        choices = Hash[arr_of_pairings.map{ |pairing| [pairing.name, pairing]}]
        $category = @@prompt.select("Which pairing would you like to view?".blue, choices, symbols: { marker: "👯‍♂️"})
        view_all_category_products 
    end 

    def item_menu
        #system("clear")
        @@prompt.select("Would you like to view all products or by pairing?".blue, symbols: { marker: "✅"}) do |menu|
            menu.choice "View ALL Products", -> {view_all_products}
            menu.choice "View by pairs", -> {view_by_pairings}
            menu.choice "Go Back", -> {main_menu}
        end
    end 

    #REVIEW METHODS AND HELPERS#

    def add_review
        user.add_review
        main_menu
    end

    def reviews_for_product
        user.reviews_for_product
        main_menu
    end

    def my_reviews
        arr_of_products = user.my_reviewed_products
        if arr_of_products.count == 0
            puts "You haven't written a review😩"
            main_menu
        end
        choices = Hash[arr_of_products.map {|product| [product.name, product]}]
        @review_choice = @@prompt.select("Which product's review would you like to look at?".blue, choices, symbols: { marker: "👀"})
        show_reviews
    end

    def show_reviews 
        puts @review_choice.reviews.map {|review| "Review id #{review.id}: #{review.description} with a rating of #{review.rating}/5!".yellow if review.user == user}.compact
        @@prompt.select("Would you like to delete any reviews or go back?".blue, symbols: { marker: "💣"}) do |menu|
            menu.choice "Delete a review", -> {delete_review}
            menu.choice "Go Back to main menu", -> {main_menu}
        end
    end 

    def select_review_id_to_del
        puts "Please input the id number of the review you'd like to delete!"
        @id_number = gets.chomp 
    end 

    def delete_review
        select_review_id_to_del
        user.delete_review_by_id(@id_number)
        main_menu
    end


    #MANAGING THE CART 

    def item_options
        puts "#{$selection.description} With an average rating of: #{user.average_review_for_selected_product}".yellow
        @@prompt.select("What would you like to do?".blue, symbols: { marker: "✅"}) do |menu|
            menu.choice "Add to cart", -> {add_to_cart_helper} 
            menu.choice "Add a review", -> {add_review}
            menu.choice "View all reviews", -> {reviews_for_product}
            menu.choice "Go back to main menu", -> {main_menu}
        end
    end     

    def add_to_cart_helper 
        puts "Quantity?"
        quantity = gets.chomp
        while quantity == '0'
            puts "Please enter a valid quantity!😡"
            quantity = gets.chomp
        end
        user.add_to_cart($selection, quantity)
        main_menu
    end

    def delete_from_cart_helper
        puts "Which Product Order would you like to delete? Please input the Product Order ID number."
        product_order_id = gets.chomp 
        user.delete_product_order_by_id(product_order_id)
        main_menu
    end

    def update_quantity_helper 
        puts "Which Product Order would you like to update? Please input the ID number."
        product_order_id = gets.chomp
        puts "What is the new quantity of the product you would like?"
        new_quantity = gets.chomp 
        user.update_quantity(product_order_id, new_quantity)
        main_menu
    end
    
    def empty_cart
        user.current_cart.destroy
        main_menu
    end

    def update_cart_helper
        if user.current_cart.product_orders.count == 0 
            puts "Sorry you don't have any items in your cart right now. Please go check out our products🥺"
            main_menu
        else 
            @@prompt.select("Would you like to delete an item entirely or update cart?".blue, symbols: { marker: "🧨"}) do |menu|
                menu.choice "Delete a product", -> {delete_from_cart_helper}
                menu.choice "Update cart", -> {update_quantity_helper}
                menu.choice "Empty cart", -> {empty_cart}
                menu.choice "Go to main menu",  -> {main_menu}
            end
        end
    end
    

    #MAIN MENU

    def main_menu
        sleep 1
        puts @main_menu_display.red
        user.reload
        @@prompt.select("Welcome, #{user.username}! 🥳 What would you like to do?".blue, symbols: { marker: "🍁"}) do |menu|
            menu.choice "View Products", -> {item_menu} 
            menu.choice "View Cart", -> {cart_helper} 
            menu.choice "Update Cart", -> {update_cart_helper}
            menu.choice "View Past Orders", -> {past_orders_helper}
            menu.choice "View My Reviews", -> {my_reviews}
            menu.choice "Log Out", -> {log_out}
        end
    end

    def log_out
        puts "Thanks for checking out our app! Please like, comment, and subscribe 🥺"
        exit 
    end

end 