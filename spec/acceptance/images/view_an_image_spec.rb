require File.expand_path( '../../acceptance_helper', __FILE__ )

feature "View an Image", %q{
  In order to see an attachable's images
  As a patron
  I want to view an image.
} do
  
  background do
    # Given I have created an attachable with an image,
    @walt_disney = Cyborg.create!
    attach_test_image_to @walt_disney
    
    # And I am on the Attachable's show page,
    # ( Demo for the Show an Image interface. )
    visit "/cyborgs/#{ @walt_disney.id }"
  end
  
  scenario "I see the image if an image has been assigned" do
    # Then I should see the image.
    page.should have_selector 'img[title="Test Image"]'
  end
  
  scenario "I can click the image to see a full-size version" do
    # When I click the image,
    click_link 'Test Image'
    
    # Then I should see the full-size image,
    page.should have_selector 'img[title="Test Image"]'
  end
  
  scenario "I can click the image to see a full-size version in a Lightbox", :js => true do
    # When I click the image,
    click_link 'Test Image'
    
    # Then I should see the image within a Lightbox,
    page.should have_selector '#colorbox img[title="Test Image"]'
  end
end