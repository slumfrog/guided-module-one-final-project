class Fan < ActiveRecord::Base
   has_many :gigs
   has_many :artists, through: :gigs

   def self.all_fan_usernames
      self.all.map {|fan| fan.username}
   end

   def self.all_fan_passwords
      self.all.map {|fan| fan.password}
   end

   def self.username_validation(user_input)
       self.all.find_by(username: user_input)
   end

   def password_validation(user_input)
      self.password == user_input
   end

   def self.fan_first_names
      self.all.map {|fan| fan.first_name}
   end

end





