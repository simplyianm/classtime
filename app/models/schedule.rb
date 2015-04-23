class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :semester
  has_many :courses
end
