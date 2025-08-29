Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :schedules

  constraints ->(req) { req.subdomain.end_with?('panel') } do
    root to: 'panel/home#index', as: 'panel'
    namespace :wechat, defaults: { business: 'wechat' } do
      controller :wechat do
        get 'login' => :admin_login
      end
    end
  end
  constraints ->(req) { req.subdomain.end_with?('admin') } do
    root to: 'admin/home#index', as: 'admin'
    namespace :wechat, defaults: { business: 'wechat' } do
      controller :wechat do
        get 'user_login' => :admin_login
      end
    end
  end
  constraints ->(req) { req.subdomain.end_with?('agent') } do
    root to: 'agent/home#index', as: 'agent'
  end

  root to: 'home#index'
  controller :home do
    get :why
    get :soft
  end

  controller :oauth do
    match '/auth/alipay', action: 'alipay', via: [:get, :post]
  end

  namespace :admin do
    root 'home#index'
  end
  namespace :board do
  end

  namespace :my do
    root 'home#index'
    controller :home do
      get :driver
    end

  end

  scope :my, module: 'waiting/my', as: :my do
    resource :roles
    resources :logs
    resources :order_items
  end

  mount ActionCable.server => '/cable'
end
