class ApplicationMailbox < ActionMailbox::Base
  routing ->(email) { email.mail.from.end_with?('<weixinmphelper@tencent.com>') } => :wechat
  routing /@mail\.work\.design/i => :attachment
end
