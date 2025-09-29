class InvitationMailer < ApplicationMailer
  before_action :set_details

  def send_invite
    @url = confirm_invitation_url(token: @invitation.token)
    mail to: @invitation.email,
      subject: "🚀 You're Invited: Join #{@team.name} for UNICEF StartUp Lab Hack 🚀"
  end

  private

  def set_details
    @invitation = params[:invitation]
    @team = @invitation.team
    @owner = @team.hacker
  end
end
