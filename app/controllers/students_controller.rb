class StudentsController < ApplicationController
  before_action :set_student, only: [ :archive, :activate ]

  def index
    @students = Student.all
  end

  def archive
    @student.archive!
    redirect_to students_path, notice: "Student archived"
  end

  def activate
    @student.activate!
    redirect_to students_path, notice: "Student activated"
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end
end
