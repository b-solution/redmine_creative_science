class ProjectClientOverviewController < ApplicationController
  unloadable
  before_filter :require_admin
  def index
  end
end
