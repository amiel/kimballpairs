class SubmissionsController < ApplicationController

  respond_to :html

  def new
    respond_with(@submission = Submission.new)
  end

  def create
    respond_with(@submission = Submission.create(params[:submission]), location: root_path)
  end

end
