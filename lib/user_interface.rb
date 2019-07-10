class UserInterface

    def initialize
        @artist = nil
        @fan = nil
        @gig = nil
    end

def welcome
    system "clear" 
    str = "
    .-..-.       .--.  _             
    : `' :      : .--':_;            
    : .. :.-..-.: : _ .-. .--.  .--. 
    : :; :: :; :: :; :: :' .; :`._-.'
    :_;:_;`._. ;`.__.':_;`._. ;`.__.'
           .-. :          .-. :      
           `._.'          `._.'      ".colorize(:color => :white, :background => :red)
	puts str
    prompt = TTY::Prompt.new
    choices = ["Existing".colorize(:red), "New Fan".colorize(:yellow)]
    choice = prompt.select("Welcome to MyGigs! Are you a new, or existing fan?".colorize(:white), choices)
    if choice == "New Fan".colorize(:yellow)
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
    @fan = Fan.create(first_name: first_name, last_name: last_name, username: username, password: password)
    main_menu
end

# def modify_fan
#     prompt = TTY::Prompt.new
#     choices = ["First Name".colorize(:yellow), "Last Name".colorize(:red), "Username".colorize(:magenta), "Password".colorize(:cyan)]
#     choice = prompt.select("Which field would you like to update?", choices)
#     Fan.create(first_name: first_name, last_name: last_name, username: username, password: password)
#     main_menu
# end

def main_menu
    prompt = TTY::Prompt.new
    choices = ["Add Gig".colorize(:yellow), "Delete Gig".colorize(:red), "View All Gigs".colorize(:magenta), "View Future Gigs".colorize(:cyan), "View Past Gigs".colorize(:blue), "View Past Gig Artists".colorize(:white), "Logout".colorize(:red)]
    choice = prompt.select("Please select from the following", choices)
        if choice == "Add Gig".colorize(:yellow)
            add_gig
        elsif choice == "Delete Gig".colorize(:red)
            delete_gig
        elsif choice == "View All Gigs".colorize(:magenta)
            view_all_gigs
        elsif choice == "View Future Gigs".colorize(:cyan)
            view_future_gigs
        elsif choice == "View Past Gigs".colorize(:blue)
            view_past_gigs
        elsif choice == "View Past Gig Artists".colorize(:white)
            view_past_artists
        elsif choice == "View Past Gig Artists".colorize(:white)
            view_past_artists
        elsif choice == "Logout".colorize(:red)
            welcome
    end
end

    def add_gig
        prompt = TTY::Prompt.new
        name = prompt.ask('Please enter the name of the concert/tour', default: ENV['USER'])
        artist_prompt = prompt.ask('Which artist is performing?')
        artist = Artist.find_artist(artist_prompt)
        city = prompt.ask('Which city is the concert in?', default: ENV['USER'])
        venue = prompt.ask('What is the venue name?', default: ENV['USER'])
        address = prompt.ask('What is the address of the venue?', default: ENV['USER'])
        # postcode = prompt.ask('What is the postcode of the venue?', default: ENV['USER'])
        date = prompt.ask('What date is the gig?')
        # start_time = prompt.ask('What time does the gig start?', default: ENV['USER'])
        # end_time = prompt.ask('What time does the gig end?', default: ENV['USER'])
        Gig.create(name: name, city: city, venue: venue, address: address, date: date, artist: artist, fan: @fan)
        @fan = Fan.find_by(username: @fan.username) #refresh so that we see the gig immediately populate
        main_menu
    end

    def delete_gig
        prompt = TTY::Prompt.new
        all_gigs = @fan.gigs
        if @fan.gigs == []
            puts "You don't have any gigs to delete"
            main_menu
        else
            
        choices = [all_gigs.map{|gig| gig.name}, "Main Menu".colorize(:white)]
        choice = prompt.select("Please select from the following to delete", choices)
            if choice == "Main Menu".colorize(:white)
                main_menu
            else
                deletion_choice = Gig.find_by name: choice
                deletion_choice.destroy
                @fan = Fan.find_by(username: @fan.username) #refresh so that we see the gig immediately populate
                puts "Gig deleted"
            end
        end
    end

    def view_all_gigs
        puts @fan.all_gigs
        main_menu
    end

    def view_future_gigs
        puts @fan.print_future_gigs_by_fan
        main_menu
    end

    def view_past_gigs
        @fan.print_past_gigs_by_fan
        main_menu
    end

    def view_past_artists
        puts @fan.find_all_artists_seen
        main_menu
    end

end



# User will click to view all gigs
# User will select the gig they want to delete
# Gig gets deleted w/ confirmation message
# Go back to main menu