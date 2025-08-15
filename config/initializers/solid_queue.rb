SolidQueue.on_start do
  Com::SshKey.init_project unless Rails.env.local?
end