class Show < ActiveRecord::Base
    def self.highest_rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        self.find_by(rating: self.highest_rating)
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.find_by(rating: self.lowest_rating)
    end

    def self.ratings_sum
        self.all.reduce(0) do |total, show|
            total += show.rating
        end
        #self.sum(:rating)
    end

    def self.popular_shows
        self.all.find_all do |show|
            show.rating > 5
        end
        #self.where("rating >= ?", 5)
    end

    def self.shows_by_alphabetical_order
        self.all.order(:name)
    end
end