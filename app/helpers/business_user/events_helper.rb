module BusinessUser::EventsHelper
	def business_shop_events_action(event, action)
		if action == "new"
			business_user_events_path(event)
		else
			business_user_event_path(event)
		end

	end
end
