require "pry"

class Show < ActiveRecord::Base
    def self.highest_rating 
        self.maximum(:rating)
    end 

    def self.most_popular_show
        highest_rating = self.highest_rating
        self.all.find do |show| 
            show.rating == highest_rating
        end
    end 

    def self.lowest_rating 
        self.minimum(:rating)
    end 

    def self.least_popular_show
        lowest_rating = self.lowest_rating
        self.all.find do |show| 
            show.rating == lowest_rating
        end
    end 

    def self.ratings_sum
        self.sum(:rating)
    end 

    def self.popular_shows 
        self.where("rating > 5")
    end 

    def self.shows_by_alphabetical_order
        self.all.order(:name)
    end 
end 

#add_column(table_name, column_name, type, options = {}) public