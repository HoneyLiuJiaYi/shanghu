class SearchController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def findProducts
    @result = Product.ransack(:name_cont => params[:query])
    @products = @result.result(distinct: true)
    if @products
      render :json => {:status => 0, :msg => 'success', :data => {:products => @products}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def fuck
    products1 = Merchant.find(params[:merchant_id]).products.group(:category_id)
    @array = Array.new
    products1.each do |product1|
      @categoryId = product1.category_id

    end
    render :json => {data: @array}
  end
end
