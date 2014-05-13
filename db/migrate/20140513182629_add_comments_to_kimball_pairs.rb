class AddCommentsToKimballPairs < ActiveRecord::Migration
  def change
    add_column :kimball_pairs, :comments, :text
  end
end
