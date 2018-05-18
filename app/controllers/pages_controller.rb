class PagesController < ApplicationController
  before_action :logged_in_user, only: [:admin]
  def home
  end
  
  def admin
  end

  def slug
  end

  def slug2

  end
end
