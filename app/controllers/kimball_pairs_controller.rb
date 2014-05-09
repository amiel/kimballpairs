class KimballPairsController < ApplicationController
  def index
    @submission = Submission.new
  end

  protected

  def categories
    Category.all
  end
  helper_method :categories
end
