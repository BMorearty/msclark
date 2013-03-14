class HomeController < ApplicationController
  def index
    @courses = Course.all
  end

  def fake_data
    100.times { Teacher.create! name: Faker::Name.name }
    1000.times { Student.create! name: Faker::Name.name, email: Faker::Internet.email }
    1000.times { Course.create! name: Faker::Company.bs, description: Faker::Lorem.paragraph, teacher: Teacher.offset(rand(Teacher.count)).first }
    redirect_to root_path
  end
end
