require 'rails/generators/active_record'

module ArtisanEngine
  module Generators
    module Attachments
      class InstallGenerator < ActiveRecord::Generators::Base

        argument    :name, :default => 'attachments'
        source_root File.expand_path( '../templates', __FILE__ )
        
        def install_attachability
          Rails::Generators.invoke 'artisan_engine:attachability:install'
          sleep 1 # to prevent duplicate timestamps.
        end
        
        def copy_installation_migration
          migration_template 'migrations/install_attachments.rb', 
                             'db/migrate/install_attachments.rb'
        end
        
      end
    end
  end
end