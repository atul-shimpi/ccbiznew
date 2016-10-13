class BusinessUser::ElementsController < ApplicationController
	layout false
	def show
		
		@shop = Shop.find(Rails.application.routes.recognize_path(URI(request.referer).path)[:shop_id])
		@page = Seodetail.find(Rails.application.routes.recognize_path(URI(request.referer).path)[:page_id])

		#@shop = Shop.find(1)
		#@page = Seodetail.find(22)
		render template: "business_user/elements/#{params[:page]}"
	end
end
