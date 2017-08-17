class VerificationsController < ApplicationController
  def index
    render :index
  end

  def create
    current_user.verification_code = 1_000_000 + rand(10_000_000 - 1_000_000)
    current_user.save

    to = current_user.mobile_number

    @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
    @twilio_client.account.sms.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to,
      body: "Your verification code is #{current_user.verification_code}."
    )
    redirect_to verifications_path, flash: { success: 'A verification code has been sent to your mobile. Please fill it in below.' }
    nil
  end

  def verify
    if current_user.verification_code == params[:verification_code]
      current_user.is_verified = true
      current_user.verification_code = ''
      current_user.save
      redirect_to root_path, flash: { success: 'Thank you for verifying your mobile number.' }
      nil
    else
      redirect_to verifications_path, flash: { errors: 'Invalid verification code.' }
      nil
    end
  end
end
