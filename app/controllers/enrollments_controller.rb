class EnrollmentsController < ApplicationController
  before_filter :check_enrollment, only: :create

  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      redirect_to @enrollment.course, notice: "Congratulations. You are enrolled in #{@enrollment.course.name}."
    end
  end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end

  def check_enrollment
    if Enrollment.where(params[:enrollment]).count > 0
      redirect_to Course.find(enrollment_params[:course_id]), alert: "Dude. You're already enrolled in that course."
    end
  end
end
