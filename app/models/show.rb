class Show < ActiveRecord::Base
    # return the highest value in the ratings column.
    def self.highest_rating
        self.maximum(:rating)
    end

    # return the show with the highest rating.  hint: use highest_rating method
    def self.most_popular_show
        self.where("rating = ?", self.highest_rating).first
    end

    # returns the lowest value in the ratings column.
    def self.lowest_rating
        self.minimum(:rating)
    end

    # returns the show with the lowest rating.
    def self.least_popular_show
        self.where("rating = ?", self.lowest_rating).first
    end

    # sum of all of the ratings.
    def self.ratings_sum
        self.sum(:rating)
    end
        
    # returns an array of all shows where rating > 5.
    def self.popular_shows
        self.where("rating > ?", 5)
    end

    # returns array of all shows sorted by names. hint: use the order Active Record method.
    def self.shows_by_alphabetical_order
        self.order(:name)
    end

end
