class EmailLeadsController < ApplicationController

  def create
    render(json: {message: 'Please enter a valid email address.'}, status: 400) && return unless valid_email_address?
    render(json: {message: "Don't worry, you're already signed up."}, status: 200) && return if email_exists?

    @email_lead = EmailLead.new(email_lead_params)

    if @email_lead.save
      render json: { message: 'Thank you for signing up.' }
    else
      render json: { message: 'Oops, there was an error.' }
    end
  end

  private

  def email_lead_params
    params.require(:email_lead).permit(:email)
  end

  def valid_email_address?
    ValidateEmail.valid?(sent_email_address)
  end

  def sent_email_address
    params[:email_lead][:email]
  end

  def email_exists?
    EmailLead.exists?(email: sent_email_address)
  end

end
