class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  # def show
  #   @teacher = Teacher.find(params[:id])
  # end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = "Welcome to your Parent Roster!"
      redirect_to teachers_path, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email, :name, :password_digest )
  end

  def make_session(teacher)
    session[:teacher_id] = teacher.id
    session[:name] = "Jane Doe"
  end
end
