class BillingHoursController < ApplicationController
  unloadable
  before_filter :require_admin
  before_filter :find_project_by_project_id
  before_filter :set_billing_hours, only: [:edit, :update, :destroy]


  def new
    @billing_hour = BillingHour.new
  end

  def create
    @billing_hour = BillingHour.new(params[:billing_hour].permit!)
    @billing_hour.project_id = @project.id
    @billing_hour.user_id = User.current.id
    if @billing_hour.save
      flash[:notice] = t('notice_successful_create')
      redirect_to settings_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if   @billing_hour.update(params[:billing_hour].permit!)
      flash[:notice] = t('notice_successful_update')
      redirect_to settings_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @billing_hour.delete
    redirect_to settings_project_path(@project)
  end

  private

  def set_billing_hours
    @billing_hour = BillingHour.find(params[:id])
  end
end
