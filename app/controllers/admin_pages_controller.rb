class AdminPagesController < ApplicationController
  def index
    @styles = Style.all
    @bicycles = Bicycle.all
  end
end
