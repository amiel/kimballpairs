class Submission < ActiveRecord::Base
  validates_presence_of :words
  # validates_presence_of :rationale
  has_one :kimball_pair

  scope :approved, joins(:kimball_pair)
  scope :unapproved, joins('LEFT OUTER JOIN "kimball_pairs" on "kimball_pairs"."submission_id" = "submissions"."id"').where('submission_id is NULL')

  def to_s
    words
  end
  alias_method :display_name, :to_s

  def notification_email
    SubmissionMailer.notification(self)
  end

  def name
    super.presence || 'N/A'
  end
end
