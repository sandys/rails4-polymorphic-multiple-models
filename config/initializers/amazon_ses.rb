ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :server => 'email.us-east-1.amazonaws.com',
  :access_key_id     => 'AKIAJ3AAWIDLHAGGXDWA',
  :secret_access_key => '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'
