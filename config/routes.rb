Cogs::Application.routes.draw do
  resources :gears, :except => [:new, :edit]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'static#home'
end
