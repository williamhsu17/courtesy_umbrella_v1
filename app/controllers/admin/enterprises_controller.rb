class Admin::EnterprisesController < ApplicationController
layout "admin"

  def index
    @enterprises = Enterprise.includes(:ad_cases, :active_ad_cases).all
  end

  def show
    @enterprise = Enterprise.find(params[:id])
    @ad_cases = AdCase.where(:enterprise_id => params[:id]).includes(:umbrellas)
  end
end
