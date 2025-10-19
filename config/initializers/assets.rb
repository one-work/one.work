Rails.configuration.assets.paths += [
  Rails.root.join('app/assets/images')
]

Rails.configuration.assets.excluded_paths += [
  ActionView::Railtie.root.join('app/assets/javascripts'),
  ActionText::Engine.root.join('app/assets/javascripts'),
  ActionCable::Engine.root.join('app/assets/javascripts'),
  ActiveStorage::Engine.root.join('app/assets/javascripts'),
  Turbo::Engine.root.join('app/assets/javascripts'),
  Trix::Engine.root.join('app/assets/javascripts'),
  Trix::Engine.root.join('app/assets/stylesheets')
]
