class AdminPagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @styles = Style.all
    @bicycles = Bicycle.all
  end
end
