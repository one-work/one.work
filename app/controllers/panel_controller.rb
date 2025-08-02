class PanelController < ApplicationController
  include Com::Controller::Panel
  include Roled::Controller::Panel
  before_action :require_member_or_user
  before_action :require_role
  #after_action :set_flash, only: [:update, :create, :destroy]

end
