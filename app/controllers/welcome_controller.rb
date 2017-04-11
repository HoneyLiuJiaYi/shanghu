class WelcomeController < ApplicationController
  def index
    if current_merchant
      render :plain => '用户已经登录'
    else
      render :plain => '用户没有登录'
    end
  end
end
