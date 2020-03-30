Rails.application.routes.draw do

  constraints host: ENV['ADMIN_HOST'] do
    devise_for :db_admin_users, ActiveAdmin::Devise.config.merge(:path => '')
    ActiveAdmin.routes(self)
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
