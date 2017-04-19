class StationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def getAllRegions
    @regions = Region.all
    if @regions
      render :json => {:status => 0, :msg => 'success', :data => {:regions => @regions}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def createStation
    @address = Address.where(:lat => params[:lat]).where(:lng => params[:lng])
    if @address
      render :json => {:status => 1, :msg => '站点已经存在'}
    else
      @address = Address.new(:lat => params[:lat], :lng => params[:lng], :comment => params[:comment])
      if @address.save
        @merchant = Merchant.find(params[:merchant_id])
        @region = Region.find(params[:region_id])
        @station = Station.new(:name => params[:name], :region => @region, :address => @address, :merchant => @merchant)
        if @station.save
          render :json => {:status => 0, :msg => 'success'}
        else
          render :json => {:status => 1, :msg => 'station 保存失败'}
        end
      else
        render :json => {:status => 1, :msg => 'address 保存失败'}
      end
    end
  end

  def destroyStation
    @station = Station.find(params[:station_id])
    if @station
      @address = Address.find(@station.address_id)
      @address.destroy
      @station.destroy
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showStation
    @stations = Station.find_by_merchant_id(params[:merchant_id])
    if @stations
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @stations}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
