class ProductController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    @categories = Category.all
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new
    @product.name = params[:name]
    uploaded_io = params[:logo]
    # File.open(Rails.root.join("picture", uploaded_io.original_filename), "wb") do |file|
    #   file.write(uploaded_io.read)
    # end
    @product.logo = 'oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
    @category.products << @product
    if @product.save
      render :plain => '商品创建成功'
    else
      render :plain => '商品创建失败'
    end
  end

  def showAll
    @category = Category.find(params[:category_id])
    if @category
      @products = Products.find_by :category_id => @category.id
      if @products
        render :json => {:status => 0, :msg => 'yes', :products => @products}
      else
        render :json => {:status => 2, :msg => "no this product"}
      end
    else
      render :json => {:status => 1, :msg => 'no this category'}
    end
  end

  def deleteProduct
    @category = Category.find(params[:category_id])
    if @category
      @product = @category.products.find(params[:product_id])
      if @product
        render :json => {:status => 0, :msg => 'yes'}
      else
        render :json => {:status => 2, :msg => "no this product"}
      end
    else
      render :json => {:status => 1, :msg => 'no this category'}
    end
  end
end
