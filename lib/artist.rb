class Artist < ActiveRecord::Base
    has_many :gigs
    has_many :fans, through: :gigs

    def self.find_artist(artist_prompt)
        self.find_by name: artist_prompt
    end
end
