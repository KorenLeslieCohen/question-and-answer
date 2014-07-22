class StaticController < ApplicationController

  def show
    render params[:page]
  end

  # if this exists, render page, otherwise redirect

end
