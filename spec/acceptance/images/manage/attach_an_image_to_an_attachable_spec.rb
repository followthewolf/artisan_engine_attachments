require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature "Attach an image to an attachable", %q{
  In order to designate images for my models
  As an artisan
  I want to attach a new image to an attachable.
} do
  
  background do
    # Given an attachable model exists,
    @cyborg = Cyborg.create!
    
    # And I am on the Attachable's edit page,
    # ( Demo for the Attach an Image interface. )
    visit "/cyborgs/#{ @cyborg.id }/edit"
  end
  
  scenario "I can attach a valid new image to my attachable" do
    # When I upload a valid image,
    attach_test_image_to @cyborg
    
    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Image was attached successfully.'
    
    # And I should see my image.
    page.should have_selector '.image'
  end
  
  scenario "I cannot attach an invalid new image to my attachable" do
    # When I upload an invalid image,
    within '#new_image' do
      fill_in 'Name', :with => ''
      click_button 'Attach New Image'
    end
    
    # Then I should see an alert
    page.should have_selector '.alert', :text => 'Image could not be saved.'
    
    # And I should not see any images.
    page.should have_no_selector '.image'
  end
end