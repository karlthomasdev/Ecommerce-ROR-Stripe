class UsersController < ApplicationController
  respond_to :json

  def index
    @orders = current_user.orders
    @orders.sort
  end

  def create
    puts params[:customer]
    @customer = Customer.new user_params
    if @customer
      @customer.code = SecureRandom.urlsafe_base64
      @customer.expires_at = Time.now + 24.hours
      @customer.save
      ActivationMailer.signup_activation(@customer).deliver
      redirect_to login_path, 
      notice: "We've sent a validation email to #{@customer.email}. Please open your email and click the validation link to validate your account"
    else
      render :new
    end
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = current_user
    if (Order.where(customer_id: @customer.id).count == 0)
      flash[:notice] = "You have no orders"
    end
  end

  #email validation link was clicked, activate new account
  def edit
    @user = User.find_by(code: params[:code])
  	
    if @user
      if @user.expires_at < Time.now
        redirect_to signup_url, alert: "Your code has expired"
      end
    @user.code = nil
    @user.expires_at = nil
    @user.save
    #login the user
    session[:user_id] = @user.id
    redirect_to user_path(@user.id), alert: "Your account has been activated"
    end
  end

  def update
    order_to_update = Order.find params[:orderId]
    lesson_to_update = order_to_update.lessons.find params[:id]
    lesson_to_update.status = params[:status]
    lesson_to_update.dateused = params[:dateused]
    lesson_to_update.save
    render nothing: true
  end

  private

  def user_params
    params.require(:customer).permit(:email, :password, 
                                       :password_confirmation)
  end
end