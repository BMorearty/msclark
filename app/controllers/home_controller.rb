class HomeController < ApplicationController
  def index
    @courses = Course.order(:id).page(params[:page])
  end

  def fake_data
    Teacher.transaction { 1000.times { Teacher.create! name: Faker::Name.name } }
    Student.transaction { 5000.times { Student.create! name: Faker::Name.name, email: Faker::Internet.email } }
    num_teachers = Teacher.count
    Course.transaction { 5000.times { Course.create! name: Faker::Company.bs, description: Faker::Lorem.paragraph, teacher: Teacher.offset(rand(num_teachers)).first } }
    redirect_to root_path
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path, notice: "Logged out."
  end
end
