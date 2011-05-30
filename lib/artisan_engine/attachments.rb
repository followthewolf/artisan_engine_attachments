require 'artisan_engine/core'
require 'artisan_engine/attachability'
require 'dragonfly'
require 'artisan_engine/attachments'

module ArtisanEngine
  module Attachments
    
    mattr_accessor :s3_bucket
    @@s3_bucket = 'artisan_engine_bucket'

    # ------------------ Autoload Necessary Modules ------------------ #
    
    autoload :TestHelpers,  'artisan_engine/attachments/test_helpers' if Rails.env.test?
    autoload :ImagesHelper, 'artisan_engine/attachments/images_helper'
    
    # ------------------------- Vroom vroom! ------------------------- #
    
    class Engine < Rails::Engine
      config.before_configuration do
        ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :artisan_engine       => [ "artisan_engine/attachments/back",
                                                                                                     "artisan_engine/attachments/embed/jcrop/jquery.Jcrop" ],
                                                                          :artisan_engine_front => [ "artisan_engine/attachments/front",
                                                                                                     "artisan_engine/attachments/embed/jcrop/jquery.Jcrop" ]
      
        config.action_view.javascript_expansions[ :defaults ] += [ "artisan_engine/attachments/attachments" ] 
      end
      
      initializer 'include helpers' do
        ActiveSupport.on_load( :action_view ) { include ImagesHelper }
      end
      
      initializer 'set up Dragonfly' do |app|
        require 'artisan_engine/attachments/initializers/dragonfly'
        app.config.middleware.insert 0, 'Dragonfly::Middleware', :images
      end
            
    end

  end
end