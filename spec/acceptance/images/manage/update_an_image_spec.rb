require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature "Update an image", %q{
  In order to change the display of my images
  As an artisan
  I want to update my image.
} do
  
  background do
    # Given I have created an attachable with an image,
    walt_disney = Cyborg.create!
    attach_test_image_to walt_disney
    
    # And I am on the Attachable's edit page,
    # ( Demo for the Attach an Image interface. )
    visit "/cyborgs/#{ walt_disney.id }/edit"
  end
  
  scenario "I can't update an image with invalid attributes", :js => true do
    # When I click the image,
    click_link 'Test Image'
    
    # And I fill in Name with nothing,
    within '#end_cropping' do
      fill_in 'Name', :with => ''
    end
    
    # And I click the Crop Image button,
    click_button 'Crop Image'

    # Then I should see an alert,
    page.should have_selector '.alert', :text => 'Image could not be saved.'
    
    # And my image should not be cropped.
    Image.first.crop_values.should be_nil
  end
end