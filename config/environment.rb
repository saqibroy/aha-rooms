# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

  config.action_mailer.delivery_method = :smtp
# SMTP settings for gmail
config.action_mailer.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => 'aharoomservice@gmail.com',
 :password             => 'booked1!',
 :authentication       => :login,
:enable_starttls_auto => true
}

