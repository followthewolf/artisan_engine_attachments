require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Sort Images', %q{
  In order to manage the order of my images
  As an artisan
  I want to sort my images.
} do
  
  scenario "I can sort my images" do
    # This is a cheater spec because I don't know how to make Selenium drag/drop
    # properly. 
    
    # It just tests that Image is properly integrated with Listability
    # and assumes that the JS parameters are being sent properly.
    
    # If something goes wrong, check to make sure that sortable.serialize is
    # sending properly formatted parameters to the controller.
    
    # Given I have an attachable with three images attached to it,
    @cyborg = Cyborg.create!
    @image1 = Image.create! :name => 'Image 1', :image_file => test_image
    @image2 = Image.create! :name => 'Image 2', :image_file => test_image
    @image3 = Image.create! :name => 'Image 3', :image_file => test_image
    
    @image1.attach_to @cyborg
    @image2.attach_to @cyborg
    @image3.attach_to @cyborg
    
    # When I sort my images,
    page.driver.post "/manage/sort/Cyborg/#{ @cyborg.id }/Image", :image => [ "#{ @image3.id }", 
                                                                              "#{ @image2.id }", 
                                                                              "#{ @image1.id }" ]
                                                                         
    # And I visit the manage images demo page,
    visit "/cyborgs/#{ @cyborg.id }/edit"    
    
    # Then my images should be in their sorted order.
    all( '.image' )[0].first( 'img' )[:title].should == 'Image 3'
    all( '.image' )[1].first( 'img' )[:title].should == 'Image 2'
    all( '.image' )[2].first( 'img' )[:title].should == 'Image 1'
  end
end