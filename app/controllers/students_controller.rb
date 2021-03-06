class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students = Student.order(:id).page(params[:page])
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new(name: Faker::Name.name, email: Faker::Internet.email)
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
      session[:current_user_id] = @student.id
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Logged in.'
    else
      render action: 'edit'
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to root_url
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :email)
  end
end
