class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson

  def show
  end

private

def require_authorized_for_current_lesson
  if !current_user.enrolled_in?(current_lesson.section.course)  # the enrolled_in? method takes an argument 
      redirect_to course_path(current_lesson.section.course), alert: 'You must enroll first'   # the url path may be course_path instead of courses_path
    end
  end

    helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  
end
