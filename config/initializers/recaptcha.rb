# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.public_key  = '6LfD9B0TAAAAAJLp98aF4VWFIKMFoBvfhE2QAnxp'
  config.private_key = '6LfD9B0TAAAAAP-SVrWEPF5ecgxcSjMMVaL_ErS5'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end