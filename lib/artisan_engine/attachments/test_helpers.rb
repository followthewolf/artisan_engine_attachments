module ArtisanEngine
  module Attachments
    module TestHelpers
      
      def test_image
        File.dirname( __FILE__ ) + '/test_images/spartan.jpg'
      end
      
      module Integration
        def attach_test_image_to( attachable, options = {} )
          path = options[:path] || polymorphic_path( attachable, :action => :edit )
          
          visit path
        
          within '#new_image' do
            fill_in      'Name',   :with => 'Test Image'
            attach_file  'Image',  test_image

            click_button 'Attach New Image'
          end
        end
      end
    end
  end
end