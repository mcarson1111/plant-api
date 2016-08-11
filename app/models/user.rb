class User < ActiveRecord::Base
  has_many :plots
end
