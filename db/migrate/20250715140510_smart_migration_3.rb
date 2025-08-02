class SmartMigration3 < ActiveRecord::Migration[8.0]

  def change

    add_belongs_to :bench_facilitatings, :user, type: :uuid
  end

end
