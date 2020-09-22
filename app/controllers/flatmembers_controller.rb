class FlatmembersController < ApplicationController

  before_action :set_flat, only: [:invite, :update, :send_invitations, :destroy]
  before_action :set_flatmember, only: :update
  def invite
  end

  def send_invitations
    user_emails = params[:member]

    user_emails.each do |email|
      user = User.find_by email: email

      if user
        # logic to add an existing user to the flat and send an email
        @flat.users.push(user)
      else
        user = User.invite!({ email: email }, current_user)
        user.flats.push @flat
      end
    end
    redirect_to flat_path(@flat)
  end

  def update
    if @flatmember.update(flatmember_params)
      redirect_to flat_path(@flat)
    else
      render flat_path(@flat)
    end
  end

  def destroy
    @flatmember.destroy
    redirect_to flat_path(@flatmember.flat_id)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_flatmember
    @flatmember = Flatmember.find(params[:id])
  end

  def flatmember_params
    params.require(:flatmember).permit(:is_admin)
  end
end
