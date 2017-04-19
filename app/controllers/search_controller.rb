class SearchController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def findProducts
    @result = Product.ransack(:cont => params[:query])
    @products = @result.result(distinct: true)
    if @products
      render :json => {:status => 0, :msg => 'success', :data => {:products => @products}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
