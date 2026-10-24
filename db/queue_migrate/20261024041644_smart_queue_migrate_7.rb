class SmartQueueMigrate7 < ActiveRecord::Migration[8.2]

  def change

    create_table :solid_queue_batches, id: :uuid, default: "uuidv7()" do |t|
      t.string :on_finish
      t.string :on_success
      t.string :on_failure
      t.string :metadata
      t.timestamps
    end unless table_exists? :solid_queue_batches    

    create_table :solid_queue_batch_executions, id: :uuid, default: "uuidv7()" do |t|
      t.belongs_to :job, type: :uuid
      t.belongs_to :batch, type: :uuid
      t.timestamps
    end unless table_exists? :solid_queue_batch_executions    
  end

end
