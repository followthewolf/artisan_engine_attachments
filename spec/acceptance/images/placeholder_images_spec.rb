require File.expand_path( '../../acceptance_helper', __FILE__ )

feature "Placeholder Images", %q{
  In order not to be shocked and dismayed by the layout breaking
  As a patron
  I want to see placeholders for images that don't exist.
} do
  
  background do
    # Given I have created an attachable with no images,
    @walt_disney = Cyborg.create!
    
    # And I am on the Attachable's show page,
    # ( Demo for Placeholder Images. )
    visit "/cyborgs/#{ @walt_disney.id }"
  end

  scenario "I see a placeholder image if the layout calls for an image that doesn't exist" do
    # Then I should see a placeholder image.
    page.should have_selector 'img[title="Placeholder Image"]'
  end
end