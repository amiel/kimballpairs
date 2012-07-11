class KimballPairsController < ApplicationController
  def index
  end

  def categories
    Category.all
  end
  helper_method :categories
end
