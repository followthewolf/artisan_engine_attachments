require 'spec_helper'

describe ArtisanEngine::Attachments do
  it "is an Engine" do
    ArtisanEngine::Attachments::Engine.ancestors.should include Rails::Engine
  end
  
  it "initializes Dragonfly" do
    Dragonfly.should be_a Module
  end
  
  context "includes stylesheet expansions:" do
    context "artisan_engine:" do
      it "artisan_engine/attachments/back" do
        ActionView::Helpers::AssetTagHelper.stylesheet_expansions[ :artisan_engine ]
        .should include "artisan_engine/attachments/back"
      end
      
      it "artisan_engine/attachments/embed/jcrop/jquery.Jcrop" do
        ActionView::Helpers::AssetTagHelper.stylesheet_expansions[ :artisan_engine ]
        .should include "artisan_engine/attachments/embed/jcrop/jquery.Jcrop"
      end
    end
    
    context "artisan_engine_front:" do
      it "artisan_engine/attachments/front" do
        ActionView::Helpers::AssetTagHelper.stylesheet_expansions[ :artisan_engine_front ]
        .should include "artisan_engine/attachments/front"
      end
      
      it "artisan_engine/attachments/embed/jcrop/jquery.Jcrop" do
        ActionView::Helpers::AssetTagHelper.stylesheet_expansions[ :artisan_engine_front ]
        .should include "artisan_engine/attachments/embed/jcrop/jquery.Jcrop"
      end
    end
  end
  
  context "includes javascript expansions: " do
    it "artisan_engine/attachments/attachments.js" do
      ActionView::Helpers::AssetTagHelper.javascript_expansions[ :defaults ]
      .should include "artisan_engine/attachments/attachments"
    end
  end
end

describe "ArtisanEngine::Attachments Test/Development Environment" do
  it "initializes ArtisanEngine::Attachments" do
    ArtisanEngine::Attachments.should be_a Module
  end
  
  it "compiles its stylesheets into ArtisanEngine's stylesheets/artisan_engine/attachments directory" do
    Compass.configuration.css_path.should == "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/stylesheets/artisan_engine/attachments"
  end
  
  it "does not compile stylesheets during tests" do
    Sass::Plugin.options[ :never_update ].should be_true
  end
  
  it "compiles its javascripts into ArtisanEngine's javascripts/artisan_engine/attachments directory" do
    Barista.output_root.should == Pathname.new( "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/javascripts/artisan_engine/attachments" )
  end
end