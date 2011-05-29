class ImagesController < FrontController
  def show
    @image = Image.find( params[:id] )
    render :show, :layout => false
  end
end