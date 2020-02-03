class Stat < ApplicationRecord
  attribute :subscribed_requests_count, :integer
  attribute :oauth_users_count, :integer
  attribute :users_count, :integer
  attribute :requirements_count, :integer


  def xx(date = Date.today)
    self.oauth_users_count = OauthUser.default_where('created_at': date).count
    self.subscribed_requests_count = SubscribeRequest.default_where('created_at': date).count
    self.users_count = User.default_where('created_at': date).count
    self.requirements_count = Requirement.default_where('updated_at': date).count
    self
  end

end