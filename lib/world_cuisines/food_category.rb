class WorldCuisines::FoodCategory
    attr_accessor :name, :url, :recipes
    @@all = []

  def self.all
    @@all
  end

  def initialize(food_category_hash)
    food_category_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.new_from_collection(food_category_array)
    food_category_array.each {|food_category_hash| self.new(food_category_hash)}
  end

  def add_recipes(recipes_hash)
    WorldCuisines::Recipe.new_from_collection(recipes_hash)
  end

  def list_recipes
    recipes
    self.recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end
end
