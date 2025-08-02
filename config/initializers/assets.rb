Rails.configuration.assets.paths += [
  Rails.root.join('node_modules/@fortawesome/fontawesome-free/webfonts'),
  Rails.root.join('app/assets/images'),
]

Rails.configuration.assets.excluded_paths << ActionText::Engine.root.join('app/assets/javascripts')
Rails.configuration.assets.excluded_paths << ActionView::Railtie.root.join('lib/assets/compiled')
