class SubmissionsController < ApplicationController

  respond_to :html

  def new
    respond_with(@submission = Submission.new)
  end

  def create
    @submission = Submission.create(params[:submission])
    @submission.notification_email.deliver
    flash[:alert] = "Your submission has been sent. If it is approved, it will appear on this website"
    respond_with @submission, location: root_path
  end

end
