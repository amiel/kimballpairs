class SubmissionMailer < ActionMailer::Base
  default from: "from@example.com",
    to: "rodkimball@me.com", cc: 'amiel.martin@gmail.com'

  def notification(submission)
    @submission = submission

    mail subject: "New kimball pair"
  end
end
