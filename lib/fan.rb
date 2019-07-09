class Fan < ActiveRecord::Base
   has_many :gigs
   has_many :artists, through: :gigs

   # def self.all_fan_usernames
   #    self.all.map {|fan| fan.username}
   # end

   # def self.all_fan_passwords
   #    self.all.map {|fan| fan.password}
   # end

   def self.username_validation(user_input)
       self.all.find_by(username: user_input)
   end

   def password_validation(user_input)
      self.password == user_input
   end

   # def self.fan_first_names
   #    self.all.map {|fan| fan.first_name}
   # end

   def past_gigs_by_fan
      past_gigs = self.gigs.select {|gig| if gig.date != nil then gig.date < Date.today end}
   end

   def print_gigs_by_name
      past_gigs_by_fan.map {|gig| "#{gig.name} - #{gig.date}"}
   end

   def future_gigs_by_fan
      future_gigs = self.gigs.select {|gig| if gig.date != nil then gig.date > Date.today end}
      future_gigs.map {|gig| "#{gig.name} - #{gig.date}"}
   end

   # A user can see a list of all artists they’ve attended gigs for
   def find_all_artists
      self.gigs.map{|gig| gig.artist.name}
   end

   def find_all_artists_seen
      past_gigs_by_fan.map {|gig| gig.artist.name}
   end

end





