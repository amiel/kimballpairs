class KimballPair < ActiveRecord::Base
  belongs_to :category
  belongs_to :submission

  def to_s
    words
  end
  alias_method :display_name, :to_s

  def submitted_by
    submission.present? ? submission.name : nil
  end
end
