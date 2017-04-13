class RegisterController < ApplicationController
  require "base64"
  skip_before_filter :verify_authenticity_token
  def new
    @merchant = Merchant.new
  end

  def sendMail
    @path = request.host_with_port.to_s
    if params[:license]
      render :json => {:status => 1, :msg => 'no license'}
    end
    uploaded_io = params[:license]
    Image.upload(params[:license].tempfile.path, uploaded_io.original_filename)
    @license = 'oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    @s = Base64.encode64(params[:nick] + ';' + params[:password] + ';' + params[:mobile] + ';' + params[:mail] + ';' + (Time.now + 60 * 30).to_s + ';' + @license )
    puts @path
    begin
      MerchantMailer.send_mail(@s, params[:mail], @path).deliver
      render :json => {:status => 0, :msg => 'success'}
    rescue
      render :json => {:status => 1, :msg => 'no this mail'}
    end
  end

  def create
    @s = Base64.decode64(params[:msg]).split(';')
    @time = @s.at(4)
    @merchant = Merchant.new(:nick => @s.at(0), :password => @s.at(1), :mobile => @s.at(2), :mail => @s.at(3), :license => @s.at(5))
    if Time.now.inspect > @time
      render :json => {:status => 1, :msg => 'out time'}
    else
      if @merchant.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  private
  def merchant_params
    # params.permit(:nick, :password, :password_confirmation, :mobile, :mail)
    params.permit(:nick, :password, :mobile, :mail)
  end
end
