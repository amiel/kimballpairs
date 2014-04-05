class SubmissionsController < ApplicationController

  respond_to :html

  def new
    respond_with(@submission = Submission.new)
  end

  def create
    @submission = Submission.create(params[:submission])
    @submission.notification_email.deliver
    respond_with @submission, location: root_path
  end

end
