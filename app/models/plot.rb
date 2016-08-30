class Plot < ActiveRecord::Base
    belongs_to :user
    has_many :veggies
    has_many :fruits
    has_many :herbs
    has_many :flowers
end
