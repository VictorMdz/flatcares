class FlatmembersController < ApplicationController
  def invite
    @flat = Flat.find(params[:flat_id])
  end

  def send_invitations
    @flat = Flat.find(params[:flat_id])
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

  def destroy
    @flatmember = Flatmember.find(params[:id])
    @flatmember.destroy
    redirect_to flat_path(@flatmember.flat_id)
  end
end
