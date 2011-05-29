require 'spec_helper'

describe Image do
  let( :new_image ) { Image.new :name       => 'Nighthawks',
                                :image_file => 'some_image' }
  
  it "is valid with valid attributes" do
    new_image.should be_valid
  end
  
  context "validations: " do
    it "is not valid without a name" do
      new_image.name = nil
      new_image.should_not be_valid
    end
    
    it "is not valid without an image file" do
      new_image.image_file = nil
      new_image.should_not be_valid
    end
  end
  
  context "before saving: " do
    context "if the attachment is being cropped" do
      let( :image ) { Image.create! :name       => 'Test Image', 
                                    :image_file => test_image, 
                                    :crop_x     => 0, 
                                    :crop_y     => 0, 
                                    :crop_w     => 200, 
                                    :crop_h     => 200 }                                      
      
      it "saves the crop values" do
        image.crop_values.should == [ 0, 0, 200, 200 ]
      end
    end
  end
end