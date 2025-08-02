class AdminController < ApplicationController
  include Org::Controller::Admin
  include Com::Controller::Admin
  include Roled::Controller::Admin
  before_action :require_org_member, :require_role

end
