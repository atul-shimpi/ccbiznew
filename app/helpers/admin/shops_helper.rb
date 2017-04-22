module Admin::ShopsHelper
	def admin_shop_action(shop, action)
		if action == "new"
			admin_shops_path(shop)
		else
			admin_shop_path(shop)
		end

	end
end
