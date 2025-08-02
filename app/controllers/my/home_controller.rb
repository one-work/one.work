class My::HomeController < My::BaseController
  before_action :set_card_templates, :set_wallet_template, only: [:index]
  before_action :set_lawful_wallet, only: [:index]
  before_action :set_cart, only: [:index]

  def index
  end

end
