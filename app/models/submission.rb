class Submission < ActiveRecord::Base
  validates_presence_of :words
  # validates_presence_of :rationale

  def to_s
    words
  end
  alias_method :display_name, :to_s
end
