class TinymceAssetsController < ApplicationController
	def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    uploader = StaticImagesUploader.new

    image = uploader.store!(params[:file])
    render json: {
      image: {
        url: uploader.url
      }
    }, content_type: "text/html"
  end
end
