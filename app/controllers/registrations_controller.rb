class RegistrationsController < Devise::RegistrationsController
  protected
   def after_sign_up_path_for(resource)
      user_path(resource,:path => "sign_up")
     end
 end

 def show
    p params
		@user = User.find(params[:id])
     @designations= Designation.all.map{ |d| [d.designation_name,d.id]}
	end
