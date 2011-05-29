Rails.application.routes.draw do
  scope :module => :manage do
    resources :images, :only => [ :create, :edit, :update ]
    post '/:attachable_class/:attachable_id/images' => 'images#create', :as => 'images'
    delete '/:attachable_class/:attachable_id/images/:id' => 'images#destroy', :as => 'attachable_image'
  end
  
  resources :images, :only => [ :show ]
end