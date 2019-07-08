class Artist < ActiveRecord::Base
    has_many :gigs
    has_many :fans, through: :gigs
end
