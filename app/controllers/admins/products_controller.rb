class Admins::ProductsController < AdminController
  skip_before_action :verify_authenticity_token
  before_action :set_product , only: [:edit,:update, :show]

  def index
    @stt = 0
  end

  def new
    @product = Product.new
    @product.options.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if  @product.save
        flash[:success] = "Product was successfuly created"
        redirect_to new_admins_product_path
      else
        format.js { render :validation_errors }
      end
    end
  end

  def edit
    @option_arr =  @product.options.group(:option_name).count.map { |k,v| k }.to_a.reverse
  end
  def update
    if @product.update(product_params)
      flash[:success] = "Product was successfuly updated"
      redirect_to edit_admins_product_path(@product)
    else
      respond_to do |format|
        format.js { render :validation_errors }
      end
    end
  end

  def show
  end

  def change_status
  end
  private
  def product_params
    if params[:product][:image] != nil
      params[:product][:image] =  Product.resize_product(params[:product][:image])
    end
    params.require(:product).permit(:name,:image,:brand_category_id, options_attributes: [:id,:option_name,:ingredient, :quantity,:pack,:price, :_destroy] )
  end
  def set_product
    if Product.exists? id: params[:id]
      @product = Product.find(params[:id])
    else
      redirect_to root_path
      flash[:danger] = "Product is not exist"
    end
  end
end
