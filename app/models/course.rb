class Course < ActiveRecord::Base
  belongs_to :teacher, touch: true

  validates_presence_of :teacher
end
