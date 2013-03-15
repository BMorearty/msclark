class HomeController < ApplicationController
  def index
    @courses = Course.order(:id).page(params[:page]).includes(:teacher)
    fresh_when @courses.sort_by(&:updated_at).last if @courses.present?
    # Could also use @courses.maximum(:updated_at), except it ignores pagination scope
  end

  def fake_data
    Teacher.transaction { teachers = Array.new(1000); Teacher.import [ :name ], teachers.map { |t| [ Faker::Name.name ] } }
    Student.transaction { students = Array.new(5000); Student.import [ :name, :email ], students.map { |s| [ Faker::Name.name, Faker::Internet.email ] } }
    num_teachers = Teacher.count
    Course.transaction do
      courses = Array.new(5000)
      Course.import [ :name, :description, :teacher_id ],
                    courses.map { |c| [ Faker::Company.bs, Faker::Lorem.paragraph, Teacher.offset(rand(num_teachers)).limit(1).pluck(:id).first ] }
    end
    redirect_to root_path
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path, notice: "Logged out."
  end
end
