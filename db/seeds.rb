# frozen_string_literal: true

{
  'factory/agent/productions#index' => 'person-chalkboard',
  #'trade/admin/payments#uncheck' => 'cash-register',
  'trade/admin/orders#index' => 'list',
  'trade/admin/orders#delivery' => 'list',
  'trade/in/orders#index' => 'list-check',
  'space/admin/desks#all' => 'chair',
  'factory/admin/products#index' => 'list-tree',
  'org/admin/members#index' => 'user-gear'
}.each do |identifier, icon|
  r = Roled::Menu.find_or_initialize_by(identifier: identifier)
  r.icon = icon
  r.save!
end
