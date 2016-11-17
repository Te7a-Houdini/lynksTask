class AdminPagesController < ApplicationController
  def index
    @styles = Style.all
  end
end
