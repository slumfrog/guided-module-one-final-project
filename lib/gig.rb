require 'date'

class Gig < ActiveRecord::Base
    belongs_to :fan
    belongs_to :artist

    # returns all gigs that occured before the current date
    
    # def self.past_gigs
    #     self.all.select {|gig| if gig.date != nil then gig.date < Date.today end}
    # end

    # returns all gigs that occured after the current date

    # def self.future_gigs
    #     self.all.select {|gig| if gig.date != nil then gig.date > Date.today end}
    # end

    
    # # returns all gigs that occured after the current date

    # def future_gigs_by_fan
    #     self.all.select {|gig| if gig.date != nil then gig.date > Date.today end}
    # end


end