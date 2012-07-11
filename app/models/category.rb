class Category < ActiveRecord::Base
  validates_presence_of :title
  has_many :kimball_pairs

  def to_s
    title
  end
  alias_method :display_name, :to_s
end
