class HomeController < ApplicationController
  def index
  end

  def about
  end

  def members
    @members = Member.all
  end

  def recruit
  end
end
