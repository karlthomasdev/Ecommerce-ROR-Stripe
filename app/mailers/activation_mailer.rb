class ActivationMailer < ActionMailer::Base
  default from: "support@matchpoint.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.activation_mailer.signup_activation.subject
  #
  def signup_activation(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail to: @user.email, subject: "Match Point validate email"
  end
end