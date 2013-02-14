class UsersController < ApplicationController
   before_filter :require_no_user, :only => [:new, :create]
   before_filter :require_user, :only => [:show, :edit, :update]

   def new
     @user = User.new
   end

   def create
     @user = User.new(params[:user])
     if @user.save
       flash[:notice] = "Account registered!"
       UserMailer.activation_email(@user, params[:user][:password]).deliver
       redirect_back_or_default root_url
     else
       render :action => :new
     end
   end

   def show
     @user = @current_user
   end

   def edit
     @user = @current_user
   end

   def update
     @user = @current_user # makes our views "cleaner" and more consistent
     if @user.update_attributes(params[:user])
       flash[:notice] = "Account updated!"
       redirect_to account_url
     else
       render :action => :edit
     end
   end
   def activate
     @user = User.find_by_persistence_token(params[:activation_code]) || (raise Exception)
      raise Exception if @user.active?

     if @user.activate!
       flash[:notice] = "Your account has been activated!"
       UserSession.create(@user, false) # Log user in manually
       UserMailer.welcome_email(@user).deliver
       redirect_to root_url
     else
       render :action => :new
     end

     end
end
