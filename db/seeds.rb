# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
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
    },
])

def create_hot_dog_with_ingredients(foods, user_in)
    recipe = Recipe.create(
        name: "#{user_in.name}'s unique hot dog recipe",
        preparation_time_seconds: 10.minute.second,
        cooking_time_seconds: 5.minute.second,
        description: "my only and unique hot dog recipe",
        public: user_in.id % 2 == 0,
        user: user_in
    )
    

    foods.each do |food|
        RecipeFood.create(
            quantity: 10 + (user_in.id % 5),
            food:,
            recipe:
        )
    end
end


def user_create_foods_and_recipes(user_in)
    foods = Food.create([
        {
            name: "sausage",
            unit: "unit",
            price: "1.1",
            quantity: 2,
            user: user_in
        },
        {
            name: "Mayonnaise",
            unit: "ml",
            price: "2.2",
            quantity: 500,
            user: user_in
        },
        {
            name: "Onion",
            unit: "g",
            price: "3.3",
            quantity: 30,
            user: user_in
        },
        {
            name: "Ketchup",
            unit: "ml",
            price: "4.4",
            quantity: 300,
            user: user_in
        },
        {
            name: "Cabbage",
            unit: "g",
            price: "5.5",
            quantity: 100,
            user: user_in
        },
        {
            name: "hot dog breat",
            unit: "unit",
            price: "6.6",
            quantity: 2,
            user: user_in
        }
    ])

    create_hot_dog_with_ingredients(foods, user_in)
end

users.each do |user|
    user_create_foods_and_recipes user
end