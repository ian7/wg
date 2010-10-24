class AuthenticationsController < ApplicationController
  def index
    #@authentications = Authentication.all
    @authentications = current_user.authentications if current_user
  end
  
  def create
    #render :text => request.env["rack.auth"]
    #return 
    
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

    if authentication 
      flash[:notice] = "Sign-in uccess !"
      sign_in_and_redirect(:user, authentication.user )      
    else 
      if current_user
        current_user.authentications.create(:provider => omniauth['provider'], :uid=>omniauth['uid'])
        flash[:notice] = "Auth Success !"
        redirect_to authentications_url
      else
        user = User.new
        #user.authentications.build(:provider=>omniauth['provider'], :uid=>omniauth['uid'])
        user.apply_omniauth( omniauth )
        if user.save
          flash[:notice] = "Auth Success !"      
          sign_in_and_redirect(user, authentication.user )
        else
          session[:omniauth] = omniauth.except('extra')
          redirect_to new_user_registration_url
        end  
     end
    end
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
