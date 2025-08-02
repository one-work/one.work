module Notice
  class Notification < ApplicationRecord
    include Model::Notification
    include Send::Socket
    include Send::Wechat
  end
end
