class Enrollment < ActiveRecord::Base
  belongs_to :course, touch: true
  belongs_to :student, touch: true
end
