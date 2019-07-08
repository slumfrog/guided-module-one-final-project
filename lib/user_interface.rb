def welcome
    prompt = TTY::Prompt.new
    choices = ["Existing", "New Fan"]
    user = prompt.select("Welcome to MyGigs! Are you a new, or existing fan?", choices)
    if user == "New Fan"
        new_fan
    else
        user_login
    end
end

def user_login # set up if statement - if no errors, continue, otherwise puts error and call method on itself again
    prompt = TTY::Prompt.new
    username = prompt.ask('Please enter your username', default: ENV['username'])
    password = prompt.mask('Please enter your password', default: ENV['password'])
    fan = Fan.username_validation(username)
    if fan.password_validation(password) 
        main_menu
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

def add_gig
    prompt = TTY::Prompt.new
    name = prompt.ask('Please enter the name of the concert/tour', default: ENV['USER'])
    artist = prompt.ask('Which artist is performing?')
    city = prompt.ask('Which city is the concert in?', default: ENV['USER'])
    venue = prompt.ask('What is the venue name?', default: ENV['USER'])
    address = prompt.mask('What is the address of the venue?', default: ENV['USER'])
    postcode = prompt.ask('What is the postcode of the venue?', default: ENV['USER'])
    date = prompt.ask('What date is the gig?', default: ENV['MM-DD-YY'])
    start_time = prompt.ask('What time does the gig start?', default: ENV['USER'])
    end_time = prompt.mask('What time does the gig end?', default: ENV['USER'])
    Gig.create(name: name, city: last_name, username: username, password: password)
end

def delete_gig
    puts "Delete Gig"
end

def view_all_gigs
    Gig.all
end

def view_past_gigs
    puts "View Past Gigs"
end

def view_future_gigs
    puts "Future Gigs"
end

def main_menu
    prompt = TTY::Prompt.new
    choices = ["Add Gig", "Delete Gig", "View All Gigs", "View Future Gigs", "View Past Gigs", "Logout"]
    user = prompt.select("Please select from the following", choices)
    if user == "Add gig"
        add_gig
    elsif user == "View All Gigs"
        view_all_gigs
    elsif user == "View Future Gigs"
        view_future_gigs
    elsif user == "View Past Gigs"
        view_past_gigs
    elsif user == "Logout"
        welcome
    end
end



