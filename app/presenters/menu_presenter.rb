class MenuPresenter  
  require 'open-uri'
  include Rails.application.routes.url_helpers

  def self.for
    :menu
  end

  def initialize(attributes, content, additional_attributes)
    @attributes = attributes
    @content = content
    @additional_attributes = additional_attributes
    
  end
 
  def content    
    view_paths = Rails::Application::Configuration.new(Rails.root).paths["app/views"]
    view = ActionView::Base.new view_paths
    #view = ActionView::Base.new(ActionController::Base.view_paths, {}, ActionController::Base.new)
      
    view.class_eval do
      include ApplicationHelper
      include HomeHelper
      
      include ActionView::Helpers::UrlHelper
      include Rails.application.routes.url_helpers

    end
    
    @shop = current_shop     
    if !@additional_attributes[:pageid].blank?
      @page = Seodetail.find_by_slug(@additional_attributes[:pageid]) 
    else  
      if @additional_attributes[:custompageid].blank? || @additional_attributes[:custompageid].nil?
        @page = Seodetail.where('shop_id = ? and ishomepage = ?', @shop.id, 1)  
        @page =  @page[0]
      else
        @page = Seodetail.new
        @page.id = nil
      end
    end

    view.render partial: "business_user/elements/menubuilder", locals: {:shop=>@shop, :additional_attributes => @additional_attributes, :page=>@page}, :layout => false
    #renderpartial @content
  end

  def attributes
    
  end
  private
  def current_shop
    Shop.find(@attributes[:id])    
  end
  def renderpartial(partialname)
    
    run_test(partialname)
  end
  def h
    ActionController::Base.helpers
  end
end