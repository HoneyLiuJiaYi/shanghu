class OrderController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def getAllOrder
    if params[:merchant_id]
      @arr = []
      @products = Merchant.find(params[:merchant_id]).products
      @stations = Merchant.find(params[:merchant_id]).stations
      @stations.each do |station|
        @odr = Orderstation.where(:station_id => station.id)
        @odr.each do |od|
          @order = Order.find(od.order_id)
          if @order.is_del == 0 && @order.status == 4
            @flag = 0
            @products.each do |product|
              if product.id == @order.product_id.to_i
                @flag = 1
                break
              end
            end
            if @flag == 1
              @arr << @order
            end
          end
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:orders => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end


  def catchOrder
    if params[:order_id] && params[:merchant_id]
      @order = Order.find(params[:order_id])
      @merchant = Merchant.find(params[:merchant_id])
      if @order.update_attribute(:status, 5) && MerchantOrdership.create(:order => @order, :merchant => @merchant)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail to update'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def myOrder
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @orders = @merchant.orders
      arr = []
      @orders.each do |order|
        @mo = MerchantOrdership.where(:order => order).where(:merchant => @merchant).last
        if @mo.is_del == 0
          arr << order
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:orders => arr}}
    else
      render :json => {:status => 1, :msg => '参数不对'}
    end
  end

  def washFinsh
    if params[:order_id] && params[:merchant_id]
      ActiveRecord::Base.connection.execute 'delete from merchant_orderships where merchant_id=' + params[:merchant_id] + ' and order_id=' + params[:order_id]
      @order = Order.find(params[:order_id])
      @order.update_attribute(:status, 7)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
