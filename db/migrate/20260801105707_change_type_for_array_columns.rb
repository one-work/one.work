class ChangeTypeForArrayColumns < ActiveRecord::Migration[8.2]
  def change

    remove_column :com_acme_orders, :identifiers
    add_column :com_acme_orders, :identifiers, :jsonb

  end
end
