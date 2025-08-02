module Auth
  class GithubUser < OauthUser
    attribute :provider, :string, default: 'github'

    def assign_info(oauth_params)
      info_params = oauth_params.fetch('info', {})
      cred_params = oauth_params.fetch('credentials', {})
      raw_info = oauth_params.dig('extra', 'raw_info') || {}

      self.name = info_params['name']
      self.avatar_url = raw_info['avatar_url']
      self.access_token = cred_params['token']
    end

    def client
      @client ||= Octokit::Client.new access_token: self.access_token
    end

    def issues
    end

  end
end
