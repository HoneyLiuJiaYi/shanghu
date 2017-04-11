class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    merchant = Merchant.find_by_mail(merchant_params[:mail]).try(:authenticate, merchant_params[:password])
    if merchant
      session[:current_merchant_id] = merchant.id
      render :plain => '登录成功'
    else
      render :plain => '登录失败'
    end
  end

  def destroy
    session[:current_merchant_id] = nil
    render :plain => '成功推出'
  end

  private
  def merchant_params
    params.permit(:mail, :password)
  end
end
