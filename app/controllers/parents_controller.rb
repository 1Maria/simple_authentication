class ParentsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @parents = Teacher.find(session[:teacher_id]).parents
    @teacher = Teacher.find(session[:teacher_id])
  end

  # def show
  # end

  def new
    @parent = Parent.new
  end

  def edit
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to @parent, notice: 'Parent was successfully created.'
    else
      render :new
    end
  end

  def update
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'Parent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @parent.destroy
    redirect to parents_url, notice: 'Parent was successfully destroyed.'
  end

  private
  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:child_name, :parent_name, :email, :teacher_id, :created_at, :updated_at )
  end
end
