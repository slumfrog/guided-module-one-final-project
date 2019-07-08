class Fan < ActiveRecord::Base
   has_many :gigs
   has_many :artists, through: :gigs

   def self.all_fan_usernames
      self.all.map {|fan| fan.username}
   end

end





