$stdout.sync = true

Bundler.require

Mail.defaults do
  delivery_method :smtp, {
    :address                    => 'smtp.sendgrid.net',
    :authentication       => 'plain',
    :domain               => 'heroku.com',
    :enable_starttls_auto => true,
    :password             => ENV['SENDGRID_PASSWORD'],
    :port                 => 587,
    :user_name            => ENV['SENDGRID_USERNAME']
  }
end
