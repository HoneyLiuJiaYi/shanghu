class LoginController < ApplicationController
  def new
  end

  def create
    merchant = Merchant.find_by_mail(merchant_params[:mail]).try(:authenticate, user_params[:password])
    if merchant
      render :plain => '登录成功'
    else
      render :plain => '登录失败'
    end
  end

  private
  def merchant_params
    params.permit(:mail, :password)
  end
end
