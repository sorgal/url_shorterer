Rails.application.routes.draw do
  resources :urls, only: %i[create show], param: :slug do
    get :stats, on: :member
  end
end
