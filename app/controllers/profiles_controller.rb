class ProfilesController < ApplicationController
  def edit
    set_user
  end

  def update
    set_user
    if @user.update(profile_params)
      redirect_to root_path, notice: "Profile Updated successfully." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def account_setting; end

  private
  def profile_params
    params.require(:user).permit(:phone_no, :gender, :work, :pets, :driving_license_no, :date_of_birth)
  end

  def set_user
    @user = current_user
  end
end
