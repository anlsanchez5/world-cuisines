require 'pry'
class WorldCuisines::Country
  attr_accessor :name, :url, :recipes
  @@all = []


  def initialize(cuisine_hash)
    cuisine_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_collection(cuisines_array)
    cuisines_array.each {|cuisine_hash| self.new(cuisine_hash)}
  end

  def self.all
    @@all
  end

def add_recipes(recipes_hash)
  WorldCuisines::Recipes.new_from_collection(recipes_hash)
end

  def list_recipes
    @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{category.name}"
    end
  end
end
