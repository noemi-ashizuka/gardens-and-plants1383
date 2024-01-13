Rails.application.routes.draw do
  root to: 'gardens#index'

  # As a user I can see one garden's plants
  resources :gardens, only: [:show, :index] do
    # As a user I can add a plant in a garden
    # POST gardens/:id/plants
    resources :plants, only: [:create]
  end

  # As a user I can delete a plant
  resources :plants, only: [:destroy] do
    resources :plant_tags, only: [:new, :create]
  end
end
