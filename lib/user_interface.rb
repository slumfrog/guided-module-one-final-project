class UserInterface

    def initialize
        @artist = nil
        @fan = nil
        @gig = nil
    end

def welcome
    prompt = TTY::Prompt.new
    choices = ["Existing", "New Fan"]
    choice = prompt.select("Welcome to MyGigs! Are you a new, or existing fan?", choices)
    if choice == "New Fan"
        new_fan
    else
        user_login
    end
end

def user_login # set up if statement - if no errors, continue, otherwise puts error and call method on itself again
    prompt = TTY::Prompt.new
    username = prompt.ask('Please enter your username', default: ENV['username'])
    if @fan = Fan.username_validation(username)
        password_login
    else
        puts "This username is not in our database, please try again or create a new account"
        user_login
    end
end

def password_login # set up if statement - if no errors, continue, otherwise puts error and call method on itself again
    prompt = TTY::Prompt.new
    password = prompt.mask('Please enter your password', default: ENV['username'])
    if password = @fan.password_validation(password) 
        main_menu
        binding.pry
    else
        puts "Username and password don't match, please try again"
        user_login
    end
end


def new_fan
    prompt = TTY::Prompt.new
    first_name = prompt.ask('Please enter your first name', default: ENV['First name'])
    last_name = prompt.ask('Please enter your last name', default: ENV['Last name'])
    username = prompt.ask('Please create your username', default: ENV['Username'])
    password = prompt.mask('Please create your password', default: ENV['Password'])
    Fan.create(first_name: first_name, last_name: last_name, username: username, password: password)
    main_menu
end



def main_menu
    prompt = TTY::Prompt.new
    choices = ["Add Gig", "Delete Gig", "View All Gigs", "View Future Gigs", "View Past Gigs", "Logout"]
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
        elsif choice == "Logout"
            welcome
        end
end

def delete_gig
    puts "Delete Gig"
end

def view_all_gigs
    Gig.all
end

def view_past_gigs
    puts "Past Gigs"
end

def view_future_gigs
    puts "Future Gigs"
end

def add_gig
    prompt = TTY::Prompt.new
    name = prompt.ask('Please enter the name of the concert/tour', default: ENV['USER'])
    artist_prompt = prompt.ask('Which artist is performing?')
    artist = Artist.find_artist(artist_prompt)
    fan_id = @fan.id
    city = prompt.ask('Which city is the concert in?', default: ENV['USER'])
    venue = prompt.ask('What is the venue name?', default: ENV['USER'])
    address = prompt.ask('What is the address of the venue?', default: ENV['USER'])
    # postcode = prompt.ask('What is the postcode of the venue?', default: ENV['USER'])
    date = prompt.ask('What date is the gig?')
    # start_time = prompt.ask('What time does the gig start?', default: ENV['USER'])
    # end_time = prompt.ask('What time does the gig end?', default: ENV['USER'])
    Gig.create(name: name, city: city, venue: venue, address: address, date: date, artist: artist, fan_id: fan_id) 
    main_menu
end

end