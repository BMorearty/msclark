class Course < ActiveRecord::Base
  belongs_to :teacher, touch: true
  has_many :enrollments
  has_many :students, through: :enrollments

  validates_presence_of :teacher
end
