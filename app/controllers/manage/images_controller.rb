module Manage
  class ImagesController < Manage::BackController
    respond_to :html, :js
    
    def edit
      @image = Image.find( params[ :id ] )
      render :edit, :layout => false
    end
    
    def create
      @image      = Image.new( params[ :image ] )
      @attachable = find_attachable_object
      
      if @image.save
        @attachable.attach @image
        flash[ :notice ] = 'Image was attached successfully.'
        redirect_to params[:return_to] || polymorphic_url( @attachable, :action => :edit )
      else
        flash[ :alert ] = 'Image could not be saved.'
        redirect_to params[:return_to] || polymorphic_url( @attachable, :action => :edit )
      end
    end
    
    update! do |success, failure|
      failure.js { flash.now[ :alert ] = 'Image could not be saved.'; render :update }
    end
    
    def destroy
      attachable_class = params[ :attachable_class ].to_s.classify.constantize
      attachable_id    = params[ :attachable_id ]
      attachable       = attachable_class.find( attachable_id )
      
      destroy! do |success, failure|
        success.html { redirect_to polymorphic_url( attachable, :action => :edit ) }
      end
    end
    
    private

      # Find the attachable object given to the controller.
      def find_attachable_object
        attachable_class = params[ :attachable_class ].constantize
        attachable_id    = params[ :attachable_id ]

        attachable_class.find( attachable_id )
      end
      
  end
end