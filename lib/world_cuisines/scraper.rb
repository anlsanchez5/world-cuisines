require 'pry'
class WorldCuisines::Scraper

  def self.get_page
    Nokogiri::HTML(open("http://www.world-recipes.info/"))
  end

  def self.scrape_page_index
    get_cuisine_page.css("")
  end

  def self.scrape_countries
    names = []
    scrape_page_index.each do |c|
      names << c.css("").text
    end
    urls = []
    scrape_page_index.each do |c|
      urls << c.attribute("href").text
    end

    countries = []
    names.each { |name| countries << {:name => name}}
    u = 0
    urls.each {|url| countries[u][:url] = url; u += 1}
    cuisines
  end

  def self.get_recipes_page(link)
    recipes_page ||= Nokogiri::HTML(open("#{link}"))
    recipes_page
  end

  def self.scrape_recipes_index(link)
    page_index ||= get_food_recipes_page(link).css("a.grid-col--subnav")
    page_index
  end

  def self.scrape_recipes(link)
    names = []
    scrape_recipes_index(link).each do |r|
      names << r.css("").text
    end
    urls = []
    scrape_recipes_index(link).each do |r|
      urls << r.attribute("href").text
    end

    recipes = []
    names.each {|name| recipes << {:name => name}}
    u = 0
    urls.each {|url| recipes[u][:url] = url; u += 1}
    recipes
  end

  def self.scrape_recipe_attributes(url)
    doc = Nokogiri::HTML(open(url))

    ingredients = []
    ing_index = doc.css("")
    ing_index.each do |i|
      ingredients << i.text
    end

    instructions = []
    ins_index= doc.css("")
    ins_index.each do |s|
      instructions << s.text
    end


    recipe_attributes = {
      :ingredients => ingredients,
      :instructions => instructions
    }
    recipe_attributes
  end
end
