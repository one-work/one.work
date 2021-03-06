module Auth
  class MobileToken < VerifyToken
    include Model::VerifyToken::MobileToken

    def send_out(dev = true)
      return true if Rails.env.development? && dev
      SmsHelper.send(self.identity, code: self.token, time: '10分钟')
    end

  end
end
