class WorldCuisines::Recipe
  attr_accessor :name, :url,:ingredients, :instructions
  @@all = []

  def self.all
    @@all
  end

  def initialize(recipe_hash)
    recipe_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(recipes_array)
    recipes.array.each {|recipe_hash| self.new(recipe_hash)}
  end

  def add_recipe_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def display_ingredients
    puts ""
    @ingredients.each do |i|
      puts "#{
      i}"
    end
    puts "__________________________________________________"
    puts ""
  end

  def display_instructions
    puts ""
    @instructions.each do |i|
      puts "#{i}"
    end
  end

  def display_recipe
    puts ""
    puts <<-DOC.gsub /^\s*/, ''
      #{@name}
      _______________
    DOC
    puts ""
    puts "Ingredients"
    display_ingredients
    puts "Instructions"
    display_instructions
  end
end
