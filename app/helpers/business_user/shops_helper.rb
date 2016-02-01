module BusinessUser::ShopsHelper
	def business_shop_action(shop, action)
		if action == "new" or action =="create"
			business_user_shops_path(shop)
		else
			business_user_shop_path(shop)
		end 
	end
end
