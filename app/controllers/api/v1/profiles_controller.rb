class Api::V1::ProfilesController < ApplicationController


  def create
    begin
        @user = User.find_by_authentication_token(params[:user_token])
        #@user = User.find_by_email(params[:user_email])
        if @user && @user.profile == nil
           @new_profile = Profile.new(set_profile)
           if @user.profile = @new_profile
              render json: @new_profile.as_json()
           else
              render json: "0", status: :Profile_Not_Saved
           end
        else
           render json: "-1", status: :User_Not_Found
        end
    rescue
      render json: "-2"
    end
  end

  def update
       begin
           @user = User.find_by_authentication_token(params[:user_token])
           if @user && @user.profile != nil
              @profile_to_be_Changed = @user.profile
              if @profile_to_be_Changed.update(set_profile)
                 render json: @profile_to_be_Changed.as_json()
              else
                 render json: "0", status: :Profile_Not_Update
              end
           else
              render json: "-1", status: :User_Not_Found
           end
       rescue
         render json: "-2"
       end
   end

   def update_img
    begin
       @user = User.find_by_authentication_token(params[:user_token])
       if @user && @user.profile != nil
          @profile_img_to_be_Changed = @user.profile
          if @profile_img_to_be_Changed.update(update_img_url)
             render json: @profile_img_to_be_Changed.as_json()
          else
             render json: "0", status: :Profile_Img_Not_Update
          end
       else
          render json: "-1", status: :User_Not_Found
       end
    rescue
     render json: "-2"
    end
  end

  def set_online
    begin
      @user = User.find_by_authentication_token(params[:user_token])
      if @user && @user.profile != nil
        @set_profile_online = @user.profile
        @set_profile_online.is_online = true
        if @set_profile_online.save
          render json: "1", status: :make_online
        else
          render json: "0", status: :Still_Offline
        end
      else
        render json: "-1", status: :User_Not_Found
      end
    rescue
      render json: "-2"
    end
  end

  def set_offline
    begin
      @user = User.find_by_authentication_token(params[:user_token])
      if @user && @user.profile != nil
        @set_profile_offline = @user.profile
        @set_profile_offline.is_online = false
        if @set_profile_offline.save
          render json: "1", status: :make_offline
        else
          render json: "0", status: :Still_Online
        end
      else
        render json: "-1", status: :User_Not_Found
      end
    rescue
      render json: "-2"
    end
  end

  private

  def set_profile
    params.require(:profile).permit(:first_name, :last_name, :state, :city, :country, :code, :provider, :phone_no, :provider_id,:img_url)
  end

  def update_img_url
     params.require(:profile).permit(:img_url)
  end

end
