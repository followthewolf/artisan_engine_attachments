Dummy::Application.routes.draw do
  scope :module => :manage do
    resources :cyborgs, :only => [ :edit ]
  end
  
  resources :cyborgs, :only => [ :show ]
end
