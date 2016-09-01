# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'bcrypt'

# need more soil diversity:
# clay soil (summer crop veggies like beans, corn, cucumbers, melons, peppers, tomatoes and squash)
# sandy soil (veggie root crops like carrots, parsnips and potatoes as well as lettuce, strawberries, peppers, corn, squash, zucchini, and tomatoes)
# silty soil (most can do well if provided with adequate drainage)
# peaty soil (broccoli, cabbage, cauliflower, legumes, root crops and salad crops*)
# chalky soil (spinach, beets, sweetcorn and cabbage)
# loamy soil (rotating crops****)

# test to determine soil type: http://learn.eartheasy.com/2013/06/how-to-make-the-most-of-your-soil-type/

VEGGIES = [
  {name: "beets", soil: "loamy, sandy, peaty, chalky", space: "6 inches", hardinesszone: "2, 3, 4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "onions, lettuce, cabbage, cauliflower, broccoli, garlic, sage, tomatoes", foes: "beans"},
  {name: "broccoli", soil: "loamy, sandy, peaty", space: "24 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, onions, beets, garlic, lettuce, cucumbers, potatoes, sage, mint, rosemary, thyme, basil, dill, nasturtiums, marigolds, tomatoes", foes: "basil, peas, oregano, strawberries, tomatoes"},
  {name: "cabbage", soil: "loamy, sandy, peaty, chalky", space: "18 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "outdoors", special: "needs hardening off", deep: " ", time: " ", photo: " ", companions: "beets, onions, cucumbers, dill, mint, oregano, rosemary, kale, lettuce, potatoes, sage, spinach, thyme, garlic, nasturtiums, peas", foes: "beans, basil, peppers, strawberries, tomatoes"},
  {name: "carrots", soil: "loamy, sandy, peaty", space: "6inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, garlic, onions, lettuce, peas, parsley, peppers, rosemary, sage, tomatoes", foes: "dill"},
  {name: "cauliflower", soil: "loamy, peaty", space: "18 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, cucumbers, garlic, cabbage, beets, peas, tomatoes, potatoes, rosemary, spinach, nasturtiums, onions, sage, thyme", foes: "basil, tomatoes, strawberries"},
  {name: "corn", soil: "loamy, clay, sandy, chalky", space: "12 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, cucumbers, lettuce, watermelon, cantaloupe, peas, potatoes, parsley, pumpkins, zucchini, squash, sunflowers, marigolds", foes: "tomatoes"},
  {name: "kale", soil: "loamy, peaty", space: "10 inches", hardinesszone: "6, 7, 8, 9, 10, 11", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beets, beans, cucumbers, garlic, lettuce, mint, nasturtiums, onions, spinach, thyme, cabbage, dill, potatoes, rosemary, sage", foes: "basil, strawberries, tomatoes"},
  {name: "lettuce", soil: "loamy, sandy, peaty", space: "13 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10, 11, 12", sunShine: "partial", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, corn, onions, broccoli, cucumbers, cabbage, beets, carrots, peas, potatoes, spinach, strawberries, sunflowers, marigolds, tomatoes", foes: "parsley, cabbage"},
  {name: "onions", soil: "loamy", space: "10 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beets, broccoli, cabbage, carrots, lettuce, peppers, potatoes, spinach, tomatoes, rosemary, strawberries", foes: "beans, peas"},
  {name: "peas", soil: "loamy, peaty", space: "6 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full, partial", start: "outdoors", special: "needs trellis", deep: " ", time: " ", photo: " ", companions: "beans, corn, cabbage, cucumbers, lettuce, carrots, melons, potatoes, spinach, sage", foes: "onions, garlic"},
  {name: "pumpkins", soil: "loamy, sandy, well-drained", space: "12 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, corn", foes: "potatoes"},
  {name: "squash", soil: "loamy, clay, sandy", space: "18 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10, 11, 12", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, corn, strawberries", foes: "potatoes, pumpkins"},
  {name: "swiss_chard", soil: "loamy, peaty", space: "10 inches", hardinesszone: "5, 6, 7, 8, 9, 10", sunShine: "full, partial", start: " ", special: " ", deep: " ", time: " ", photo: " ", companions: " ", foes: " "},
  {name: "tomatoes", soil: "loamy, clay, sandy", space: "16 inches", hardinesszone: "2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12", sunShine: "full", start: "indoors", special: "needs support", deep: " ", time: " ", photo: " ", companions: "onions, garlic, peppers, lettuce, carrots, basil, marigolds, melons, parsley, spinach, thyme", foes: "beans, broccoli, cabbage, corn, dill, potatoes, rosemary, peas, beets"},
  {name: "zucchini", soil: "loamy, sandy", space: "16 inches", hardinesszone: "5, 6, 7, 8, 9", sunShine: "full", start: "indoor", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, nasturtiums, parsley, spinach, lavendar, sage, marigolds, rosemary", foes: " "},
]

VEGGIES.each do |veggie|
  Veggie.create(veggie)
end

FRUITS = [
  {name: "cantaloupe", soil: "loamy, clay, sandy", space: "36 - 42 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "inside", special: " ", deep: " ", time: " ", photo: " ", companions: "corn, tomatoes, nasturtiums, peas, sunflowers", foes: "potatoes"},
  {name: "strawberries", soil: "loamy, sandy", space: "20 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, lettuce, spinach", foes: "broccoli, cabbage, cauliflower"},
  {name: "watermelon", soil: "clay, sandy", space: "24 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "corn, tomatoes, nasturtiums, peas, sunflowers", foes: "potatoes"},
]

FRUITS.each do |fruit|
  Fruit.create(fruit)
end

HERBS = [
  {name: "basil", soil: "peaty, loamy", space: "10 - 12 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "broccoli, peppers, tomatoes, marigolds", foes: "cucumbers, beans, broccoli, cauliflower, cabbage"},
  {name: "cilantro", soil: "peaty, loamy", space: "1 - 2 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10", sunShine: "full, partial", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "cabbage, spinach, parsley, peas, potatoes, lettuce, tomatoes", foes: "cucumbers, dill"},
  {name: "dill", soil: "loamy", space: "18 inches", hardinesszone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "broccoli, cauliflower, corn, lettuce, onions, cabbage, kale, spinach, cucumbers", foes: "carrots, cilantro, tomatoes"},
  {name: "mint", soil: "loamy", space: "24 inches", hardinesszone: "4, 5, 6, 7, 8, 9", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "broccoli, cabbage, cauliflower, peas, squash, tomatoes", foes: "cucumbers"},
  {name: "oregano", soil: "loamy", space: "8 - 10 inches", hardinesszone: "5, 6, 7, 8, 9, 10, 11, 12", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "cabbage, tomatoes, carrots, peppers, squash, spinach, potatoes, peas, beans, beets, lettuce, onions, garlic", foes: "broccoli, cucumbers"},
  {name: "parsley", soil: "loamy, peaty", space: "6 - 8 inches", hardinesszone: "6, 7, 8, 9", sunShine: "full, partial", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "tomatoes, carrots, beans, rosemary, cilantro, corn, peppers", foes: "cucumbers, lettuce"},
  {name: "rosemary", soil: "sandy, loamy", space: "24 - 36 inches", hardinesszone: "6, 7, 8, 9, 10", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beans, sage, cabbage, carrots, kale, broccoli", foes: "cucumbers"},
  {name: "sage", soil: "sandy, loamy", space: "24 - 30 inches", hardinesszone: "5, 6, 7, 8, 9", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "beets, beans, peas, rosemary, strawberries, cabbage, carrots, oregano, tomatoes, broccoli, cauliflower, kale", foes: "cucumbers"},
  {name: "thyme", soil: "sandy", space: "9 inches", hardinesszone: "5, 6, 7, 8, 9", sunShine: "full, partial", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "cabbage, tomatoes, cauliflower, potatoes, strawberries, broccoli", foes: "cucumbers"},
]

HERBS.each do |herb|
  Herb.create(herb)
end

FLOWERS = [
  {name: "lavendar", soil: "sandy", space: " ", hardinesszone: "5, 6, 7, 8, 9", sunShine: " ", start: " ", special: " ", deep: " ", time: " ", photo: " ", companions: " ", foes: "cucumbers"},
  {name: "marigolds", soil: "clay, loamy, sandy", space: "12 - 24 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "outdoors", special: " ", deep: " ", time: " ", photo: " ", companions: "basil, cucumbers, potatoes, squash, tomatoes, watermelons, cantaloupe, kale", foes: "beans, cabbage"},
  {name: "nasturtiums", soil: "chalky, loamy, sandy, peaty", space: "10 - 12 inches", hardinesszone: "4, 5, 6, 7, 8, 9, 10, 11", sunShine: "full", start: "indoors", special: " ", deep: " ", time: " ", photo: " ", companions: "melons, ", foes: " "},
  {name: "sunflowers", soil: "loamy, sandy", space: "24 - 30 inches", hardinesszone: "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12", sunShine: "full", start: "outdoors", special: "attracts birds and butterflies", deep: " ", time: " ", photo: " ", companions: "corn, cucumbers, lettuce, melons", foes: "potatoes"}
]

FLOWERS.each do |flower|
  Flower.create(flower)
end
