require_relative '../config/environment'

# puts String.colors 
# puts String.modes
# puts String.color_samples 

application = Application.new
application.welcome

user_or_nil = application.login_or_register


# Enters until loop if user doesn't exists

until user_or_nil
    # system("clear")
    user_or_nil = application.login_or_register
end

# Set's application's user to user_or_nil
application.user = user_or_nil
application.main_menu

