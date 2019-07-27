class Admins::BrandsController < AdminController
  before_action :set_brand, only: [:edit, :update]

  def index
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.category_ids << params[:category_ids]
    respond_to do |format|
      if @brand.save
        format.html { redirect_to admins_brands_index_path, notice: 'Brand was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    arr_category =  params[:category_ids].map(&:to_i)
    arr_category = arr_category.uniq
    arr_category = arr_category.flatten
    @brand.update_attribute(:category_ids, arr_category)
    respond_to do |format|
      if @brand.update(brand_params)
        flash[:notice] =  'Brand was successfully updated.'
        format.js {render inline: "location.reload();" }
      else
        render 'edit'
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end


  end

  def change_status
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    if params[:category_ids] != nil
      params[:category_ids].uniq!
      params[:category_ids].join.to_i
    end
    params.require(:brand).permit(:name,category_ids: [])
  end

end
