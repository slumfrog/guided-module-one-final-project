class Artist < ActiveRecord::Base
    has_many :gigs
    has_many :fans, through: :gigs

    def self.find_artist(artist_prompt)
        self.find_by name: artist_prompt
    end

    # def find_fans_of_artist(artist)                           #take an argument of artist
    #    all_artists = Gig.all.select{|gig| gig.artist == self}
    #                                                           # Select will return a only an array of what matches our condition
    # end                                                       # Find all gigs with Gig.all | refer to each instance of Gig as 'gig' | if Gig.artist == self(an artist) return an array of these artist        
end

