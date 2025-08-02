RailsWechat.configure do |config|
  config.email_domain = 'mail.work.design'
  config.confirm = true
  config.rules.a1 = {
    msg_type: 'event',
    event: 'click',
    body: 'auth',
    proc: ->(request) {
      reply_params = {
        appid: request.appid,
        news_reply_items_attributes: [
          {
            title: '授权你的微信公众号',
            description: '本授权将允许 Work Design 代理运营部分功能，授权可随时取消',
            url: Wechat::Platform.first.click_auth_url
          }
        ]
      }

      Wechat::NewsReply.new(reply_params)
    }
  }
end
