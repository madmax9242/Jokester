class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]




	def index
		@users = Users.all
		@jokes = Jokes.all
	end


	def show


	end


	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
	    if @user.save
	      log_in @user
	      flash[:success] = "Welcome to Jokester!"
	      redirect_to @user
	    else
	      render 'new'
	    end
	end


	def edit


	end


	def update
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'You have been updated!' }
	      else
	        format.html { render :edit }
	      end
  		end
	end


	def destroy
		@user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url, notice: 'User has been successfully deleted!' }
	      format.json { head :no_content }
	    end
	end

	private
  	def set_user
      @user = User.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
    end

end
