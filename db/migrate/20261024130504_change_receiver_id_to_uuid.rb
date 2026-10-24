class ChangeReceiverIdToUuid < ActiveRecord::Migration[8.2]

  def change
    remove_index :notice_notifications, name: 'index_notice_notifications_on_receiver_id'
    remove_column :notice_notifications, :receiver_id
    add_column :notice_notifications, :receiver_id, :uuid
    add_index :notice_notifications, :receiver_id
  end

end
