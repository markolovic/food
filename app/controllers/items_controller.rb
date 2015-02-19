class ItemsController < ApplicationController
  #respond_to :html, :js

  def index
    @items = Item.all
    respond_to do |format|
      format.js 
    end
  end

end
