class RailsComMigration71 < ActiveRecord::Migration[6.0]

  def change







    add_reference :facilitates, :organ

    add_reference :facilitate_taxons, :organ
























































































    add_reference :absence_stats, :member


























































































































  end

end
