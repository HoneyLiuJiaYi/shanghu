class ProductController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    @categories = Category.all
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new
    @product.name = params[:name]
    @product.price = params[:price]
    uploaded_io = params[:logo]
    @product.logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
    @category.products << @product
    if @product.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAll
    @category = Category.find(params[:category_id])
    if @category
      @products = Products.find_by :category_id => @category.id
      if @products
        render :json => {:status => 0, :msg => 'success', :products => @products}
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
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 2, :msg => "no this product"}
      end
    else
      render :json => {:status => 1, :msg => 'no this category'}
    end
  end
end
