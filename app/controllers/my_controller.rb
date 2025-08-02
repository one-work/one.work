class MyController < ApplicationController
  include Org::Controller::Me
  include Com::Controller::My
  include Trade::Controller::My
  before_action :require_user

end
