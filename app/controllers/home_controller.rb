class HomeController < ApplicationController
  def root
    @all_hotels=Hotel.all.paginate(:page => params[:page],:per_page => 5)
  end

  def hotels_list
  end
end
