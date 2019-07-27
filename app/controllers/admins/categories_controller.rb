class Admins::CategoriesController < AdminController
  before_action :set_category, only: [:edit, :update]

  def index

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admins_categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        flash[:notice] =  'Category was successfully updated.'
        format.js {render inline: "location.reload();" }
      else
        render 'edit'
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end


  end

  def change_status
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
