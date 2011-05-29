require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature "Remove an image from an attachable", %q{
  In order to manage my attachable's images
  As an artisan
  I want to delete an image from an attachable.
} do
  
  background do
    # Given I have created an attachable with an image,
    walt_disney = Cyborg.create!
    attach_test_image_to walt_disney
    
    # And I am on the Attachable's edit page,
    # ( Demo for the Attach an Image interface. )
    visit "/cyborgs/#{ walt_disney.id }/edit"
    
    # And I have clicked the image's Delete button,
    within '.image' do
      click_button 'Delete'
    end
  end
  
  scenario "I can delete an image from an attachable" do
    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Image was successfully destroyed.'
    
    # And I should see no images.
    page.should have_no_selector '.image'
  end
  
  scenario "I can delete an image from an attachable via AJAX", :js => true do
    # When I confirm in the modal window,
    accept_confirmation
    
    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Image was successfully destroyed.'
    
    # And I should see no images.
    page.should have_no_selector '.image', :visible => true
  end
end