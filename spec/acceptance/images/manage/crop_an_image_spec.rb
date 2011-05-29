require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature "Crop an image", %q{
  In order to change the display of my images
  As an artisan
  I want to crop my images.
} do
  
  background do
    # Given I have created an attachable with an image,
    walt_disney = Cyborg.create!
    attach_test_image_to walt_disney
    
    # And I am on the Attachable's edit page,
    # ( Demo for the Attach an Image interface. )
    visit "/cyborgs/#{ walt_disney.id }/edit"
  end
  
  scenario "I can crop an image via AJAX", :js => true do
    # When I click the image,
    click_link 'Test Image'
    
    # And I click the Crop Image button,
    click_button 'Crop Image'

    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Image was successfully updated.'
    
    # And my image should be cropped.
    Image.first.crop_values.should_not be_nil
  end
end