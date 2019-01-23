class WorldRecipes::CLI

  def run
    make_countries
    add_recipes_to_countries
    add_attributes_to_recipes
    @input = []
    start
  end

  def start
    country
    recipe
    options
  end

  def make_countries
    countries_array ||= WorldRecipes::Scraper.scrape_countries
    WorldRecipes::Country.new_from_collection(countries_array)
  end

  def add_recipes_to_countries
    WorldRecipes::Country.all.each do |country|
      recipes ||= WorldRecipes::Scraper.scrape_recipes(country.url)
      country.add_recipes(recipes)
    end
  end

  def add_attributes_to_recipes
    WorldRecipes::Recipe.all.shift
    WorldRecipes::Recipe.all.each do |recipe|
      attributes = WorldRecipes::Scraper.scrape_recipe_page(recipe.url)
      recipe.add_recipe_attributes(attributes)
    end
  end


  def list_countries
     puts "Top World Recipes"
     @countries = WorldRecipes::Country.all
     @countries.each.with_index(1) do |country, i|
       puts "#{i}. #{country.name}"
    end
  end

  def country
    list_countries
    puts ""
    puts "Enter the number of the country you'd like to see recipes on or type exit:"
    @input << gets.strip.downcase
    if @input.last.to_i > 0 && @input.last.to_i <= @countries.length.to_i
      @countries[@input.last.to_i-1].list_recipes
    elsif @input.last == "exit"
      goodbye
      exit
    else
      puts ""
      puts "Not sure what you want."
      puts ""
      country
    end
  end

  def recipe
    puts ""
    puts "Enter the number of the recipe you'd like to see,
         type back to see country list again or type exit:"
    @input << gets.strip.downcase
    i = @input[(@input.length) - 2]
    recipes = @cuisines[i.to_i-1].recipes
    if @input.last.to_i > 0 && @input.last.to_i <= recipes.length.to_i
      recipes[@input.last.to_i-1].display_recipe
    elsif @input.last == "back"
      start
    elsif @input.last == "exit"
      goodbye
      exit
    else
      puts ""
      puts "Not sure what you want."
      puts ""
      @input.pop
      @countries[@input.last.to_i-1].list_recipes
      country
    end
  end

  def options
    puts ""
    puts "Would you like to see more recipes? Type Y or N."
    input = gets.strip
    if input == "Y" || input == "y"
      start
    elsif input == "N" || input == "n"
      goodbye
      exit
    else
      puts ""
      puts "Not sure what you want."
      puts ""
      options
    end
  end

  def goodbye
    puts "See you later for more recipes!!"
  end
end
