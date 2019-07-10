class Artist < ActiveRecord::Base
    has_many :gigs
    has_many :fans, through: :gigs

    def self.find_artist(artist_prompt)
        self.find_by name: artist_prompt
    end

    
    #find all gigs from an artist that are in the future
    #first find all gigs of an artist
    #
    
    def past_gigs_by_artist
        past_gigs = Gig.all.select {|gig| if gig.date != nil then gig.date < Date.today end}
        past_gigs.select {|gig| gig.artist == self}
     end


     def future_gigs_by_artist
        past_gigs = Gig.all.select {|gig| if gig.date != nil then gig.date > Date.today end}
        past_gigs.select {|gig| gig.artist == self}
     end

    # def future_gigs_by_artist
    #     all_artist_gigs = Gig.all.select{|gig| gig.artist  == self}
    #     puts all_artist_gigs.map{|gig| gig.date > Date.today}
    # end



    #this works
    def find_fans_of_artist
       all_artist_gigs = Gig.all.select{|gig| gig.artist  == self}
       all_artist_gigs.map{|gig| "#{gig.fan.first_name} aka #{gig.fan.username}"}
    end



end

