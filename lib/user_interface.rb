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
    username = prompt.ask('Please enter your username', default: ENV['USER'])
    password = prompt.mask('Please enter your password', default: ENV['USER'])
    main_menu
end


def new_fan
    prompt = TTY::Prompt.new
    first_name = prompt.ask('Please enter your first name', default: ENV['USER'])
    last_name = prompt.ask('Please enter your last name', default: ENV['USER'])
    username = prompt.ask('Please create your username', default: ENV['USER'])
    password = prompt.mask('Please create your password', default: ENV['USER'])
    Fan.create(first_name: first_name, last_name: last_name, username: username, password: password)
    main_menu
end

def add_gig
    Gig.create(first_name: first_name, last_name: last_name, username: username, password: password)
end

def delete_gig
end

def view_all_gigs
end

def view_past_gigs
end

def view_future_gigs
end

def main_menu
    puts "does this work"
end



