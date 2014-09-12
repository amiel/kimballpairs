class KimballPairsController < ApplicationController
  def index
    @submission = Submission.new
  end

  def show
    @kimball_pair = KimballPair.find params[:id]
  end

  protected

  def categories
    Category.all
  end
  helper_method :categories
end
