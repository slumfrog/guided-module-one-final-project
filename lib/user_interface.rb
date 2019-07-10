class UserInterface

    def initialize
        @artist = nil
        @fan = nil
        @gig = nil
    end

def welcome
    system "clear"
    2.times do puts "" end
    str = "
    .-..-.       .--.  _             
    : `' :      : .--':_;            
    : .. :.-..-.: : _ .-. .--.  .--. 
    : :; :: :; :: :; :: :' .; :`._-.'
    :_;:_;`._. ;`.__.':_;`._. ;`.__.'
           .-. :          .-. :      
           `._.'          `._.'      
    ".colorize(:color => :white, :background => :red)
	puts str
    prompt = TTY::Prompt.new
    choices = ["Existing".colorize(:red), "New Fan".colorize(:yellow)]
    choice = prompt.select("Welcome to MyGigs! Are you a new, or existing fan?".colorize(:white), choices)
    if choice == "New Fan"
        new_fan
    else
        user_login
    end
end

def user_login # set up if statement - if no errors, continue, otherwise puts error and call method on itself again
    prompt = TTY::Prompt.new
    username = prompt.ask('Please enter your username')
    if @fan = Fan.username_validation(username)
        password_login
    else
        puts "This username is not in our database, please try again or create a new account"
        user_login
    end
end


def password_login # set up if statement - if no errors, continue, otherwise puts error and call method on itself again
    prompt = TTY::Prompt.new
    password = prompt.mask('Please enter your password')
    if @fan.password_validation(password) 
        main_menu
    else
        puts "Username and password don't match, please try again"
        user_login
    end
end

def new_fan
    prompt = TTY::Prompt.new
    first_name = prompt.ask('Please enter your first name')
    last_name = prompt.ask('Please enter your last name')
    username = prompt.ask('Please create your username')
    password = prompt.mask('Please create your password')
    Fan.create(first_name: first_name, last_name: last_name, username: username, password: password)
    main_menu
end

def main_menu
    prompt = TTY::Prompt.new
    choices = ["Add Gig", "Delete Gig", "View All Gigs", "View Future Gigs", "View Past Gigs", "View Past Gig Artists", "Logout"]
    choice = prompt.select("Please select from the following", choices)
        if choice == "Add Gig"
            add_gig
        elsif choice == "Delete Gig"
            delete_gig
        elsif choice == "View All Gigs"
            view_all_gigs
        elsif choice == "View Future Gigs"
            view_future_gigs
        elsif choice == "View Past Gigs"
            view_past_gigs
        elsif choice == "View Past Gig Artists"
            view_past_artists
        elsif choice == "Logout"
            welcome
    end
end

def delete_gig
    prompt = TTY::Prompt.new
    all_gigs = @fan.gigs
    choices = all_gigs.map{|gig| gig.name }
    choice = prompt.select("Please select from the following to delete", choices)
    deletion_choice = Gig.find_by name: choice
    deletion_choice.destroy
    @fan = Fan.find_by(username: @fan.username)
    puts "Gig deleted"
    main_menu
end

def view_future_gigs
    puts @fan.future_gigs_by_fan
    main_menu
end

def view_past_artists
    puts @fan.find_all_artists_seen
    main_menu
end

def view_all_gigs 
    all_gigs = @fan.gigs
    puts all_gigs.map{|gig| "#{gig.name} - #{gig.date}"}
    main_menu
end

def future_gigs_by_fan
    future_gigs = self.gigs.select {|gig| if gig.date != nil then gig.date > Date.today end}
    main_menu
 end

def view_past_gigs
    past_gigs = @fan.past_gigs_by_fan
    puts past_gigs.map {|gig| "#{gig.name}"} #ABSTRACT THIS OUT
    main_menu
end





end



# User will click to view all gigs
# User will select the gig they want to delete
# Gig gets deleted w/ confirmation message
# Go back to main menu