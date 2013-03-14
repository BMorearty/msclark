class EnrollmentsController < ApplicationController
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
end
