class MenuPresenter  
  
  def self.for
    :menu
  end

  def initialize(attributes, content, additional_attributes)
    @attributes = attributes
    @content = content
    @additional_attributes = additional_attributes
    
  end
 
  def content    
    
    view = ActionView::Base.new(ActionController::Base.view_paths, {}, ActionController::Base.new)
      
    view.class_eval do
      include ApplicationHelper

    end
    
    @shop = current_shop
    view.render partial: "business_user/elements/menubuilder", locals: {:shop=>@shop}, :layout => false
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
  
end