How to Build a CLI Gem

Plan your gem, imagine your interface
Start with the project structure - google
Start with the entry point - the file run
force that to build the CLI interface
stub out the interface
start making things real
discover objects.
program
Plan Before Project Idea Approval Meeting An overall summary of the application. What is your application going to do? Pull up a list of world cuisines, types of food and recipe details

Try to create skeleton app and repository on github Halfway done

Here is a video showing how to do so: https://instruction.learn.co/student/video_lectures#/319

Complete these questions to the best of your ability:

What website will you be scraping? allrecipes

What will you need to do with the data you return from scraping? create a world-cuisine class with attritubes of name and food-categories, food-category class with attribute of name and recipes and recipe class with attributes of name, serving size, cooking time, picture link, ingredients and instructions

What classes will you be using? World_Cuisine Food_Category Recipe

What will be the flow of displaying data for your application. ex How will your CLI portion work. Refer to section below

How will you display data one level deep to the user? Specific Recipe details

What will need to be in your README file? Basic Description, installation instructions, usage, licence, contributing, development, code of conduct

-A command line interface for top recipes by culture and food category based on al recipes website

user types in world-recipes

Show a list of World cuisines

Mexican
Indian
Korean
American
Japanese
Which world culture do you want to see recipes for?

1

List of Mexican types of foods


Show list of top mexican recipes

Abuelita chocolate
Arroz con leche
Champurado
tamales dulces
Which rceipe would you like to see?

2

Show recipe name, ingredients, instructions

Arroz Con leche

1 cup milk 1 stick cinnamon 1 cup rice 1/4 cup condensed milk

Instructions

Bring the rice, butter, and water to a boil in a large saucepan over high heat. Reduce heat to medium-low, cover, and simmer until the rice is tender, and the liquid has been absorbed, 20 to 25 minutes. 2.Whisk together 2 cups of milk, flour, sugar, egg, and vanilla extract in a bowl, and pour the milk mixture over the cooked rice. Stir to combine, and simmer over low heat for 15 minutes. Stir in 1 cup whole milk, the cream, raisins, and cinnamon until thoroughly mixed, and allow to cool for a few minutes. Serve warm or cold.
If you would like to see more recipes select from the following options, otherwise enter exit.

Mexican Desserts
Mexican cuisine
World cuisines
What is a cuisine?

-A country has a name -A country has recipes -A country has a URL

Example: india country name: Indian URL: https//:allrecipes.com/Indian recipes: tikki masala, naan, butter chicken

What is a recipe? -A recipe has a name -A recipe has ingredients -A recipe has instructions
