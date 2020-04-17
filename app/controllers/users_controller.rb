class UsersController < ApplicationController
  def new
  end

def show
    @user = User.find(params[:id])
  
end

def new
    @user = User.new
end

def create
    @user = User.new(params[:user])    # 実装は終わっていないことに注意!
    if @user.save
         
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      redirect_to @user
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


end
