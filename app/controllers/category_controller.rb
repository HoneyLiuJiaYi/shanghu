class CategoryController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    @category = Category.new
    @category.name = params[:name]
    uploaded_io = params[:logo]
    @category.logo = 'oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    #上传到七牛
    Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
    if @category.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showCategories
    @categories = Category.all
    if @categories
      @callback = params[:callback]
      h = Hash.new
      h[:categories] = @categories
      @a = @categories.to_json
      @b = @callback + "(" + @a + ")"
      render :plain => @b
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def deleteCategory
    @category = Category.find(params[:category_id])
    if @category.update_attributes!(:is_delete => 1)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  private
  def category_params
    params.permit(:name)
  end
end
