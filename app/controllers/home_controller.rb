class HomeController < ApplicationController

  layout 'application'
  
  def index
    @html_title =  "Home - "
    
    @maps = Map.where(:status => 4).order(:updated_at =>  :desc).limit(3).includes(:gcps)
    
    @layers = Layer.all.order(:updated_at => :desc).limit(3).includes(:maps)
        
    @my_maps = @current_user.maps.order(:updated_at => :desc).limit(3) if @current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @maps }
    end
  end

  def login

  end


end
