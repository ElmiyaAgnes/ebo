class UsersController < ApplicationController
  
 def show
    p params
		@user = User.find(params[:id])
     @designations= Designation.all.map{ |d| [d.designation_name,d.id]}
	end
	def new
		@user = User.new
    @designations= Designation.all.map{ |d| [d.designation_name,d.id]}

	end
	

def create
  @user = User.new(user_params)
 
  if @user.save
    redirect_to @user
  else
    render 'new'
  end
end
def edit
  @user = User.find(params[:id])
   @designations= Designation.all.map{ |d| [d.designation_name,d.id]}
end
def destroy
  @user = User.find(params[:id])
  @user.destroy
 
  redirect_to users_path
end

def index
    @users = User.all
        @designations= Designation.all.map{ |d| [d.designation_name,d.id]}

  end
 def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
  @designations= Designation.all.map{ |d| [d.designation_name,d.id]}
end
private
  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :login_id,:employee_id, :date_of_birth, :gender, :time_zone, :designation_id, :date_of_joining, :education, :comments, :is_active, :deactivated_on, :reason, :work_phone)

  end

end


