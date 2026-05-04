class StudentsController < ApplicationController
  before_action :set_student, only: [ :archive, :activate ]
  before_action :set_loans, only: [ :index ]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path, notice: "Student was successfully registered!"
    else
      render :new, status: :unprocessable_entity
    end
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

  def student_params
    params.require(:student).permit(:school_id, :first_name, :second_name, :email, :phone)
  end

    def set_loans
    @loans = Loan.where(active: true)
  end
end
