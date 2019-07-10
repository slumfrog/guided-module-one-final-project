class Fan < ActiveRecord::Base
   has_many :gigs
   has_many :artists, through: :gigs

   # def self.all_fan_usernames
   #    self.all.map {|fan| fan.username}
   # end

   # def self.all_fan_passwords
   #    self.all.map {|fan| fan.password}
   # end

   # def self.fan_first_names
   #    self.all.map {|fan| fan.first_name}
   # end

   #username validation - takes a user input as an argument. Uses self (Looks at all instances of Fan, looks at each username and finds the user by whether the user input matches the username)
   def self.username_validation(user_input)
       self.all.find_by(username: user_input)
   end

   #password validation - takes a user input (password attempt) as an argument, looks in to the instance of fan we are in, and checks to see if that instance's password matches the user input
   def password_validation(user_input)
      self.password == user_input
   end

   def all_gigs #Gives you all of a fans gigs
      all_gigs = self.gigs
      puts all_gigs.map{|gig| "#{gig.name} - #{gig.date}"}
   end

   def past_gigs_by_fan #Gives you a fans gigs from the past - shows name and date
      past_gigs = self.gigs.select {|gig| if gig.date != nil then gig.date < Date.today end}
   end

   def print_past_gigs_by_fan
      puts past_gigs_by_fan.map {|gig| "#{gig.name} - #{gig.date}"}
   end

   def future_gigs_by_fan #gives you a fans future gigs - shows name and date
      self.gigs.select {|gig| if gig.date != nil then gig.date > Date.today end}
   end

   def print_future_gigs_by_fan
      future_gigs_by_fan.map {|gig| "#{gig.name} - #{gig.date}"}
   end

   def find_all_artists_seen
      past_gigs_by_fan.map {|gig| gig.artist.name}
   end
   
end





