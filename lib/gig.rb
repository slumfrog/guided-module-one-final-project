require 'date'

class Gig < ActiveRecord::Base
    belongs_to :fan
    belongs_to :artist

end