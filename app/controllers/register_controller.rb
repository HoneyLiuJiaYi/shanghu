class RegisterController < ApplicationController
  require "base64"
  skip_before_filter :verify_authenticity_token
  def new
    @merchant = Merchant.new
  end

  def sendMail
    @path = request.host_with_port.to_s
    @s = Base64.encode64(params[:nick] + ';' + params[:password] + ';' + params[:mobile] + ';' + params[:mail] + ';' + (Time.now + 60 * 30).to_s )
    # @s = "?nick=" + params[:nick] + "&password=" + params[:password] + "&mobile=" + params[:mobile] + "&mail=" + params[:mail]
    puts @path
    begin
      MerchantMailer.send_mail(@s, params[:mail], @path).deliver
    rescue
      render :plain => '邮箱出错'
    end
  end

  def create
    @s = Base64.decode64(params[:msg]).split(';')
    @time = @s.at(4)
    @merchant = Merchant.new(:nick => @s.at(0), :password => @s.at(1), :mobile => @s.at(2), :mail => @s.at(3))
    if Time.now.inspect > @time
      render :plain => '超时'
    else
      if @merchant.save
        render :plain => "创建成功"
      else
        render :plain => "创建失败"
      end
    end
  end

  private
  def merchant_params
    # params.permit(:nick, :password, :password_confirmation, :mobile, :mail)
    params.permit(:nick, :password, :mobile, :mail)
  end
end
