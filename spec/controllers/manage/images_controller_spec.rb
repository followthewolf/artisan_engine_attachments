require 'spec_helper'

describe Manage::ImagesController do
  describe "POST :create" do
    context "if a return_to parameter is specified" do
      it "redirects to the return_to path after the action is complete" do
        controller.stub( :find_attachable_object )

        post :create, :attachable_class => 'Muffin', 
                      :attachable_id    => 1, 
                      :return_to        => '/muffin_tops'
        
        response.should redirect_to '/muffin_tops'
      end
    end
  end
end