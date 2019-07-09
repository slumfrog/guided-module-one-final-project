require 'date'

class Gig < ActiveRecord::Base
    belongs_to :fan
    belongs_to :artist

    # returns all gigs that occured before the current date

    def self.past_gigs
        self.all.select {|gig| gig.date < Date.today}
    end

    # returns all gigs that occured after the current date

    def self.future_gigs
        self.all.select {|gig| gig.date > Date.today}
    end

    # returns gigs when search by id

    def self.find_by_id(id)
        self.all.select {|gig| gig.fan_id == id}
    end

end