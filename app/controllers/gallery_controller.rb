class GalleryController < ApplicationController
  def index
    json = GettyImageSearch.(params[:page])

    if json['ErrorCode']
      redirect_to action: 'index', status:303
    else
      @num_results = json['result_count']
      @images = GettyImageImagesFilter.(json['images'])
      @page = params[:page].to_i == 0 ? 1 : params[:page].to_i
      @last_page = @images.count < 9 ? true : false
    end
  end
end
