class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update]
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]
  before_action :require_mod, only: [:update]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully generated."
      redirect_to posts_path
    else
      render :new
    end
  end

  # def edit
  # end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated."
      redirect_to posts_path
    else
      render :edit
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

  private

  def set_category
    @category = Category.find_by slug: params[:id]
  end

end