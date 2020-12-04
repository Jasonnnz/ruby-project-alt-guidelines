class Application

    attr_reader :prompt 
    attr_accessor :user

    @@prompt = TTY::Prompt.new
    # def initialize
    #     @prompt = TTY::Prompt.new
    # end

    def welcome                             
        shef = """             ,. -,          .·¨'`;        ,.·´¨;\                  _,.,  °             ,.-·~ ^~,   
        ,.·'´,    ,'\        ';   ;'\       ';   ;::\          ,.·'´  ,. ,  `;\ '        .'´  ,.-·~-.,':\  
    ,·'´ .·´'´-·'´::::\'      ;   ;::'\      ,'   ;::';       .´   ;´:::::\`'´ \'\       ;   ,':\::::::'\::\ 
   ;    ';:::\::\::;:'       ;  ;::_';,. ,.'   ;:::';°     /   ,'::\::::::\:::\:'     ;'   ;:::'_-·~-\;' 
   \·.    `·;:'-·'´        .'     ,. -·~-·,   ;:::'; '    ;   ;:;:-·'~^ª*';\'´     ,.'    'ª*'´ __'`;\ ° 
    \:`·.   '`·,  '        ';   ;'\::::::::;  '/::::;      ;  ,.-·:*'´¨'`*´\::\ '    `',   ;\¯::::::::\:\ 
      `·:'`·,   \'          ;  ';:;\;::-··;  ;::::;      ;   ;\::::::::::::'\;'      ;   ;::\;::_:_::\;' 
       ,.'-:;'  ,·\         ':,.·´\;'    ;' ,' :::/  '     ;  ;'_\_:;:: -·^*';\      ;  ';:::;        '    
  ,·'´     ,.·´:::'\         \:::::\    \·.'::::;        ';    ,  ,. -·:*'´:\:'\°    ';  ;::';             
   \`*'´\::::::::;·'          \;:·´     \:\::';          \`*´ ¯\:::::::::::\;' '    \*´\:';        '    
    \::::\:;:·´                          `·\;'             \:::::\;::-·^*'´          '\::\;     '        
      '`*'´                                 '                `*´¯                     `*´              """

      shef2 = """
                                                                                               
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
        puts shef2
    end

    def login_or_register
        @@prompt.select("Would you like to register or login?") do |menu|
            menu.choice "Register", -> {register}
            menu.choice "Login", -> {login}
        end
    end

    
    def register
        User.register_a_user
    end

    def login
        User.login_a_user
    end

    def cart_helper
        user.display_cart
        main_menu
    end

    def view_all_products
        arr_of_products = User.all_product_instances #Array of Product INSTANCES
        choices = Hash[arr_of_products.map {|product| [product.name, product]}] #HASH: product = NAME OF PRODUCT, VALUE = PRODUCT INSTANCE           
        $selection = @@prompt.select("Which product would you like to view?", choices) #$ means global var. 
        choices = Hash[arr_of_products.map {|product| [product, item_options]}]
    end 

    def view_all_category_products
        arr_of_cat_products = User.all_product_instances.select {|product| product.pairing == $category}.map {|product| product}
        choices = Hash[arr_of_cat_products.map {|product| [product.name, product]}]
        $selection = @@prompt.select("Which product would you like to view?", choices)
        choices = Hash[arr_of_cat_products.map {|product| [product.name, item_options]}]
    end
    
    def view_by_pairings 
        arr_of_pairings = User.categories 
        choices = Hash[arr_of_pairings.map{ |pairing| [pairing.name, pairing]}]
        $category = @@prompt.select("Which pairing would you like to view?", choices)
        view_all_category_products 
    end 

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
        choices = Hash[arr_of_products.map {|product| [product.name, product]}]
        @review_choice = @@prompt.select("Which product's review would you like to look at?", choices)
        show_reviews
    end

    def show_reviews 
        puts @review_choice.reviews.map {|review| "#{review.description} with a rating of #{review.rating}/5!" if review.user == user}.compact
        @@prompt.select("Would you like to delete any reviews or go back?") do |menu|
            menu.choice "Delete a review", -> {puts "1"}
            menu.choice "Go Back to Main Menu", -> {main_menu}
        end
    end 

    def item_options
        @@prompt.select("What would you like to do?") do |menu|
            menu.choice "Add a review", -> {add_review}
            menu.choice "Add to cart?", -> {add_to_cart} 
            menu.choice "View all reviews", -> {reviews_for_product}
        end
    end     

    def main_menu
        @@prompt.select("Welcome, #{user.username}! 🥳 What would you like to do?".blue.on_white.bold) do |menu|
            menu.choice "View Cart".red, -> {cart_helper} 
            menu.choice "View Past Orders".red, -> {puts "2"}
            menu.choice "View My Reviews".red, -> {my_reviews}
            menu.choice "View Products".red, -> {item_menu} 
        end
    end

    def item_menu
        @@prompt.select("Would you like to view all products or by pairing?") do |menu|
            menu.choice "View ALL Products", -> {view_all_products}
            menu.choice "View by pairs", -> {view_by_pairings}
            menu.choice "Go Back", -> {main_menu}
        end
    end 

end 

