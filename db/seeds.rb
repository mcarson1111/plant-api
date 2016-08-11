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
  {name: "beans", soil: "loamy, clay, peaty", space: "6 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: "needs trellis", companions: "broccoli, carrots, cauliflower, corn, cucumbers, peas, potatoes, squash, strawberries, tomatoes, nasturtiums, marigolds, oregano, rosemary, spinach", foes: "beets, cabbage, garlic, onions, peppers, tomatoes"},
  {name: "beets", soil: "loamy, sandy, peaty, chalky", space: "6 inches", hardiness_zone: "2, 3, 4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "onions, lettuce, cabbage, cauliflower, broccoli, garlic, sage, tomatoes", foes: "beans"},
  {name: "broccoli", soil: "loamy, sandy, peaty", space: "24 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "indoors", special: " ", companions: "beans, onions, beets, garlic, lettuce, cucumbers, potatoes, sage, mint, rosemary, thyme, basil, dill, nasturtiums, marigolds, tomatoes", foes: "basil, peas, oregano, strawberries, tomatoes"},
  {name: "cabbage", soil: "loamy, sandy, peaty, chalky", space: "18 - 20 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "outdoor", special: "needs hardening off", companions: "beets, onions, cucumbers, dill, mint, oregano, rosemary, kale, lettuce, potatoes, sage, spinach, thyme, garlic, nasturtiums, peas", foes: "beans, basil, peppers, strawberries, tomatoes"},
  {name: "carrots", soil: "loamy, sandy, peaty", space: "3 - 4 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "beans, garlic, onions, lettuce, peas, parsley, peppers, rosemary, sage, tomatoes", foes: "dill"},
  {name: "cauliflower", soil: "loamy, peaty", space: "18 - 24 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10", sun: "full", start: "indoors", special: " ", companions: "beans, cucumbers, garlic, cabbage, beets, peas, tomatoes, potatoes, rosemary, spinach, nasturtiums, onions, sage, thyme", foes: "basil, tomatoes, strawberries"},
  {name: "corn", soil: "loamy, clay, sandy, chalky", space: "12 - 18 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "beans, cucumbers, lettuce, watermelon, cantaloupe, peas, potatoes, parsley, pumpkins, zucchini, squash, sunflowers, marigolds", foes: "tomatoes"},
  {name: "cucumbers", soil: "loamy, clay", space: "1 - 3 feet", hardiness_zone: "4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "outdoors", special: " ", companions: "beans, broccoli, corn, cabbage, cauliflower, lettuce, peas, sunflowers, dill, kale, marigolds, nasturtiums, onions, oregano, sunflowers, tomatoes", foes: "potatoes, sage, rosemary, basil, cilantro, mint, lavendar, parsley, thyme, dill, oregano"},
  {name: "garlic", soil: "loamy", space: "6 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "potatoes, beets, broccoli, carrots, cauliflower, cabbage, lettuce, tomatoes", foes: "beans, peas"},
  {name: "kale", soil: "loamy, peaty", space: "8 - 12 inches", hardiness_zone: "6, 7, 8, 9, 10, 11", sun: "full", start: "outdoors", special: " ", companions: "beets, beans, cucumbers, garlic, lettuce, mint, nasturtiums, onions, spinach, thyme, cabbage, dill, potatoes, rosemary, sage", foes: "basil, strawberries, tomatoes"},
  {name: "lettuce", soil: "loamy, sandy, peaty", space: "12 - 14 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10, 11, 12", sun: "partial", start: "outdoors", special: " ", companions: "beans, corn, onions, broccoli, cucumbers, cabbage, beets, carrots, peas, potatoes, spinach, strawberries, sunflowers, marigolds, tomatoes", foes: "parsley, cabbage"},
  {name: "onions", soil: "loamy", space: "10 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "beets, broccoli, cabbage, carrots, lettuce, peppers, potatoes, spinach, tomatoes, rosemary, strawberries", foes: "beans, peas"},
  {name: "peas", soil: "loamy, peaty", space: "1 inch", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sun: "full, partial", start: "outdoors", special: "needs trellis", companions: "beans, corn, cabbage, cucumbers, lettuce, carrots, melons, potatoes, spinach, sage", foes: "onions, garlic"},
  {name: "peppers", soil: "loamy, clay, sandy", space: "12 - 18 inches", hardiness_zone: "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "indoors", special: " ", companions: "onions, basil, spinach, tomatoes", foes: "beans, cabbage"},
  {name: "potatoes", soil: "sandy, peaty", space: "2 - 3 feet", hardiness_zone: "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "outdoors", special: " ", companions: "beans, broccoli, corn, onions, cabbage, lettuce, kale, peas, garlic", foes: "cucumbers, pumpkins, squash, sunflowers, rosemary, strawberries, tomatoes"},
  {name: "pumpkins", soil: "loamy, sandy, well-drained", space: "6 - 12 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9", sun: "full", start: "outdoors", special: " ", companions: "beans, corn", foes: "potatoes"},
  {name: "spinach", soil: "loamy, peaty, chalky", space: "6 - 8 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10", sun: "full, partial", start: "outdoors", special: " ", companions: "beans, onions, peppers, cabbage, dill, lettuce, tomatoes, peas, strawberries", foes: " "},
  {name: "squash", soil: "loamy, clay, sandy", space: "2 - 3 feet", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10, 11, 12", sun: "full", start: "indoors", special: " ", companions: "beans, corn, strawberries", foes: "potatoes, pumpkins"},
  {name: "swiss chard", soil: "loamy, peaty", space: "10 - 12 inches", hardiness_zone: "5, 6, 7, 8, 9, 10", sun: "full, partial", start: " ", special: " ", companions: " ", foes: " "},
  {name: "tomatoes", soil: "loamy, clay, sandy", space: "2 feet", hardiness_zone: "2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12", sun: "full", start: "indoors", special: "needs support", companions: "onions, garlic, peppers, lettuce, carrots, basil, marigolds, melons, parsley, spinach, thyme", foes: "beans, broccoli, cabbage, corn, dill, potatoes, rosemary, peas, beets"},
  {name: "zucchini", soil: "loamy, sandy", space: "2 - 3 feet", hardiness_zone: "5, 6, 7, 8, 9", sun: "full", start: "indoor", special: " ", companions: "beans, nasturtiums, parsley, spinach, lavendar, sage, marigolds, rosemary", foes: " "},
]

VEGGIES.each do |veggie|
  Veggie.create(veggie)
end

FRUITS = [
  {name: "cantaloupe", soil: "loamy, clay, sandy", space: "36 - 42 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "inside", special: " ", companions: "corn, tomatoes, nasturtiums, peas, sunflowers", foes: "potatoes"},
  {name: "strawberries", soil: "loamy, sandy", space: "20 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "beans, lettuce, spinach", foes: "broccoli, cabbage, cauliflower"},
  {name: "watermelon", soil: "clay, sandy", space: "24 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "indoors", special: " ", companions: "corn, tomatoes, nasturtiums, peas, sunflowers", foes: "potatoes"},
]

FRUITS.each do |fruit|
  Fruit.create(fruit)
end

HERBS = [
  {name: "basil", soil: "peaty, loamy", space: "10 - 12 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10", sun: "full", start: "outdoors", special: " ", companions: "broccoli, peppers, tomatoes, marigolds", foes: "cucumbers, beans, broccoli, cauliflower, cabbage"},
  {name: "cilantro", soil: "peaty, loamy", space: "1 - 2 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10" sun: "full, partial", start: "outdoors", special: " ", companions: "cabbage, spinach, parsley, peas, potatoes, lettuce, tomatoes", foes: "cucumbers, dill"},
  {name: "dill", soil: "loamy", space: "18 inches", hardiness_zone: "3, 4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "outdoors", special: " ", companions: "broccoli, cauliflower, corn, lettuce, onions, cabbage, kale, spinach, cucumbers", foes: "carrots, cilantro, tomatoes"},
  {name: "mint", soil: "loamy", space: "24 inches", hardiness_zone: "4, 5, 6, 7, 8, 9", sun: "full", start: "indoors", special: " ", companions: "broccoli, cabbage, cauliflower, peas, squash, tomatoes", foes: "cucumbers"},
  {name: "oregano", soil: "loamy", space: "8 - 10 inches", hardiness_zone: "5, 6, 7, 8, 9, 10, 11, 12", sun: "full", start: "outdoors", special: " ", companions: "cabbage, tomatoes, carrots, peppers, squash, spinach, potatoes, peas, beans, beets, lettuce, onions, garlic", foes: "broccoli, cucumbers"},
  {name: "parsley", soil: "loamy, peaty", space: "6 - 8 inches", hardiness_zone: "6, 7, 8, 9", sun: "full, partial", start: "indoors", special: " ", companions: "tomatoes, carrots, beans, rosemary, cilantro, corn, peppers", foes: "cucumbers, lettuce"},
  {name: "rosemary", soil: "sandy, loamy", space: "24 - 36 inches", hardiness_zone: "6, 7, 8, 9, 10", sun: "full", start: "indoors", special: " ", companions: "beans, sage, cabbage, carrots, kale, broccoli", foes: "cucumbers"},
  {name: "sage", soil: "sandy, loamy", space: "24 - 30 inches", hardiness_zone: "5, 6, 7, 8, 9", sun: "full", start: "indoors", special: " ", companions: "beets, beans, peas, rosemary, strawberries, cabbage, carrots, oregano, tomatoes, broccoli, cauliflower, kale", foes: "cucumbers"},
  {name: "thyme", soil: "sandy", space: "9 inches", hardiness_zone: "5, 6, 7, 8, 9", sun: "full, partial", start: "indoors", special: " ", companions: "cabbage, tomatoes, cauliflower, potatoes, strawberries, broccoli", foes: "cucumbers"},
]

HERBS.each do |herb|
  Herb.create(herb)
end

FLOWERS = [
  {name: "lavendar", soil: "sandy", space: " ", hardiness_zone: "5, 6, 7, 8, 9", sun: " ", start: " ", special: " ", companions: " ", foes: "cucumbers"},
  {name: "marigolds", soil: "clay, loamy, sandy", space: "12 - 24 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "outdoors", special: " ", companions: "basil, cucumbers, potatoes, squash, tomatoes, watermelons, cantaloupe, kale", foes: "beans, cabbage"},
  {name: "nasturtiums", soil: "chalky, loamy, sandy, peaty", space: "10 - 12 inches", hardiness_zone: "4, 5, 6, 7, 8, 9, 10, 11", sun: "full", start: "indoors", special: " ", companions: "melons, ", foes: " "},
  {name: "sunflowers", soil: "loamy, sandy", space: "24 - 30 inches", hardiness_zone: "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12", sun: "full", start: "outdoors", special: "attracts birds and butterflies", companions: "corn, cucumbers, lettuce, melons", foes: "potatoes"}
]

FLOWERS.each do |flower|
  Flower.create(flower)
end