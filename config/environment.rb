# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => 'smtpout.secureserver.net',
:domain  => 'www.aha-rooms.com',
:port      => 80,
:user_name => 'bookings@aha-rooms.com',
:password => 'Consultant25',
:authentication => :plain
}