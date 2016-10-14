class BusinessUser::PaymentsController < BusinessUser::BaseController
  before_filter :authenticate_business_user!
  

  def index
  	@shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }    
    @shop_usersids = SiteUser.where(shop_id:@shops_ids).all.map{ |siteuser|
      [siteuser.id]
    } 

  	@payments = Payment.where("site_user_id":@shop_usersids)
    
  end 

end

