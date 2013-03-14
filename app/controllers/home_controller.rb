class HomeController < ApplicationController
   def index
    @courses = Course.order(:id).paginate(page: params[:page]).includes(:teacher)
    fresh_when last_modified: @courses.sort_by(&:updated_at).last.updated_at if @courses.present?
    # Could also use @courses.maximum(:updated_at), except it ignores pagination scope
  end

  def fake_data
    Teacher.transaction { 1000.times { Teacher.create! name: Faker::Name.name } }
    Student.transaction { 5000.times { Student.create! name: Faker::Name.name, email: Faker::Internet.email } }

    num_teachers = Teacher.count
    num_students = Student.count
    Course.transaction do
      5000.times do
        course = Course.create! name: Faker::Company.bs, description: Faker::Lorem.paragraph, teacher: Teacher.offset(rand(num_teachers)).first
        #rand(10).times { course.students << Student.offset(rand(num_students)) }
      end
    end

    redirect_to root_path
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path, notice: "Logged out."
  end
end
