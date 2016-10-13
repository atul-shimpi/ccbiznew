module ApplicationHelper
  require 'GalleryPresenter'
	def nav_path_for_shop
	if business_user_signed_in?
  	   business_user_shops_path
    elsif admin_signed_in?
      admin_shops_path
    end
	end
	def nav_path_for_offer
	if business_user_signed_in?
  	   business_user_offers_path
    elsif admin_signed_in?
      admin_offers_path
    end
	end
  def nav_path_for_event
  if business_user_signed_in?
       business_user_events_path
    elsif admin_signed_in?
      admin_events_path
    end
  end
  def nav_path_for_single_shop  
    if admin_signed_in?
      admin_single_business_users_path
    end
  end
  def nav_path_for_profile
    if business_user_signed_in?      
      business_user_business_user_path(current_business_user)
    elsif admin_signed_in?
      
    end
  end
  def nav_path_for_auction
    if business_user_signed_in?
      business_user_auctions_path
    elsif admin_signed_in?
      
    end
  end
  def nav_path_for_siteuser
    if business_user_signed_in?
      business_user_site_users_path
    elsif admin_signed_in?
      
    end
  end
  
  def unassignedplayers(auction_id)
    auction = Auction.find(auction_id)
    return auction.players.where(:team_id => nil)
  end
  def get_page_name(shopid, pagename, defaultname)
    pagename = Seodetail.where(:pagename => pagename, :shop_id => shopid)            
    if !pagename.blank?
      if pagename.first.pagealias
        return pagename.first.pagealias
      else
        return defaultname
      end
    else
      return defaultname
    end
  end
  def get_page_content    
    return !@seodetails.empty? ? @seodetails[0].pagecontent.html_safe : ''
  end
  def buildmenu(menuitems, issubmenu)    
    @attr = issubmenu ? ' class="nav navbar-nav"' : ' class="submenu"';    
    @menu = "<ul #{@attr}>";
    menuitems.each_with_index do |shoplink, index|      
      @submenu = Seodetail.where("parentpage = ? ", shoplink.id)      
      if !@submenu.empty?        
         @submenuelement = buildmenu(@submenu,true)
         
      else  
        @submenuelement = ""
      end
      #@menu += "<li>"
      if shoplink.extrapage
        @url = "<a href='/page/"+shoplink.id.to_s+"/"+shoplink.pagename+"'><span>"+shoplink.pagealias+"</span></a>";    
      else
        @url = "<a href='/"+shoplink.pagename+"'><span>"+shoplink.pagealias+"</span></a>";    
      end
      
      
      @menu += "<li>"+@url+@submenuelement+"</li>"
      
      @url = ""
    end
    @menu += "</ul>";
    return @menu.html_safe
  end
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize+"_fields", f: builder)
    end 
    link_to(name, '#', class: "add_fields", data: {id:id, fields: fields.gsub("\n", "")})
  end
  def content(c)
    Shortcode.register_presenter(GalleryPresenter)

    Shortcode.process(c)
    #parser = Shortcode::Parser.new
    #transformer = Shortcode::Transformer.new
    #parsed_hash = parser.parse(c)
    #render('business_user/elements/menubuilder')
    #transformer.apply(parsed_hash)
    
  end

  def content_html(c)
    raw content(c)
  end
  def run_test(test_name)
    #computation stuff
    render :partial => test_name
  end
end
