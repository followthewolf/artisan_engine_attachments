class Image < ActiveRecord::Base
  can_attach
  
  attr_accessor         :crop_x, :crop_y, :crop_w, :crop_h
  serialize             :crop_values
  
  image_accessor        :image_file
  
  validates_presence_of :name, :image_file
                        
  before_save           :save_crop_values, :if => :cropping?
  
  private
    
    # Return true if the cropping attributes are all set, false if they are not.
    def cropping?
      !!crop_x and !!crop_y and !!crop_w and !!crop_h
    end
    
    # Make the given crop values into an array of integers in the order: [ X, Y, W, H ].
    def save_crop_values
      self.crop_values = [ crop_x.to_i, crop_y.to_i, crop_w.to_i, crop_h.to_i ]
    end
end