# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create(
  [
    {
      name: 'Ruth Bradley',
      email: 'ruth_bradley@testmail.com',
      password: 'ruth_bradley_pass'
    },
    {
      name: 'Leticia Barrett',
      email: 'leticia_barrett@testmail.com',
      password: 'leticia_barrett_pass'
    },
    {
      name: 'Kaiden Carlson',
      email: 'kaiden_carlson@testmail.com',
      password: 'kaiden_carlson_pass'
    },
    {
      name: 'Aubree Rojas',
      email: 'aubree_rojas@testmail.com',
      password: 'aubree_rojas_pass'
    },
    {
      name: 'Trevon Rich',
      email: 'trevon_rich@testmail.com',
      password: 'trevon_rich_pass'
    }
  ]
)

puts "#{users.count} users created"

def create_recipe(recipe_name, user_in, public)
  Recipe.create(
    name: "#{recipe_name} recipe",
    preparation_time_seconds: 10.minute.second,
    cooking_time_seconds: 5.minute.second,
    description: "my only and unique #{recipe_name} recipe",
    public:,
    user: user_in
  )
end

def create_hot_dog_with_ingredients(foods, user_in)
  completed_recipe = create_recipe('hot dog', user_in, user_in.id.even?)
  incompleted_recipes = create_recipe('salad', user_in, user_in.id.odd?)

  puts "  inserting completed recipe ingredients"
  RecipeFood.create(
    amount: 1,
    food: Food.find_by_name('sausage'),
    recipe: completed_recipe
  )
  puts "    inserted sausage"

  RecipeFood.create(
    amount: 1,
    food: Food.find_by_name('hot dog breat'),
    recipe: completed_recipe
  )
  puts "    inserted hot dog breat"

  foods.each do |food|
    next if food.name == 'sausage' 
    next if food.name == 'hot dog breat'
    RecipeFood.create(
      amount: 10 + (user_in.id % 5),
      food:,
      recipe: completed_recipe
    )
    puts "    inserted #{food.name}: #{food.id} "
  end

  puts "  inserting incompleted recipe ingredients"

  cabbage = Food.find_by_name('Cabbage')

  RecipeFood.create(
    amount: 5 + (user_in.id % 5),
    food: cabbage,
    recipe: incompleted_recipes
  )
  puts "    inserted #{cabbage.name}: #{cabbage.id} "
  
  onions = Food.find_by_name('Onion')

  RecipeFood.create(
    amount: 5 + (user_in.id % 5),
    food: onions,
    recipe: incompleted_recipes
  )

  puts "    inserted #{onions.name}: #{onions.id} "

  tomatoes = Food.create(
    name: 'Tomatoes',
    unit: 'piece',
    price: '1010.1010',
    quantity: 0,
    user: user_in
  )

  RecipeFood.create(
    amount: 5 + (user_in.id % 5),
    food: tomatoes,
    recipe: incompleted_recipes
  )

  puts "    inserted #{tomatoes.name}: #{tomatoes.id} "
end

def user_create_foods_and_recipes(user_in)

  puts "inserting recipes and food to #{user_in.name}"

  # gram kilogram liter milliliter piece
  foods = Food.create([
                        {
                          name: 'sausage',
                          unit: 'piece',
                          price: '1.1',
                          quantity: 2,
                          user: user_in
                        },
                        {
                          name: 'Mayonnaise',
                          unit: 'milliliter',
                          price: '2.2',
                          quantity: 500,
                          user: user_in
                        },
                        {
                          name: 'Onion',
                          unit: 'gram',
                          price: '3.3',
                          quantity: 30,
                          user: user_in
                        },
                        {
                          name: 'Ketchup',
                          unit: 'milliliter',
                          price: '4.4',
                          quantity: 300,
                          user: user_in
                        },
                        {
                          name: 'Cabbage',
                          unit: 'gram',
                          price: '5.5',
                          quantity: 100,
                          user: user_in
                        },
                        {
                          name: 'hot dog breat',
                          unit: 'piece',
                          price: '6.6',
                          quantity: 2,
                          user: user_in
                        }
                      ])

  puts "  #{foods.count} foods create for #{user_in.name}"

  create_hot_dog_with_ingredients(foods, user_in)
end

users.each do |user|
  user_create_foods_and_recipes user
end
