class Tag < ActiveRecord::Base
  has_many :questions
end
