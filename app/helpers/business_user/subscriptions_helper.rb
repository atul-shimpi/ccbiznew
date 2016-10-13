module BusinessUser::SubscriptionsHelper
	def business_shop_subscriptions_action(subscription, action)
		if action == "new"|| action == "create"
			business_user_subscriptions_path(subscription)
		else
			business_user_subscription_path(subscription)
		end

	end	
end
