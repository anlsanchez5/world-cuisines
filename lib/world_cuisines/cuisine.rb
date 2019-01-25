require 'pry'
class WorldCuisines::Cuisine
  attr_accessor :name, :url, :food_categories
  @@all = []


  def initialize(cuisine_hash)
    cuisine_hash.each {|key, value| self.send(("#{key}="), value)}
    @food_categories = []
    @@all << self
  end

  def self.new_from_collection(cuisines_array)
    cuisines_array.each {|cuisine_hash| self.new(cuisine_hash)}
  end

  def self.all
    @@all
  end

def add_food_categories(food_category)
  @food_categories << food_category
#  WorldCuisines::FoodCategory.new_from_collection(food_categories_hash)
end

  def list_food_categories
    @food_categories.each.with_index(1) do |food_category, i|
      puts "#{i}. #{food_category.name}"
    end
  end
end
