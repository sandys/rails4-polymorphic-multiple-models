ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :server => 'email.us-east-1.amazonaws.com',
  :access_key_id     => 'AK',
  :secret_access_key => 'Wr+vP'
