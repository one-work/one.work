class AdminController < ApplicationController
  include Org::Controller::Admin
  include Com::Controller::Admin
  include Roled::Controller::Admin
  before_action :require_org_member, :require_role

  def xxx
    @orders_count = Order.default_where(default_params).count
    @items_count = Item.default_where(default_params).count
  end

end
