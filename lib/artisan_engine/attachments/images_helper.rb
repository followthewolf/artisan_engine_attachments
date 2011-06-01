module ArtisanEngine
  module Attachments
    module ImagesHelper

      # Display a user-cropped image if values have been set, otherwise display a
      # given size. Size defaults to 200x200#.
      def display_image( image, size = '200x200#', options = {} )
        return placeholder_image( size, options ) unless image
        
        options[ :alt ]   ||= "#{ image.name } Image"
        options[ :title ] ||= image.name
        options[ :crop ]  ||= true
    
        if image.crop_values and options[ :crop ] == true
          options.delete :crop
          image_tag user_cropped_image( image, size ), options
    		else
    		  options.delete :crop
    		  image_tag default_cropped_image( image, size ), options
    	  end
      end
      
      def placeholder_image( size = '200x200#', options = {} )
        width  = size.split( 'x' )[0]
        height = size.split( 'x' )[1].gsub( '#', '' )
        
        options[ :alt ]   ||= 'Placeholder Image'
        options[ :title ] ||= 'Placeholder Image'
        options[ :style ] ||= "width: #{ width }px; height: #{ height }px;"
        
        image_tag 'artisan_engine/attachments/placeholder.jpg', options
      end
      
      private
  
        def user_cropped_image( image, size )
          image.image_file.process( :crop,
                                    :x 		  => image.crop_values[0], 
      							                :y 		  => image.crop_values[1], 
      							                :width 	=> image.crop_values[2], 
      							                :height => image.crop_values[3] ).thumb( size )
      							                                                 .url
      	end
	
      	def default_cropped_image( image, size )
      	  image.image_file.thumb( size ).url
        end
    
    end
  end
end