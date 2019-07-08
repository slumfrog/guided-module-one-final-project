class Gig < ActiveRecord::Base
    belongs_to :fan
    belongs_to :artist

    def self.past_gigs
        current_date = Date.today.to_s
        self.all.select {|gig| gig.date < current_date}
    end
end