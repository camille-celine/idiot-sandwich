class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @recipes = policy_scope(Recipe)
  end

  def about
  end

  def contact
  end
end
