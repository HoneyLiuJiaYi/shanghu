class CategoryController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    @category = Category.new
    @category.name = params[:name]
    uploaded_io = params[:logo]
    # File.open(Rails.root.join("picture", uploaded_io.original_filename), "wb") do |file|
    #   file.write(uploaded_io.read)
    # end
    @category.logo = 'oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    #上传到七牛
    Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
    if @category.save
      render :plain => '添加种类成功'
    else
      render :plain => '添加种类失败'
    end
  end

  def showCategories
    @categories = Category.all
    render :json => {:categories => @categories}
  end

  private
  def category_params
    params.permit(:name)
  end
end
