class Admin::RentHistoriesController < ApplicationController
  layout 'admin'
  def index
    @rent_histories = RentHistory.all.order('id DESC')
    @rent_histories = @rent_histories.page(params[:page]).per(15)
  end
end
